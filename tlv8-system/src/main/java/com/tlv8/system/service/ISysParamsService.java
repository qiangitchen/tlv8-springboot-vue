package com.tlv8.system.service;

import java.util.List;
import java.util.Map;

public interface ISysParamsService {
	/**
	 * 获取组织信息
	 * 
	 * @param orgid
	 * @return
	 */
	Map<String, String> getOrgInfo(String orgid);

	/**
	 * 获取机构信息
	 * 
	 * @param orgfid
	 * @return
	 */
	Map<String, String> getOgnInfo(String orgfid);

	/**
	 * 获取部门信息
	 * 
	 * @param orgfid
	 * @return
	 */
	Map<String, String> getDeptInfo(String orgfid);

	/**
	 * 获取岗位信息
	 * 
	 * @param orgfid
	 * @return
	 */
	Map<String, String> getPositionInfo(String orgfid);

	/**
	 * 获取人员信息
	 * 
	 * @param personid
	 * @return
	 */
	Map<String, String> getPersonInfo(String personid);

	/**
	 * 获取用户信息
	 * 
	 * @param orgid
	 * @param personid
	 * @return
	 */
	Map<String, String> getUserInfo(String orgid, String personid);
	
	/**
	 * 获取用户的角色列表
	 * 
	 * @param personfid
	 * @return
	 */
	List<Map<String, String>> getRoles(String personfid);
}