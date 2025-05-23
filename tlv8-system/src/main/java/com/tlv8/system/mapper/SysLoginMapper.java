package com.tlv8.system.mapper;

import java.util.Map;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.tlv8.system.pojo.SysLogin;
import org.apache.ibatis.annotations.Mapper;

@DS("system")
@Mapper
public interface SysLoginMapper {

	/**
	 * 根据账号获取用户信息（账号：用户编号、登录名、手机号）
	 * 
	 * @param map
	 * @return
	 */
	SysLogin getInfoByCode(Map<String, String> map);

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

	/**
	 * 根据personid获取用户信息
	 * 
	 * @param personid
	 * @return
	 */
	SysLogin getInfoByPersonId(String personid);

}
