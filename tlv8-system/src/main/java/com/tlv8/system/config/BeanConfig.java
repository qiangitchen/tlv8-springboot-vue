package com.tlv8.system.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.tlv8.system.action.GetSysParams;
import com.tlv8.system.action.Login;
import com.tlv8.system.action.SAPerson;
import com.tlv8.system.action.WriteLoginLog;

/**
 * 配置动态类
 * 
 * @author chenqian
 *
 */
@Configuration
public class BeanConfig {

	@Bean
	public Login initLogin() {
		Login login = new Login();
		return login;
	}

	@Bean
	public GetSysParams initGetSysParams() {
		GetSysParams sysparams = new GetSysParams();
		return sysparams;
	}

	@Bean
	public SAPerson initSAPerson() {
		SAPerson bean = new SAPerson();
		return bean;
	}

	@Bean
	public WriteLoginLog initWriteLoginLog() {
		WriteLoginLog bean = new WriteLoginLog();
		return bean;
	}
}
