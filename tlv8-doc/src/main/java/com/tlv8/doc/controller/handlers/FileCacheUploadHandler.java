package com.tlv8.doc.controller.handlers;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlv8.doc.controller.data.FileUploadData;
import com.tlv8.doc.controller.impl.AbstractRequestHandler;
import com.tlv8.doc.controller.impl.DoupDoc;
import com.tlv8.doc.core.io.FileUploader;
import com.tlv8.doc.core.io.centent.FileIOContent;

public class FileCacheUploadHandler extends AbstractRequestHandler {

	public String getPathPattern() {
		return "/file/cache/upload";
	}

	public void initHttpHeader(HttpServletResponse paramHttpServletResponse) {
		paramHttpServletResponse.setCharacterEncoding("utf-8");
	}

	public void handleRequest(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse) throws Exception {
		if (paramHttpServletRequest.getMethod().equals("POST")) {
			StringBuilder localStringBuilder = new StringBuilder(
					"<?xml version=\"1.0\" encoding=\"UTF-8\"?><root>");
			try {
				FileIOContent rdoc = FileUploader.fileUpload(
						paramHttpServletRequest, new DoupDoc());// 保存文件
				FileUploadData.newDocSave(rdoc);// 保存数据
				localStringBuilder
						.append(String
								.format("<file mediatype=\"%s\" file-name=\"%s\" fileSize=\"%s\"></file>",
										rdoc.getFileType(),
										rdoc.getFileID(),
										rdoc.getFileSize() + ""));
			} catch (Exception localException) {
				this.requestErrorLogger.error(localException);
				localStringBuilder.append("<flag>false</flag>");
				localStringBuilder.append("<message>");
				localStringBuilder.append("upload fileCache  failure");
				localStringBuilder.append(localException.getMessage());
				localStringBuilder.append("</message>");
			}
			localStringBuilder.append("</root>");
			PrintWriter localPrintWriter = paramHttpServletResponse.getWriter();
			localPrintWriter.write(localStringBuilder.toString());
			localPrintWriter.close();
		} else {
			paramHttpServletResponse.sendError(405);
		}
	}

}