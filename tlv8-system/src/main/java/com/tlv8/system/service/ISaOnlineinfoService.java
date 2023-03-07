package com.tlv8.system.service;

import java.util.List;

import com.tlv8.system.pojo.SaOnlineinfo;

public interface ISaOnlineinfoService {

	/**
	 * 获取在线用户信息列表
	 * 
	 * @return
	 */
	List<SaOnlineinfo> selectList();

	/**
	 * 根据主键获取数据对象
	 * 
	 * @param sid
	 * @return
	 */
	SaOnlineinfo selectByPrimaryKey(String sid);

	/**
	 * 根据sessionid获取在线用户信息
	 * 
	 * @param sessionid
	 * @return
	 */
	SaOnlineinfo selectBySessionID(String sessionid);

	/**
	 * 插入数据到数据库
	 * 
	 * @param obj
	 * @return
	 */
	int insertData(SaOnlineinfo obj);

	/**
	 * 更新数据
	 * 
	 * @param obj
	 * @return
	 */
	int updateData(SaOnlineinfo obj);

	/**
	 * 删除对象对应的数据
	 * 
	 * @param obj
	 * @return
	 */
	int deleteData(SaOnlineinfo obj);

	/**
	 * 删除指定主键的数据
	 * 
	 * @param sid
	 * @return
	 */
	int deleteDataByPrimaryKey(String sid);

	/**
	 * 删除指定sessionid的在线用户信息
	 * 
	 * @param sessionid
	 * @return
	 */
	int deleteDataBySessionID(String sessionid);

	/**
	 * 删除指定机器码的在线用户信息
	 * 
	 * @param machineCode
	 * @return
	 */
	int deleteDataByMachineCode(String machineCode);

	/**
	 * 统计在线用户数
	 * 
	 * @return
	 */
	long getCount();

}
