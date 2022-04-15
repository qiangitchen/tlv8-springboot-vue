package com.tlv8.doc.controller.svlet;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/DocServer")
public class LogServlet {

	@ResponseBody
	@RequestMapping("/")
	public void index(ServletRequest request, ServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		Writer writer = response.getWriter();
		writer.write(
				"<HTML>\n<HEAD>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><TITLE>连接成功!");
		writer.write("</TITLE></HEAD>\n<BODY>\n<H2>文档服务已经成功启动.</H2>\n</BODY>\n</HTML>");
		writer.close();
	}

	@ResponseBody
	@RequestMapping("/log")
	public String service(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
			throws ServletException, IOException {
		return "文档服务正在运行~.~";
	}
}
