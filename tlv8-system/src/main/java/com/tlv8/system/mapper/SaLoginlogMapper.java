package com.tlv8.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tlv8.system.pojo.SaLoginlog;

@Mapper
public interface SaLoginlogMapper {
	
	List<SaLoginlog> selectList();
	
	/**
	 * 根据主键获取数据对象
	 * 
	 * @param sid
	 * @return
	 */
	SaLoginlog selectByPrimaryKey(String sid);

	/**
	 * 插入数据到数据库
	 * 
	 * @param obj
	 * @return
	 */
	int insertData(SaLoginlog obj);

	/**
	 * 更新数据
	 * 
	 * @param obj
	 * @return
	 */
	int updateData(SaLoginlog obj);

	/**
	 * 删除对象对应的数据
	 * 
	 * @param obj
	 * @return
	 */
	int deleteData(SaLoginlog obj);

	/**
	 * 删除指定主键的数据
	 * 
	 * @param sid
	 * @return
	 */
	int deleteDataByPrimaryKey(String sid);

}
