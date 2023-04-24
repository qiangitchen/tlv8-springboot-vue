package com.tlv8.doc.controller.handlers;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tlv8.doc.controller.impl.FileDeleter;
import com.tlv8.doc.lucene.LuceneService;

@Controller
@RequestMapping("/DocServer/repository")
@SuppressWarnings({ "rawtypes" })
public class FileDeleteHandler {
	@Autowired
	FileDeleter fileDeleter;

	public String getPathPattern() {
		return "/file/delete";
	}

	public void initHttpHeader(HttpServletResponse paramHttpServletResponse) {
		paramHttpServletResponse.setCharacterEncoding("utf-8");
	}

	@RequestMapping("/file/delete")
	public void handleRequest(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
			throws Exception {
		if (paramHttpServletRequest.getMethod().equals("POST")) {
			ServletInputStream localServletInputStream;
			if (("text/xml".equals(paramHttpServletRequest.getContentType()))
					|| ("application/xml".equals(paramHttpServletRequest.getContentType()))) {
				localServletInputStream = paramHttpServletRequest.getInputStream();
			} else {
				paramHttpServletResponse.sendError(400, "The post need type of \"text/xml\".");
				return;
			}
			StringBuilder localStringBuilder = new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\"?><root>");
			try {
				SAXReader localSAXReader = new SAXReader();
				Document localDocument = localSAXReader.read(localServletInputStream);
				List localList = localDocument.selectNodes("//data");
				Iterator localIterator = localList.iterator();
				while (localIterator.hasNext()) {
					Element localElement = (Element) localIterator.next();
					String fileID = localElement.elementText("file-id");
					String version = localElement.elementText("doc-version");
					Map localMap = fileDeleter.deleteVersion(fileID, Long.parseLong(version));// 删除文件
					LuceneService.addMoveID(fileID);// 追加删除索引的ID
					localStringBuilder.append("<flag>true</flag>");
					localStringBuilder.append(String.format(
							"<item><doc-version-id>%s</doc-version-id><doc-live-version-id>%s</doc-live-version-id></item>",
							localMap.get("lastVersionId"), localMap.get("liveVersionId")));
				}
			} catch (Exception localException) {
				localStringBuilder.append("<flag>false</flag>");
				localStringBuilder.append("<message>");
				localStringBuilder.append("delete doc version failure");
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
