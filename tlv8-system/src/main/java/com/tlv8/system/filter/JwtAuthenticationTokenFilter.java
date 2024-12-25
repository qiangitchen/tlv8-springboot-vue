package com.tlv8.system.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlv8.system.action.WriteLog;
import com.tlv8.system.echat.EChatExecuteFilter;

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
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String patex = request.getRequestURI();
		if (isSource(patex)) {// 静态资源js、css等不拦截
			chain.doFilter(request, response);
			return;
		}
		if (EChatExecuteFilter.doFilter(req, res)) {
			// return false; // 返回false就是不需要再做处理
		} else if (isLoginPage(patex) || isIgnore(patex)) {
			chain.doFilter(request, response);
		} else {
			// 判断是否已登录
			if (StpUtil.isLogin()) {
				writeLog.writeLog(request);
				chain.doFilter(request, response);
			} else {
				if (isWebPage(patex)) {
					response.sendRedirect("/portal/login.html");
				} else {
					ServletUtils.renderString(response,
							JSON.toJSONString(AjaxResult.error(HttpStatus.UNAUTHORIZED, "请先登录")));
				}
			}
		}
	}

	/**
	 * 判断是否为登录-检查登录
	 */
	protected boolean isLoginPage(String patex) {
		return patex.contains("/login") || patex.contains("/MD5login") || patex.contains("/CALogin")
				|| patex.contains("/sCALogin") || patex.contains("/Sessionlogin") || patex.contains("/captchaimage")
				|| patex.contains("/check") || patex.contains("/logout") || patex.contains("/devLogin")
				|| patex.contains("/MD5logout") || "/".equals(patex) || patex.contains("/DocServer");
	}

	/**
	 * 忽略的资源
	 * 
	 * @param patex
	 * @return boolean
	 */
	protected boolean isIgnore(String patex) {
		return patex.contains("/favicon.ico") || patex.contains("/DocServer/") || patex.endsWith("/WeiXinPayNotify")
				|| patex.endsWith("/WeiXinRefundNotify") || patex.endsWith("/AliPayNotify") || patex.contains("/yyZX")
				|| patex.contains("/getHXXL") || patex.contains("/tv/") || patex.contains("/ai_alarm")
				|| patex.contains("/camera/capture/") || patex.contains("/index/hook/");
	}

	/**
	 * 可以直接访问的静态资源
	 * 
	 * @param patex
	 * @return boolean
	 */
	protected boolean isSource(String patex) {
		String pp = patex.toLowerCase();
		return pp.endsWith(".js") || pp.endsWith(".css") || pp.endsWith(".jpg") || pp.endsWith(".jpeg")
				|| pp.endsWith(".png") || pp.endsWith(".gif") || pp.endsWith(".woff2") || pp.endsWith(".cab")
				|| pp.endsWith(".swf") || pp.endsWith(".svg");
	}

	/**
	 * 判断访问的是否问静态网页
	 * 
	 * @param patex
	 * @return
	 */
	protected boolean isWebPage(String patex) {
		String pp = patex.toLowerCase();
		return pp.endsWith(".html") || pp.endsWith(".htm") || pp.endsWith(".xhtml");
	}

}
