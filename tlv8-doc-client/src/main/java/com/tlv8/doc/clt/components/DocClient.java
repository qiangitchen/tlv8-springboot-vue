package com.tlv8.doc.clt.components;

import java.io.InputStream;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.utils.doc.MimeUtils;
import com.tlv8.doc.clt.doc.AbstractDoc;
import com.tlv8.doc.clt.doc.Doc;
import com.tlv8.doc.clt.doc.DocDBHelper;
import com.tlv8.doc.clt.doc.DocUtils;
import com.tlv8.doc.clt.doc.Docs;
import com.tlv8.doc.clt.obj.DocUploadRes;
import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnodeService;

@Component
public class DocClient {
	@Autowired
	SaDocnodeService saDocnodeService;
	@Autowired
	DocDBHelper docDBHelper;
	@Autowired
	Docs docs;

	/**
	 * 上传文件到文档服务
	 * 
	 * @param file
	 * @param docPath
	 * @return Map
	 * @throws Exception
	 */
	public DocUploadRes uploadFile(MultipartFile file, String docPath) throws Exception {
		if (docPath == null || "".equals(docPath)) {
			docPath = "/root";
		} else {
			try {
				docPath = URLDecoder.decode(docPath, "UTF-8");
			} catch (Exception e) {
			}
		}
		String fileName = file.getOriginalFilename();
		Map<String, String> m = upLoadFiletoDaisy(docPath, fileName, file.getInputStream());
		String contentType = file.getContentType();
		if (contentType == null || "".equals(contentType)) {
			// 没有识别文件类型时根据文件扩展名识别
			contentType = MimeUtils.guessMimeTypeFromFileName(file.getOriginalFilename());
		}
		if (contentType == null || "".equals(contentType)) {
			// 未知的文件类型统一定义为“file”
			contentType = "file";
		}
		String docID = docDBHelper.addDocData(docPath, fileName, contentType, String.valueOf(m.get("Size")),
				m.get("cacheName"));
		String fileID = m.get("cacheName");
		Doc doc = docs.queryDocById(docID);
		doc.commitFile();
		DocUtils.saveDocFlag(docDBHelper.getHost(), docPath, doc.getSkind(), doc.getScachename(), doc.getScachename(),
				false);
		fileID = doc.getSfileid();
		SaDocnode docnode = saDocnodeService.selectByPrimaryKey(docID);
		docnode.setSfileid(fileID);
		saDocnodeService.updateByPrimaryKey(docnode);
		DocUploadRes res = new DocUploadRes(doc);
		res.setMd5(DigestUtils.md5Hex(file.getBytes()));
		return res;
	}

	/**
	 * 上传文件到文档服务
	 * 
	 * @param file
	 * @param docPath
	 * @return {@link JSONObject}
	 * @throws Exception
	 */
	public JSONObject uploadFileJson(MultipartFile file, String docPath) throws Exception {
		DocUploadRes res = uploadFile(file, docPath);
		JSONObject json = res.toJson();
		return json;
	}

	/**
	 * 上传文件到文档服务器
	 * 
	 * @param DocPath
	 * @param DocName
	 * @param file
	 * @return {@link Map}
	 * @throws Exception
	 */
	private Map<String, String> upLoadFiletoDaisy(String DocPath, String DocName, InputStream inputstream)
			throws Exception {
		Map<String, String> rem = new HashMap<>();
		try {
			AbstractDoc doca = new AbstractDoc(docDBHelper);
			doca.setSdocpath(DocPath);
			doca.setSdocname(DocName);
			doca.upload(false, inputstream);
			DocUtils.saveDocFlag(docDBHelper.getHost(), DocPath, doca.getSkind(), doca.getScachename(),
					doca.getScachename(), false);
			rem.put("Kind", doca.getSkind());
			rem.put("cacheName", doca.getScachename());
			rem.put("Size", String.valueOf(doca.getSsize()));
			rem.put("sDocName", DocName);
		} finally {
			inputstream.close();
		}
		return rem;
	}
}
