package com.tlv8.doc.controller.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface RequestHandler {
	/*
	 * 请求处理程序接口
	 */
	String getContextPath();

	String getNamespace();

	String getPathPattern();

	void initHttpHeader(HttpServletResponse paramHttpServletResponse);

	void handleRequest(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
			throws Exception;

	boolean isWin();
}
