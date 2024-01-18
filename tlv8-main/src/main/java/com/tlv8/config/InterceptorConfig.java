package com.tlv8.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.tlv8.common.interceptors.SqlInjectInterceptor;

/**
 * 拦截配置
 * 
 * @author chenqian
 *
 */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new SqlInjectInterceptor()).addPathPatterns("/**");
	}

}
