package com.tlv8.doc.controller.connector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class ShttpServletRequest extends HttpServletRequestWrapper {
	private HttpServletRequest request = null;

    public ShttpServletRequest(HttpServletRequest request) {
		super(request);
		this.request = request;
	}

	@Override
	public String getPathInfo() {
		String baseContextPath = request.getRequestURI().replace(
				request.getContextPath(), "");
		return baseContextPath;
	}

}
