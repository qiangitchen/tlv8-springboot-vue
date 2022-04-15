package com.tlv8.config;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.tlv8.common.filter.RepeatableFilter;
import com.tlv8.common.filter.XssFilter;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.doc.controller.svlet.DispathServelet;

/**
 * Filter配置
 *
 */
@Configuration
@SuppressWarnings({ "rawtypes", "unchecked" })
public class FilterConfig {
	@Value("${xss.excludes}")
	private String excludes;

	@Value("${xss.urlPatterns}")
	private String urlPatterns;

	@Bean
	@ConditionalOnProperty(value = "xss.enabled", havingValue = "true")
	public FilterRegistrationBean xssFilterRegistration() {
		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setDispatcherTypes(DispatcherType.REQUEST);
		registration.setFilter(new XssFilter());
		registration.addUrlPatterns(StringUtils.split(urlPatterns, ","));
		registration.setName("xssFilter");
		registration.setOrder(FilterRegistrationBean.HIGHEST_PRECEDENCE);
		Map<String, String> initParameters = new HashMap<String, String>();
		initParameters.put("excludes", excludes);
		registration.setInitParameters(initParameters);
		return registration;
	}

	@Bean
	public FilterRegistrationBean someFilterRegistration() {
		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setFilter(new RepeatableFilter());
		registration.addUrlPatterns("/*");
		registration.setName("repeatableFilter");
		registration.setOrder(FilterRegistrationBean.LOWEST_PRECEDENCE);
		return registration;
	}

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
