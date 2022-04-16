package com.tlv8.doc.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.tlv8.doc.controller.svlet.DispathServelet;

@Configuration
@SuppressWarnings({ "unchecked", "rawtypes" })
public class DocFilterConfig {

	@Bean
	public FilterRegistrationBean docsomeFilterRegistration() {
		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setFilter(new DispathServelet());
		registration.addUrlPatterns("/DocServer/*");
		registration.setName("docserverrepeatableFilter");
		registration.setOrder(FilterRegistrationBean.LOWEST_PRECEDENCE);
		return registration;
	}

}
