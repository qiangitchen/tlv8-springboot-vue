package com.tlv8.doc.clt.doc;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnodeService;

/**
 * 文档操作辅助对象
 * 
 * @author 陈乾
 *
 */
@Component
public class Docs {
	@Autowired
	SaDocnodeService saDocnodeService;
	@Autowired
	DocDBHelper docDBHelper;

	/**
	 * 根据文档id（sid）获取文档对象
	 * 
	 * @param docID
	 * @return
	 */
	public Doc queryDocById(String docID) {
		SaDocnode docnode = saDocnodeService.selectByPrimaryKey(docID);
		Doc doc = new Doc(docDBHelper);
		BeanUtils.copyProperties(docnode, doc);
		return doc;
	}

	/**
	 * 根据文件ID获取文档对象
	 * 
	 * @param fileID
	 * @return
	 */
	public Doc queryDocByFileID(String fileID) {
		SaDocnode docnode = saDocnodeService.selectByFileID(fileID);
		Doc doc = new Doc(docDBHelper);
		BeanUtils.copyProperties(docnode, doc);
		return doc;
	}
}
