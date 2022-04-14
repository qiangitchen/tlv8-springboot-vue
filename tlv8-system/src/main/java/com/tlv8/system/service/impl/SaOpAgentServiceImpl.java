package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.dao.SaOpAgentDao;
import com.tlv8.system.pojo.SaOpAgent;
import com.tlv8.system.service.ISaOpAgentService;

@Service
public class SaOpAgentServiceImpl implements ISaOpAgentService{
	
	@Autowired
	SaOpAgentDao saoporgdao;

	@Override
	public SaOpAgent selectByPrimaryKey(String sid) {
		return saoporgdao.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpAgent obj) {
		return saoporgdao.insertData(obj);
	}

	@Override
	public int updateData(SaOpAgent obj) {
		return saoporgdao.updateData(obj);
	}

	@Override
	public int deleteData(SaOpAgent obj) {
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
