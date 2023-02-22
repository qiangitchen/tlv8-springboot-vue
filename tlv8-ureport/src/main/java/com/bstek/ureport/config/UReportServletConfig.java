package com.bstek.ureport.config;

import com.bstek.ureport.console.UReportServlet;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@SuppressWarnings({ "rawtypes", "unchecked" })
public class UReportServletConfig {

	@Bean
	public ServletRegistrationBean webServletRegistrationBean() {
		ServletRegistrationBean bean = new ServletRegistrationBean();
		bean.setServlet(new UReportServlet());
		bean.addUrlMappings("/ureport/*");
		bean.setName("ureportServlet");
		return bean;
	}
}
