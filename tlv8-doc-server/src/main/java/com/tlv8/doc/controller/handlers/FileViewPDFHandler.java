package com.tlv8.doc.controller.handlers;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.doc.controller.utils.ExcelToPDFUtils;
import com.tlv8.doc.controller.utils.MimeUtils;
import com.tlv8.doc.controller.utils.PdfConverUtil;
import com.tlv8.doc.controller.utils.Word2PdfAsposeUtil;
import com.tlv8.doc.core.io.FileDownloader;
import com.tlv8.doc.generator.pojo.DocDocPath;
import com.tlv8.doc.generator.pojo.DocDocument;
import com.tlv8.doc.generator.service.DocDocPathService;
import com.tlv8.doc.generator.service.DocDocumentService;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 以pdf格式查看文件
 * 
 * @author qianp
 * 
 */
@Controller
@RequestMapping("/DocServer/repository")
public class FileViewPDFHandler extends ActionSupport {
	@Autowired
	DocDocPathService docDocPathService;
	@Autowired
	DocDocumentService docDocumentService;

	@ResponseBody
	@RequestMapping("/file/viewpdf/{fileID}/{fVersion}/*")
	public ResponseEntity<byte[]> handleRequest(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse, @PathVariable("fileID") String fileID,
			@PathVariable("fVersion") String fVersion, @RequestHeader("User-Agent") String userAgent) throws Exception {
		try {
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
			// int filesize = FileDownloader.getFileSize(fileID,
			// dpath.getFFilePath());
			// 文件流
			InputStream inputStream = FileDownloader.download(fileID, dpath.getFFilePath());
			// paramHttpServletResponse.setContentLength(filesize);
			String DocType = "application/pdf";
			String extnm = doc.getFExtName();
			boolean istr = true;
			if (!isOffice(extnm)) {
				istr = false;
				try {
					DocType = MimeUtils.guessMimeTypeFromExtension(doc.getFExtName().replace(".", ""));
					if (DocType == null) {
						DocType = "application/octet-stream";
					}
				} catch (Exception e) {
				}
			}
			String formFileName = doc.getFDocName();
			// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
			paramHttpServletResponse.setContentType(DocType);
			if (istr) {
				formFileName = formFileName.replace(doc.getFExtName(), ".pdf");
			}
			// 2.设置文件头：最后一个参数是设置下载文件名
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			if (istr) {
				if (".xls".equals(extnm) || ".xlsx".equals(extnm)) {
					ExcelToPDFUtils.excel2pdf(inputStream, out);
				} else if (".doc".equals(extnm) || ".docx".equals(extnm)) {
					Word2PdfAsposeUtil.doc2pdf(inputStream, out);
				} else if (".ppt".equals(extnm)) {
					PdfConverUtil.ppt2pdf(inputStream, out);
				} else if (".pptx".equals(extnm)) {
					PdfConverUtil.pptx2pdf(inputStream, out);
				} else if (".wps".equals(extnm)) {
					Word2PdfAsposeUtil.doc2pdf(inputStream, out);
				}
			} else {
				byte[] arrayOfByte = new byte[2048];
				int i;
				while ((i = inputStream.read(arrayOfByte)) != -1)
					out.write(arrayOfByte, 0, i);
			}
			return getByteResponseEntity(out, MediaType.APPLICATION_PDF, userAgent, formFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	protected boolean isOffice(String extnm) {
		return (".doc".equals(extnm) || ".docx".equals(extnm) || ".ppt".equals(extnm) || ".pptx".equals(extnm)
				|| ".xls".equals(extnm) || ".xlsx".equals(extnm) || ".wps".equals(extnm));
	}

}
