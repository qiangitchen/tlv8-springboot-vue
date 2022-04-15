package com.tlv8.system.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.tlv8.system.pojo.SaOpAgent;

@Mapper
public interface SaOpAgentMapper {
	/**
	 * 根据主键获取数据对象
	 * 
	 * @param sid
	 * @return
	 */
	SaOpAgent selectByPrimaryKey(String sid);

	/**
	 * 插入数据到数据库
	 * 
	 * @param obj
	 * @return
	 */
	int insertData(SaOpAgent obj);

	/**
	 * 更新数据
	 * 
	 * @param obj
	 * @return
	 */
	int updateData(SaOpAgent obj);

	/**
	 * 删除对象对应的数据
	 * 
	 * @param obj
	 * @return
	 */
	int deleteData(SaOpAgent obj);

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
	 * @param state
	 * @return
	 */
	int logicRecoveryByPrimaryKey(String sid);

}
