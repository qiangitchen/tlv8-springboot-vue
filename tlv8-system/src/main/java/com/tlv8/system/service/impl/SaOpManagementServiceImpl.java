package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SaOpManagementMapper;
import com.tlv8.system.pojo.SaOpManagement;
import com.tlv8.system.service.ISaOpManagementService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SaOpManagementServiceImpl implements ISaOpManagementService {

	@Autowired
	SaOpManagementMapper saOpManagementMapper;

	@Override
	public SaOpManagement selectByPrimaryKey(String sid) {
		return saOpManagementMapper.selectByPrimaryKey(sid);
	}

	@Override
	public List<SaOpManagement> selectByOrgID(String orgid) {
		return saOpManagementMapper.selectByOrgID(orgid);
	}

	@Override
	public List<SaOpManagement> selectByOrgIdManageorgId(String orgid, String manageorgid) {
		Map<String, String> param = new HashMap<>();
		param.put("orgid", orgid);
		param.put("manageorgid", manageorgid);
		return saOpManagementMapper.selectByOrgIdManageorgId(param);
	}

	@Override
	public int insertData(SaOpManagement obj) {
		return saOpManagementMapper.insertData(obj);
	}

	@Override
	public int updateData(SaOpManagement obj) {
		return saOpManagementMapper.updateData(obj);
	}

	@Override
	public int deleteData(SaOpManagement obj) {
		return saOpManagementMapper.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return saOpManagementMapper.deleteDataByPrimaryKey(sid);
	}

}
