package com.tlv8.doc.controller.svlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tlv8.doc.controller.connector.HttpConnector;
import com.tlv8.doc.controller.connector.ShttpServletRequest;
import com.tlv8.doc.controller.inter.RequestHandler;
import com.tlv8.doc.core.config.ServerConfigInit;
import com.tlv8.doc.lucene.LuceneService;

@Controller
@RequestMapping("/DocServer")
public class DispathServelet {
	protected final Logger infolog = Logger.getLogger(getClass());

	@RequestMapping("/repository/**")
	public void doFilter(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			ShttpServletRequest srequest = new ShttpServletRequest(request);
			String baseContextPath = srequest.getPathInfo();
			response.setCharacterEncoding("utf-8");
			if ((baseContextPath != null) && (baseContextPath.startsWith("/")) && (baseContextPath.length() > 1)
					&& ((baseContextPath.indexOf('/', 1)) != -1)) {
				try {
					RequestHandler requesthandler = new HttpConnector(srequest).getRequestHandler();
					requesthandler.initHttpHeader(response);
					requesthandler.handleRequest(srequest, response);
				} catch (Exception e) {
					infolog.error(e);
					e.printStackTrace();
					response.sendError(500);
				}
			} else {
				response.sendError(404);
			}
		} catch (IOException e) {
			infolog.error(e);
			e.printStackTrace();
			response.sendError(500);
		}
	}

	@ModelAttribute
	public void init(HttpServletRequest request) throws ServletException {
		try {
			String conPath = request.getServletContext().getRealPath("/");
			File curfile = new File(conPath);
			String homepath = curfile.getParent() + "../../..";
			File localFile = new File(homepath);
			ServerConfigInit.DOC_HOME = localFile.getParentFile().getParentFile().getParentFile().getCanonicalPath();
			ServerConfigInit.init();
			LuceneService.start();// 启动索引服务
		} catch (Throwable e) {
			infolog.error("启动文档服务异常!" + e);
			e.printStackTrace();
		}
	}

}
