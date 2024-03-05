package com.tlv8.system.service;

import com.tlv8.system.pojo.SaOpPermission;

import java.util.List;

public interface SaOpPermissionService {
	/**
	 * 根据主键获取数据对象
	 *
	 * @param sid
	 * @return
	 */
	SaOpPermission selectByPrimaryKey(String sid);

	List<SaOpPermission> selectByRoleMenu(String spermissionroleid, String smenuid);

	/**
	 * 根据角色id获取菜单授权列表
	 *
	 * @param spermissionroleid
	 * @return
	 */
	List<SaOpPermission> selectByRoleID(String spermissionroleid);

	/**
	 * 插入数据到数据库
	 *
	 * @param obj
	 * @return
	 */
	int insertData(SaOpPermission obj);

	/**
	 * 更新数据
	 *
	 * @param obj
	 * @return
	 */
	int updateData(SaOpPermission obj);

	/**
	 * 删除对象对应的数据
	 *
	 * @param obj
	 * @return
	 */
	int deleteData(SaOpPermission obj);

	/**
	 * 删除指定主键的数据
	 *
	 * @param sid
	 * @return
	 */
	int deleteDataByPrimaryKey(String sid);

	/**
	 * 逻辑删除指定主键的数据
	 *
	 * @param sid
	 * @return
	 */
	int logicDeleteDataByPrimaryKey(String sid);

	/**
	 * 逻辑恢复指定主键的数据
	 *
	 * @param sid
	 * @return
	 */
	int logicRecoveryByPrimaryKey(String sid);

	/**
	 * 根据角色id和菜单id删除数据
	 * 
	 * @param spermissionroleid
	 * @param smenuid
	 * @return
	 */
	int deleteByRoleMenu(String spermissionroleid, String smenuid);
}
