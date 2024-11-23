package com.tlv8.system.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.tlv8.system.pojo.SaOpManagement;

import java.util.List;
import java.util.Map;

@Mapper
public interface SaOpManagementMapper {
	/**
	 * 根据主键获取数据对象
	 *
	 * @param sid
	 * @return
	 */
	SaOpManagement selectByPrimaryKey(String sid);

	/**
	 * 根据组织id获取管理列表
	 *
	 * @param orgid
	 * @return
	 */
	List<SaOpManagement> selectByOrgID(String orgid);

	/**
	 * 根据组织id和管理的组织id获取管理列表
	 * 
	 * @param param{orgid:"",manageorgid:""}
	 * @return
	 */
	List<SaOpManagement> selectByOrgIdManageorgId(Map<String, String> param);

	/**
	 * 插入数据到数据库
	 *
	 * @param obj
	 * @return
	 */
	int insertData(SaOpManagement obj);

	/**
	 * 更新数据
	 *
	 * @param obj
	 * @return
	 */
	int updateData(SaOpManagement obj);

	/**
	 * 删除对象对应的数据
	 *
	 * @param obj
	 * @return
	 */
	int deleteData(SaOpManagement obj);

	/**
	 * 删除指定主键的数据
	 *
	 * @param sid
	 * @return
	 */
	int deleteDataByPrimaryKey(String sid);

}
