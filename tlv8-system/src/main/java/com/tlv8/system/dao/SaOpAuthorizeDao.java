package com.tlv8.system.dao;

import com.tlv8.system.pojo.SaOpAuthorize;

public interface SaOpAuthorizeDao {
	/**
	 * 根据主键获取数据对象
	 * 
	 * @param sid
	 * @return
	 */
	SaOpAuthorize selectByPrimaryKey(String sid);

	/**
	 * 插入数据到数据库
	 * 
	 * @param saoporg
	 * @return
	 */
	int insertData(SaOpAuthorize obj);

	/**
	 * 更新数据
	 * 
	 * @param saoporg
	 * @return
	 */
	int updateData(SaOpAuthorize obj);

	/**
	 * 删除对象对应的数据
	 * 
	 * @param saoporg
	 * @return
	 */
	int deleteData(SaOpAuthorize obj);

	/**
	 * 删除指定主键的数据
	 * 
	 * @param sid
	 * @return
	 */
	int deleteDataByPrimaryKey(String sid);

}
