package com.tlv8.system.config;

import com.tlv8.system.online.OnlineInitListener;
import com.tlv8.system.service.ISaOnlineinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.tlv8.system.help.OnlineHelper;

@Configuration
@SuppressWarnings({ "rawtypes", "unchecked" })
public class ListenerConfig {

	@Autowired
	ISaOnlineinfoService onlineinfosvr;

	@Bean
	public ServletListenerRegistrationBean onlineLlistenerRegistrationBean() {
		ServletListenerRegistrationBean srb = new ServletListenerRegistrationBean();
		srb.setListener(new OnlineHelper(onlineinfosvr));
		return srb;
	}
	
	@Bean
	public ServletListenerRegistrationBean onlineInitLlistenerRegistrationBean() {
		ServletListenerRegistrationBean srb = new ServletListenerRegistrationBean();
		srb.setListener(new OnlineInitListener(onlineinfosvr));
		return srb;
	}
	
}
