package com.tlv8.doc.controller.handlers;

import java.io.InputStream;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.doc.controller.utils.MimeUtils;
import com.tlv8.doc.core.io.FileDownloader;
import com.tlv8.doc.generator.pojo.DocDocPath;
import com.tlv8.doc.generator.pojo.DocDocument;
import com.tlv8.doc.generator.service.DocDocPathService;
import com.tlv8.doc.generator.service.DocDocumentService;

@Controller
@RequestMapping("/DocServer/repository")
public class FileViewHandler extends ActionSupport {
	@Autowired
	DocDocPathService docDocPathService;
	@Autowired
	DocDocumentService docDocumentService;

	@ResponseBody
	@RequestMapping("/file/view/{fileID}/{fVersion}/*")
	public ResponseEntity<byte[]> handleRequest(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, @PathVariable("fileID") String fileID,
			@PathVariable("fVersion") String fVersion, @RequestHeader("User-Agent") String userAgent) throws Exception {
		try {
			if (fVersion == null) {
				fVersion = "last";
			}
			DocDocPath dpath = null;
			if ("last".equals(fVersion)) {
				dpath = docDocPathService.getDocDocPathByFileID(fileID);
			} else {
				dpath = docDocPathService.getDocDocPathByFileIDVersion(fileID, Long.parseLong(fVersion));
			}
			DocDocument doc = docDocumentService.getDocumentByDocID(fileID);
			// 文件创建时间
			paramHttpServletResponse.setDateHeader("Last-Modified", doc.getFAddTime().getTime());
			// 文件大小
			int filesize = FileDownloader.getFileSize(fileID, dpath.getFFilePath());
			// 文件流
			InputStream inputStream = FileDownloader.download(fileID, dpath.getFFilePath());
			paramHttpServletResponse.setContentLength(filesize);
			String DocType = doc.getFDocType();

			DocType = MimeUtils.guessMimeTypeFromExtension(doc.getFExtName().replace(".", ""));
			if (DocType == null) {
				DocType = "application/octet-stream";
			}
			if ("text/plain".equals(DocType)) {
				// 文本类型
				paramHttpServletResponse.setCharacterEncoding("gb2312");
			}
			String formFileName = doc.getFDocName();
			// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
			paramHttpServletResponse.setContentType(DocType);
			return getViewByteResponseEntity(inputStream, MediaType.asMediaType(MimeType.valueOf(DocType)), userAgent,
					formFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
