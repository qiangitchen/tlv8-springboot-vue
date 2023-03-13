package com.tlv8.doc.controller.data;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.doc.core.io.FileUploader;
import com.tlv8.doc.core.io.centent.FileIOContent;
import com.tlv8.doc.generator.pojo.DocDocPath;
import com.tlv8.doc.generator.pojo.DocDocument;
import com.tlv8.doc.generator.service.DocDocPathService;
import com.tlv8.doc.generator.service.DocDocumentService;

@Component
public class FileUploadData {
	@Autowired
	DocDocPathService docDocPathService;
	@Autowired
	DocDocumentService docDocumentService;

	/*
	 * 新文件数据保存
	 */
	public void newDocSave(FileIOContent content) {
		Date addtime = new Date();
		DocDocument doc = new DocDocument();
		doc.setFID(IDUtils.getGUID());
		doc.setFDocID(content.getFileID());
		doc.setFDocName(content.getFileName());
		doc.setFExtName(content.getExtName());
		doc.setFDocSize(content.getFileSize());
		doc.setFDocType(content.getFileType());
		doc.setFAddTime(addtime);
		doc.setVersion(0);
		docDocumentService.addDocument(doc);

		DocDocPath docpath = new DocDocPath();
		docpath.setFID(IDUtils.getGUID());
		docpath.setFFileID(content.getFileID());
		docpath.setFFilePath(content.getFilePath());
		docpath.setFFileSize(content.getFileSize());
		docpath.setFVersion(1);
		docpath.setFAddTime(addtime);
		docpath.setVersion(0);
		docDocPathService.addDocDocPath(docpath);
	}

	/*
	 * 保存新版本
	 */
	public void saveDocNewVersion(String fileID, String cachename) {
		DocDocPath docpath = docDocPathService.getDocDocPathByFileID(fileID);
		DocDocPath cachepath = docDocPathService.getDocDocPathByFileID(cachename);
		cachepath.setFVersion(docpath.getFVersion() + 1);
		cachepath.setFFileID(docpath.getFFileID());
		docDocPathService.updateDocDocPath(cachepath);
		DocDocument doc = docDocumentService.getDocumentByDocID(fileID);
		DocDocument cachedoc = docDocumentService.getDocumentByDocID(cachename);
		doc.setFDocName(cachedoc.getFDocName());
		doc.setFDocSize(cachedoc.getFDocSize());
		doc.setFDocType(cachedoc.getFDocType());
		doc.setFExtName(cachedoc.getFExtName());
		doc.setFUpdateTime(cachedoc.getFAddTime());
		docDocumentService.updateDocument(doc);// 更新版本信息
		docDocumentService.deleteDocumentByDocID(cachename);// 删除临时版本
		FileUploader.ChangeFileID(fileID, cachename, cachepath.getFFilePath());
	}
}
