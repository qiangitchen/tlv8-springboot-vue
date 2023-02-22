package com.tlv8.system.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.tlv8.system.filter.JurisdictionFilter;

/**
 * Filter配置
 *
 */
@Configuration
@SuppressWarnings({ "rawtypes", "unchecked" })
public class SysFilterConfig {

	@Bean
	public FilterRegistrationBean systemFilterRegistration() {
		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setFilter(new JurisdictionFilter());
		registration.addUrlPatterns("/*");
		registration.setName("systemFilter");
		registration.setOrder(FilterRegistrationBean.LOWEST_PRECEDENCE);
		return registration;
	}
}
