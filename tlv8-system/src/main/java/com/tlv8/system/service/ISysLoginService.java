package com.tlv8.system.service;

import com.tlv8.system.pojo.SysLogin;

public interface ISysLoginService {
	/**
	 * 根据账号获取用户信息（账号：用户编号、登录名、手机号）
	 * 
	 * @param code
	 * @return
	 */
	SysLogin getInfoByCode(String code, String loginname, String mphone);

	/**
	 * 根据ca编号获取用户信息
	 * 
	 * @param casn
	 * @return
	 */
	SysLogin getInfoByCASN(String casn);

	/**
	 * 根据ca签名获取用户信息
	 * 
	 * @param signm
	 * @return
	 */
	SysLogin getInfoBySignm(String signm);
}
