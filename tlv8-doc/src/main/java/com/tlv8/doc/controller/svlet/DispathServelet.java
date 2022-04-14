package com.tlv8.doc.controller.svlet;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.doc.controller.connector.HttpConnector;
import com.tlv8.doc.controller.connector.ShttpServletRequest;
import com.tlv8.doc.controller.inter.RequestHandler;
import com.tlv8.doc.core.config.ServerConfigInit;
import com.tlv8.doc.lucene.LuceneService;

@Controller
@RequestMapping("/DocServer")
public class DispathServelet {
	protected final Logger infolog = Logger.getLogger(getClass());

	static boolean started = false;

	@ResponseBody
	@RequestMapping("/*")
	public void doFilter(ServletRequest paramHttpServletRequest, ServletResponse paramHttpServletResponse,
			FilterChain chain) throws IOException, ServletException {
		if (!started) {
			init();
		}
		try {
			HttpServletRequest request = (HttpServletRequest) paramHttpServletRequest;
			ShttpServletRequest srequest = new ShttpServletRequest(request);
			HttpServletResponse response = (HttpServletResponse) paramHttpServletResponse;
			String baseContextPath = srequest.getPathInfo();
			paramHttpServletResponse.setCharacterEncoding("utf-8");
			if ((baseContextPath != null) && (baseContextPath.startsWith("/")) && (baseContextPath.length() > 1)
					&& ((baseContextPath.indexOf('/', 1)) != -1)) {
				try {
					RequestHandler requesthandler = new HttpConnector(srequest).getRequestHandler();
					requesthandler.initHttpHeader(response);
					requesthandler.handleRequest(srequest, response);
				} catch (Exception e) {
					chain.doFilter(request, response);
				}
			} else if ((baseContextPath != null) && (baseContextPath.startsWith("/"))
					&& (baseContextPath.length() == 1)) {
				paramHttpServletResponse.setContentType("text/html");
				paramHttpServletResponse.setCharacterEncoding("utf-8");
				Writer writer = paramHttpServletResponse.getWriter();
				writer.write(
						"<HTML>\n<HEAD>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><TITLE>连接成功!");
				writer.write("</TITLE></HEAD>\n<BODY>\n<H2>文档服务已经成功启动.</H2>\n</BODY>\n</HTML>");
				writer.close();
			} else {
				chain.doFilter(request, response);
			}
		} catch (IOException e) {
			infolog.error(e);
			e.printStackTrace();
		}
	}

	public void init() throws ServletException {
		try {
			ServerConfigInit.init();
			LuceneService.start();// 启动索引服务
			started = true;
		} catch (Throwable e) {
			infolog.error("启动文档服务异常!" + e);
			e.printStackTrace();
		}
	}
}
