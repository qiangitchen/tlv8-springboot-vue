package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.dao.SaOpOrgDao;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.service.ISaOpOrgService;

@Service
public class SaOpOrgServiceImpl implements ISaOpOrgService{
	
	@Autowired
	SaOpOrgDao saoporgdao;

	@Override
	public SaOpOrg selectByPrimaryKey(String sid) {
		return saoporgdao.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpOrg obj) {
		return saoporgdao.insertData(obj);
	}

	@Override
	public int updateData(SaOpOrg obj) {
		return saoporgdao.updateData(obj);
	}

	@Override
	public int deleteData(SaOpOrg obj) {
		return saoporgdao.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return saoporgdao.deleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicDeleteDataByPrimaryKey(String sid) {
		return saoporgdao.logicDeleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicRecoveryByPrimaryKey(String sid) {
		return saoporgdao.logicRecoveryByPrimaryKey(sid);
	}
	
}
