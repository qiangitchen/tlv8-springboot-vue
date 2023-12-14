package com.tlv8.doc.clt.doc;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnamespaceService;
import com.tlv8.doc.clt.service.SaDocnodeService;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;

/**
 * 文档数据处理
 * 
 * @author 陈乾
 *
 */
@Component
public class DocDBHelper {
	@Autowired
	SaDocnodeService saDocnodeService;
	@Autowired
	SaDocnamespaceService saDocnamespaceService;

	/**
	 * 创建一个文档数据
	 * 
	 * @param docPath
	 * @param fileName
	 * @param contentType
	 * @param size
	 * @param cacheName
	 * @return
	 */
	public String addDocData(String docPath, String docName, String contentType, String size, String cacheName)
			throws Exception {
		String docID = IDUtils.getGUID();
		if ("/".equals(docPath)) {
			docPath = "/root";
		}
		String pdirpath = "";
		String pdirpathID = "";
		String dirpathID = "/root";
		String[] docDirs = docPath.split("/");
		String dirID = "root";
		List<SaDocnode> di = saDocnodeService.selectByDocpath(docPath);
		if (di.size() > 0) {
			SaDocnode dc = di.get(0);
			dirID = dc.getSid();
			dirpathID = dc.getSdocpath();
			pdirpath = dc.getSdocdisplaypath();
		} else if (docDirs.length > 2) {
			for (int n = 2; n < docDirs.length; n++) {
				String dir = docDirs[n];
				pdirpath += "/" + dir;
				List<SaDocnode> pdi = saDocnodeService.selectByDocDisplayPath(pdirpath);
				if (pdi.size() > 0) {
					SaDocnode dc = pdi.get(0);
					dirID = dc.getSid();
					pdirpathID = dc.getSdocpath();
				} else {
					dirID = IDUtils.getGUID();
					pdirpathID += "/" + dirID;
					List<SaDocnode> pdirs = saDocnodeService.selectByDocpath(dirpathID);
					if (pdirs.size() > 0) {
						SaDocnode pdir = pdirs.get(0);
						SaDocnode saDocnode = new SaDocnode();
						saDocnode.setSid(dirID);
						saDocnode.setSparentid(pdir.getSid());
						saDocnode.setSdocname(dir);
						saDocnode.setSkind("dir");
						saDocnode.setSdocpath("/root" + pdirpathID);
						saDocnode.setSdocdisplaypath("/文档中心" + pdirpath);
						saDocnode.setSflag(1);
						saDocnode.setVersion(0);
						saDocnodeService.insert(saDocnode);
					}
				}
				dirpathID += "/" + dirID;
			}
		}
		ContextBean context = ContextUtils.getContext();
		SaDocnode saDocnode = new SaDocnode();
		saDocnode.setSid(docID);
		saDocnode.setSparentid(dirID);
		saDocnode.setSdocname(docName);
		saDocnode.setSkind(contentType);
		saDocnode.setSsize(Double.parseDouble(size));
		saDocnode.setScachename(cacheName);
		saDocnode.setSdocpath(dirpathID + "/" + docID);
		saDocnode.setSdocdisplaypath(pdirpath + "/" + docName);
		saDocnode.setScreatorfid(context.getCurrentPersonFullID());
		saDocnode.setScreatorname(context.getCurrentPersonName());
		saDocnode.setScreatordeptname(context.getCurrentDeptName());
		saDocnode.setScreatetime(new Date());
		saDocnode.setSeditorfid(context.getCurrentPersonFullID());
		saDocnode.setSeditorname(context.getCurrentPersonName());
		saDocnode.setSeditordeptname(context.getCurrentDeptName());
		saDocnode.setSdocliveversionid(1);
		saDocnode.setSflag(1);
		saDocnode.setVersion(0);
		saDocnodeService.insert(saDocnode);
		return docID;
	}

	/**
	 * DocServer 访问地址(用于文件查看下载相关的服务地址)
	 * 
	 * @return String
	 */
	public String queryDocHost() {
		return saDocnamespaceService.selectAll().get(0).getSurl();
	}

	/**
	 * 获取文档服务地址IP
	 * 
	 * @return String
	 */
	public String queryDocHostIP() {
		return saDocnamespaceService.selectAll().get(0).getShost();
	}

	/**
	 * 获取文档服务地址端口
	 * 
	 * @return String
	 */
	public Integer queryDocHostPort() {
		return saDocnamespaceService.selectAll().get(0).getSport();
	}

	/**
	 * 获取文档服务配置isHttps
	 * 
	 * @return Boolean
	 */
	public Boolean queryDocHostIsHttps() {
		String isHttps = saDocnamespaceService.selectAll().get(0).getShtths();
		return Boolean.valueOf(isHttps);
	}

	/**
	 * 获取主机地址(用于上传相关的服务地址)
	 * 
	 * @return String
	 */
	public String getHost() {
		String host = queryDocHostIP();
		Integer port = queryDocHostPort();
		Boolean isHttps = queryDocHostIsHttps();
		String url = (isHttps ? "https" : "http") + "://";
		url += host + ":" + port + "/DocServer";
		return url;
	}

}
