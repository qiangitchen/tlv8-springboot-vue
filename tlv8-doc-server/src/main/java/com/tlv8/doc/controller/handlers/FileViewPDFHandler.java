package com.tlv8.doc.controller.handlers;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.utils.OfficeUtils;
import com.tlv8.doc.controller.utils.ExcelToPDFUtils;
import com.tlv8.doc.controller.utils.MimeUtils;
import com.tlv8.doc.controller.utils.PdfConverUtil;
import com.tlv8.doc.controller.utils.Word2PdfAsposeUtil;
import com.tlv8.doc.core.io.FileDownloader;
import com.tlv8.doc.generator.pojo.DocDocPath;
import com.tlv8.doc.generator.pojo.DocDocument;
import com.tlv8.doc.generator.service.DocDocPathService;
import com.tlv8.doc.generator.service.DocDocumentService;

/**
 * 以pdf格式查看文件
 * 
 * @author qianp
 * 
 */
@Controller
@RequestMapping("/DocServer/repository")
public class FileViewPDFHandler {
	@Autowired
	DocDocPathService docDocPathService;
	@Autowired
	DocDocumentService docDocumentService;

	@ResponseBody
	@RequestMapping("/file/viewpdf/{fileID}/{fVersion}/*")
	public void handleRequest(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse,
			@PathVariable("fileID") String fileID, @PathVariable("fVersion") String fVersion,
			@RequestHeader("User-Agent") String userAgent) throws Exception {
		DocDocPath dpath = null;
		if ("last".equals(fVersion)) {
			dpath = docDocPathService.getDocDocPathByFileID(fileID);
		} else {
			dpath = docDocPathService.getDocDocPathByFileIDVersion(fileID, Long.parseLong(fVersion));
		}
		DocDocument doc = docDocumentService.getDocumentByDocID(fileID);
		// 文件创建时间
		paramHttpServletResponse.setDateHeader("Last-Modified", doc.getFAddTime().getTime());
		// 文件流
		InputStream inputStream = FileDownloader.download(fileID, dpath.getFFilePath());
		String DocType = "application/pdf";
		String extnm = doc.getFExtName();
		boolean istr = true;
		if (!OfficeUtils.isOffice(extnm)) {
			istr = false;
			try {
				DocType = MimeUtils.guessMimeTypeFromExtension(doc.getFExtName().replace(".", ""));
				if (DocType == null) {
					DocType = "application/octet-stream";
				}
			} catch (Exception e) {
			}
		}
		try {
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
			if (istr) {
				formFileName = formFileName.replace(doc.getFExtName(), ".pdf");
			}
			// 2.设置文件头：最后一个参数是设置下载文件名
			paramHttpServletResponse.setHeader("Content-Disposition", "inline; filename=" + formFileName);

			// 3.通过response获取ServletOutputStream对象(out)
			ServletOutputStream out = paramHttpServletResponse.getOutputStream();
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
				try {
					out.flush();
					out.close();
				} catch (Exception e) {
				}
			} else {
				byte[] arrayOfByte = new byte[2048];
				try {
					int i;
					while ((i = inputStream.read(arrayOfByte)) != -1)
						out.write(arrayOfByte, 0, i);
				} catch (Exception we) {
				} finally {
					try {
						out.flush();
						out.close(); // 关闭输出流
					} catch (Exception e) {
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				inputStream.close(); // 关闭输入流
			}
		}
	}

}
