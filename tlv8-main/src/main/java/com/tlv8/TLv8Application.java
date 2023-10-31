package com.tlv8;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

import cn.dev33.satoken.SaManager;

/**
 * 应用类-运行此类-启动后台项目
 * 
 * @author chenqian
 *
 */
@SpringBootApplication
@ImportResource("classpath:ureport-console-context.xml")
public class TLv8Application {
	private static final Logger logger = LoggerFactory.getLogger(TLv8Application.class);

	public static void main(String[] args) {
		SpringApplication.run(TLv8Application.class, args);
		logger.info("启动成功：Sa-Token配置如下：" + SaManager.getConfig());
	}
}
