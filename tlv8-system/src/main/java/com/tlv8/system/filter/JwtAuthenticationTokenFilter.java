package com.tlv8.system.filter;

import com.alibaba.fastjson.JSON;
import com.tlv8.common.base.Sys;
import com.tlv8.common.constant.HttpStatus;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.ServletUtils;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.service.TokenService;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * token过滤器 验证token有效性
 */
@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {
    private TokenService tokenService;

    public JwtAuthenticationTokenFilter(TokenService tokenService) {
        this.tokenService = tokenService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        String patex = request.getRequestURI();
        ContextBean contextBean = tokenService.getContextBean(request);
        if (StringUtils.isNotNull(contextBean)) {
            tokenService.verifyToken(contextBean);
        }
        if (isLoginPage(patex) || isIgnore(patex)) {
            chain.doFilter(request, response);
        } else {
            // 判断是否已登录
            if (contextBean != null && contextBean.isLogin()) {
                chain.doFilter(request, response);
            } else {
                ServletUtils.renderString(response, JSON.toJSONString(AjaxResult.error(HttpStatus.UNAUTHORIZED, "请先登录")));
            }
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
        boolean isre = patex.contains("/favicon.ico");
        return isre;
    }

}
