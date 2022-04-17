package com.tlv8.system.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SysLoginMapper {

	/**
	 * 根据账号获取用户信息（账号：用户编号、登录名、手机号）
	 * 
	 * @param code
	 * @return
	 */
	Map<String, Object> getInfoByCode(Map<String, String> map);

	/**
	 * 根据ca编号获取用户信息
	 * 
	 * @param casn
	 * @return
	 */
	Map<String, Object> getInfoByCASN(String casn);

	/**
	 * 根据ca签名获取用户信息
	 * 
	 * @param casn
	 * @return
	 */
	Map<String, Object> getInfoBySignm(String signm);

}
