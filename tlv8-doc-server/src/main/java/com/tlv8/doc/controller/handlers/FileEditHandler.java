package com.tlv8.doc.controller.handlers;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.tlv8.doc.controller.impl.DoupDoc;
import com.tlv8.doc.core.io.FileUploader;
import com.tlv8.doc.core.io.centent.FileIOContent;
import com.tlv8.doc.generator.pojo.DocDocPath;
import com.tlv8.doc.generator.pojo.DocDocument;
import com.tlv8.doc.generator.service.DocDocPathService;
import com.tlv8.doc.generator.service.DocDocumentService;

@Controller
@RequestMapping("/DocServer/repository")
public class FileEditHandler {
	@Autowired
	DocDocPathService docDocPathService;
	@Autowired
	DocDocumentService docDocumentService;

	public String getPathPattern() {
		return "/file/edit/*/*";
	}

	public void initHttpHeader(HttpServletResponse paramHttpServletResponse) {
		paramHttpServletResponse.setHeader("Cache-Control", "pre-check=0, post-check=0, max-age=0");
	}

	@RequestMapping("/file/edit/{fileID}/{user}/**")
	public void handleRequest(MultipartFile file, HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, @PathVariable("fileID") String fileID,
			@PathVariable("user") String user) throws Exception {
		if ("tourist".equals(user)) {
			paramHttpServletResponse.sendError(403);
		}
		try {
			String bizAddress = paramHttpServletRequest.getParameter("bizAddress");
			if (bizAddress != null) {
				DoupDoc doc = new DoupDoc(fileID);
				String docpath = doc.getDocPath();
				if (docpath != null) {
					FileIOContent rdoc = FileUploader.fileUpload(file, doc);// 保存文件
					if (rdoc.getFileSize() > 0) {
						FileUploader.ChangeFileID(fileID, rdoc.getFileID(), rdoc.getFilePath());
						DocDocPath ddocpath = docDocPathService.getDocDocPathByFileID(fileID);
						ddocpath.setFFilePath(rdoc.getFilePath());
						ddocpath.setFFileSize(rdoc.getFileSize());
						ddocpath.setFVersion(ddocpath.getFVersion() + 1);
						docDocPathService.updateDocDocPath(ddocpath);// 更新路径
						DocDocument ddoc = docDocumentService.getDocumentByDocID(fileID);
						ddoc.setFDocSize(rdoc.getFileSize());
						ddoc.setFUpdateTime(new Date());
						docDocumentService.updateDocument(ddoc);// 更新版本信息
					}
				}
				PrintWriter localPrintWriter = paramHttpServletResponse.getWriter();
				localPrintWriter.write("{'status':'ok'}");
				localPrintWriter.close();
			} else {
				paramHttpServletResponse.sendError(405);
			}
		} catch (Exception e) {
			paramHttpServletResponse.sendError(500);
		}
	}

}
