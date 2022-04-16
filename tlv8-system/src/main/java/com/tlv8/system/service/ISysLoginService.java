package com.tlv8.system.service;

import java.util.Map;

public interface ISysLoginService {
	/**
	 * 根据账号获取用户信息（账号：用户编号、登录名、手机号）
	 * 
	 * @param code
	 * @return
	 */
	Map<String, String> getInfoByCode(String code);

	/**
	 * 根据ca编号获取用户信息
	 * 
	 * @param casn
	 * @return
	 */
	Map<String, String> getInfoByCASN(String casn);

	/**
	 * 根据ca签名获取用户信息
	 * 
	 * @param casn
	 * @return
	 */
	Map<String, String> getInfoBySignm(String signm);
}
