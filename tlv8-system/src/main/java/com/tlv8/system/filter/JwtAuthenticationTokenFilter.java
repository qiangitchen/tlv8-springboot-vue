package com.tlv8.system.filter;

import com.tlv8.common.utils.StringUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.service.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * token过滤器 验证token有效性
 */
@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {
    @Autowired
    private TokenService tokenService;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        ContextBean contextBean = tokenService.getContextBean(request);
        if (StringUtils.isNotNull(contextBean)) {
            tokenService.verifyToken(contextBean);
        }
        chain.doFilter(request, response);
    }

}
