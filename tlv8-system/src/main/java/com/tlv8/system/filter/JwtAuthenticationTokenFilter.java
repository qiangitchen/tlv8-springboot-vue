package com.tlv8.system.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlv8.system.action.WriteLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.alibaba.fastjson.JSON;
import com.tlv8.common.constant.HttpStatus;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.ServletUtils;

import cn.dev33.satoken.stp.StpUtil;

/**
 * token过滤器 验证token有效性
 */
@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {

	@Autowired
	WriteLog writeLog;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		try {
			String patex = request.getRequestURI();
			if (isLoginPage(patex) || isIgnore(patex)) {
				chain.doFilter(request, response);
			} else {
				// 判断是否已登录
				if (StpUtil.isLogin()) {
					writeLog.writeLog(request);
					chain.doFilter(request, response);
				} else {
					ServletUtils.renderString(response,
							JSON.toJSONString(AjaxResult.error(HttpStatus.UNAUTHORIZED, "请先登录")));
				}
			}
		} catch (Exception e) {
			chain.doFilter(request, response);
		}
	}

	/**
	 * 判断是否为登录-检查登录
	 */
	private boolean isLoginPage(String patex) {
		boolean isre = patex.contains("/login") || patex.contains("/MD5login") || patex.contains("/sCALogin")
				|| patex.contains("/Sessionlogin") || patex.contains("/captchaimage") || patex.contains("/check")
				|| patex.contains("/logout") || patex.contains("/MD5logout");
		return isre;
	}

	private boolean isIgnore(String patex) {
		boolean isre = patex.contains("/favicon.ico") || patex.contains("/DocServer/") || patex.contains("/ureport/");
		return isre;
	}

}
