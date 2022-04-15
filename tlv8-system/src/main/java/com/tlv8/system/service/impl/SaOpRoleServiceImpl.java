package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SaOpRoleMapper;
import com.tlv8.system.pojo.SaOpRole;
import com.tlv8.system.service.ISaOpRoleService;

@Service
public class SaOpRoleServiceImpl implements ISaOpRoleService {

	@Autowired
	SaOpRoleMapper saOpRoleMapper;

	@Override
	public SaOpRole selectByPrimaryKey(String sid) {
		return saOpRoleMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpRole obj) {
		return saOpRoleMapper.insertData(obj);
	}

	@Override
	public int updateData(SaOpRole obj) {
		return saOpRoleMapper.updateData(obj);
	}

	@Override
	public int deleteData(SaOpRole obj) {
		return saOpRoleMapper.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return saOpRoleMapper.deleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicDeleteDataByPrimaryKey(String sid) {
		return saOpRoleMapper.logicDeleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicRecoveryByPrimaryKey(String sid) {
		return saOpRoleMapper.logicRecoveryByPrimaryKey(sid);
	}

}
