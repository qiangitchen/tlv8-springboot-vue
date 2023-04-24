package com.tlv8.doc.controller.handlers;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MimeType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.doc.controller.utils.MimeUtils;
import com.tlv8.doc.core.io.FileDownloader;
import com.tlv8.doc.generator.pojo.DocDocPath;
import com.tlv8.doc.generator.pojo.DocDocument;
import com.tlv8.doc.generator.service.DocDocPathService;
import com.tlv8.doc.generator.service.DocDocumentService;

@Controller
@RequestMapping("/DocServer/repository")
public class FileDownloadHandler extends ActionSupport {
	@Autowired
	DocDocPathService docDocPathService;
	@Autowired
	DocDocumentService docDocumentService;

	@RequestMapping("/file/download/{fileID}/**")
	public ResponseEntity<byte[]> handleRequest(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, @PathVariable("fileID") String fileID,
			@RequestHeader("User-Agent") String userAgent) throws Exception {
		DocDocPath dpath = docDocPathService.getDocDocPathByFileID(fileID);
		DocDocument doc = docDocumentService.getDocumentByDocID(fileID);
		// 文件创建时间
		paramHttpServletResponse.setDateHeader("Last-Modified", doc.getFAddTime().getTime());
		// 文件大小
		int filesize = FileDownloader.getFileSize(fileID, dpath.getFFilePath());
		// 文件流
		InputStream inputStream = FileDownloader.download(fileID, dpath.getFFilePath());
		paramHttpServletResponse.setContentLength(filesize);
		String DocType = doc.getFDocType();
		try {
			DocType = MimeUtils.guessMimeTypeFromExtension(doc.getFExtName().replace(".", ""));
			if (DocType == null) {
				DocType = "application/octet-stream";
			}
		} catch (Exception e) {
		}
		if ("text/plain".equals(DocType)) {
			// 文本类型
			paramHttpServletResponse.setCharacterEncoding("gb2312");
		}
		// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		paramHttpServletResponse.setContentType(DocType);
		String formFileName = doc.getFDocName();
		// 针对IE或者以IE为内核的浏览器：
		if (userAgent != null && (userAgent.contains("MSIE") || userAgent.contains("Trident"))) {
			formFileName = java.net.URLEncoder.encode(formFileName, "UTF-8");
		} else {
			// 非IE浏览器的处理：
			formFileName = new String(formFileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
		}
		// 2.设置文件头：最后一个参数是设置下载文件名
		paramHttpServletResponse.setHeader("Content-Disposition", "attachment; filename=" + formFileName);
		return getByteResponseEntity(inputStream, MediaType.asMediaType(MimeType.valueOf(DocType)), userAgent,
				formFileName);
	}

}
