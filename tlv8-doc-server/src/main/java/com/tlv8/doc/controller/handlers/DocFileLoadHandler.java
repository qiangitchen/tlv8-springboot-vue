package com.tlv8.doc.controller.handlers;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tlv8.doc.controller.data.DocLoadData;

@Controller
@RequestMapping("/DocServer/repository")
public class DocFileLoadHandler {

	@RequestMapping("/doc/init")
	public void handleRequest(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
			throws Exception {
		paramHttpServletResponse.setCharacterEncoding("utf-8");
		paramHttpServletResponse.setContentType("text/html");
		new DocLoadData().load(paramHttpServletRequest);
		PrintWriter writer = paramHttpServletResponse.getWriter();
		writer.write(
				"<HTML>\n<HEAD>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><TITLE>文档同步");
		writer.write("</TITLE></HEAD>\n<BODY>\n<H2>文档同步完成.</H2>\n</BODY>\n</HTML>");
		writer.close();
	}

}
