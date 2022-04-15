package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SaOpOrgMapper;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.service.ISaOpOrgService;

@Service
public class SaOpOrgServiceImpl implements ISaOpOrgService{
	
	@Autowired
	SaOpOrgMapper sSaOpOrgMapper;

	@Override
	public SaOpOrg selectByPrimaryKey(String sid) {
		return sSaOpOrgMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpOrg obj) {
		return sSaOpOrgMapper.insertData(obj);
	}

	@Override
	public int updateData(SaOpOrg obj) {
		return sSaOpOrgMapper.updateData(obj);
	}

	@Override
	public int deleteData(SaOpOrg obj) {
		return sSaOpOrgMapper.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return sSaOpOrgMapper.deleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicDeleteDataByPrimaryKey(String sid) {
		return sSaOpOrgMapper.logicDeleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicRecoveryByPrimaryKey(String sid) {
		return sSaOpOrgMapper.logicRecoveryByPrimaryKey(sid);
	}
	
}
