package com.tlv8.common.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * 程序注解配置
 *
 */
@Configuration
// 指定要扫描的Mapper类的包的路径
@MapperScan("com.tlv8.**.mapper")
public class ApplicationConfig {

}
