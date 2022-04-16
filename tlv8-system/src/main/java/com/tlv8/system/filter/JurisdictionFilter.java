package com.tlv8.system.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlv8.common.constant.HttpStatus;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.help.SessionHelper;

public class JurisdictionFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String patex = req.getRequestURI();
		if (!isLoginPage(patex)) {
			/*
			 * 页面访问登录控制
			 */
			ContextBean context = SessionHelper.getContext(req);
			// 判断是否已登录
			if (context.isLogin()) {
				chain.doFilter(request, response);
			} else {
				res.setStatus(HttpStatus.UNAUTHORIZED);
			}
		} else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * 判断是否为登录-检查登录
	 */
	private boolean isLoginPage(String patex) {
		boolean isre = false;
		if (patex.contains("/login") || patex.contains("/MD5login") || patex.contains("/sCALogin")
				|| patex.contains("/Sessionlogin") || patex.contains("/captchaimage") || patex.contains("/check")) {
			isre = true;
		}
		return isre;
	}

}
