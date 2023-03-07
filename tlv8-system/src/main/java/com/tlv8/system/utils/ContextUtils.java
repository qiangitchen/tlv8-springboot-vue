package com.tlv8.system.utils;

import java.util.HashMap;

import com.tlv8.common.utils.ServletUtils;
import com.tlv8.common.utils.spring.SpringUtils;
import com.tlv8.system.action.GetSysParams;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.pojo.SysLogin;
import com.tlv8.system.service.ISysLoginService;

/**
 * 系统上下文公用类
 * 
 * @author 陈乾
 *
 */
public class ContextUtils {

	/**
	 * 根据人员id获取上下文信息
	 * 
	 * @param personid
	 * @return com.tlv8.system.bean.ContextBean
	 */
	public static ContextBean getContext(String personid) {
		ContextBean contextBean = new ContextBean();
		try {
			ISysLoginService loginsv = SpringUtils.getBean(ISysLoginService.class);
			SysLogin sysLogin = loginsv.getInfoByPersonId(personid);
			if (sysLogin != null) {
				GetSysParams sysParams = SpringUtils.getBean(GetSysParams.class);
				HashMap<String, String> params = sysParams.getSysParamsFunc(sysLogin);
				contextBean.initLoginContext(ServletUtils.getRequest(), params);
			}
		} catch (Exception e) {
		}
		return contextBean;
	}
}
