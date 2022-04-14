package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.dao.SaOpRoleDao;
import com.tlv8.system.pojo.SaOpRole;
import com.tlv8.system.service.ISaOpRoleService;

@Service
public class SaOpRoleServiceImpl implements ISaOpRoleService {

	@Autowired
	SaOpRoleDao dao;

	@Override
	public SaOpRole selectByPrimaryKey(String sid) {
		return dao.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpRole obj) {
		return dao.insertData(obj);
	}

	@Override
	public int updateData(SaOpRole obj) {
		return dao.updateData(obj);
	}

	@Override
	public int deleteData(SaOpRole obj) {
		return dao.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return dao.deleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicDeleteDataByPrimaryKey(String sid) {
		return dao.logicDeleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicRecoveryByPrimaryKey(String sid) {
		return dao.logicRecoveryByPrimaryKey(sid);
	}

}
