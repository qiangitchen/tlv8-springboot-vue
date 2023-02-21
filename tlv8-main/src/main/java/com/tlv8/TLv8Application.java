package com.tlv8;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

/**
 * 应用类-运行此类-启动后台项目
 * 
 * @author chenqian
 *
 */
@SpringBootApplication
@ImportResource("ureport-console-context.xml")
public class TLv8Application {
	public static void main(String[] args) {
		SpringApplication.run(TLv8Application.class, args);
	}
}
