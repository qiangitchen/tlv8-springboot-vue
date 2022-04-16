package com.tlv8.doc.controller.svlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.tlv8.doc.controller.connector.HttpConnector;
import com.tlv8.doc.controller.connector.ShttpServletRequest;
import com.tlv8.doc.controller.inter.RequestHandler;
import com.tlv8.doc.core.config.ServerConfigInit;
import com.tlv8.doc.lucene.LuceneService;

public class DispathServelet implements Filter {
	protected final Logger infolog = Logger.getLogger(getClass());

	public void doFilter(ServletRequest paramHttpServletRequest, ServletResponse paramHttpServletResponse,
			FilterChain chain) throws IOException, ServletException {
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
			} else {
				chain.doFilter(request, response);
			}
		} catch (IOException e) {
			infolog.error(e);
			e.printStackTrace();
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		try {
			ServerConfigInit.init();
			LuceneService.start();// 启动索引服务
		} catch (Throwable e) {
			infolog.error("启动文档服务异常!" + e);
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {

	}
}
