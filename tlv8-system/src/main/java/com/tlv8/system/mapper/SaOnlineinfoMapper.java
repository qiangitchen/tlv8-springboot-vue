package com.tlv8.system.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.tlv8.system.pojo.SaOnlineinfo;

@Mapper
public interface SaOnlineinfoMapper {
	/**
	 * 根据主键获取数据对象
	 * 
	 * @param sid
	 * @return
	 */
	SaOnlineinfo selectByPrimaryKey(String sid);

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

}
