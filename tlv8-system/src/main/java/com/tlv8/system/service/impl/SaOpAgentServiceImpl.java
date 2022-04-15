package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SaOpAgentMapper;
import com.tlv8.system.pojo.SaOpAgent;
import com.tlv8.system.service.ISaOpAgentService;

@Service
public class SaOpAgentServiceImpl implements ISaOpAgentService{
	
	@Autowired
	SaOpAgentMapper saOpAgentMapper;

	@Override
	public SaOpAgent selectByPrimaryKey(String sid) {
		return saOpAgentMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpAgent obj) {
		return saOpAgentMapper.insertData(obj);
	}

	@Override
	public int updateData(SaOpAgent obj) {
		return saOpAgentMapper.updateData(obj);
	}

	@Override
	public int deleteData(SaOpAgent obj) {
		return saOpAgentMapper.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return saOpAgentMapper.deleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicDeleteDataByPrimaryKey(String sid) {
		return saOpAgentMapper.logicDeleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicRecoveryByPrimaryKey(String sid) {
		return saOpAgentMapper.logicRecoveryByPrimaryKey(sid);
	}
	
}
