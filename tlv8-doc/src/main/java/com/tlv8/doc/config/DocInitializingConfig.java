package com.tlv8.doc.config;

import java.io.File;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import com.tlv8.doc.core.config.ServerConfigInit;
import com.tlv8.doc.lucene.LuceneService;

/**
 * 项目启动时执行的配置
 * 
 * @author 陈乾
 *
 */
@Component
public class DocInitializingConfig implements InitializingBean {
	protected final Logger infolog = Logger.getLogger(getClass());

	@Override
	public void afterPropertiesSet() throws Exception {
		try {
			File curfile = new File(System.getProperty("user.dir"));
			ServerConfigInit.DOC_HOME = curfile.getParentFile().getParentFile().getParentFile().getCanonicalPath();
			ServerConfigInit.init();// 初始化文件存储位置信息
			LuceneService.start();// 启动索引服务
		} catch (Throwable e) {
			infolog.error("启动文档服务异常!" + e);
			e.printStackTrace();
		}
	}
}
