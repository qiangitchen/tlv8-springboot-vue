package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SaOpAuthorizeMapper;
import com.tlv8.system.pojo.SaOpAuthorize;
import com.tlv8.system.service.ISaOpAuthorizeService;

@Service
public class SaOpAuthorizeServiceImpl implements ISaOpAuthorizeService {

	@Autowired
	SaOpAuthorizeMapper saOpAuthorizeMapper;

	@Override
	public SaOpAuthorize selectByPrimaryKey(String sid) {
		return saOpAuthorizeMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpAuthorize obj) {
		return saOpAuthorizeMapper.insertData(obj);
	}

	@Override
	public int updateData(SaOpAuthorize obj) {
		return saOpAuthorizeMapper.updateData(obj);
	}

	@Override
	public int deleteData(SaOpAuthorize obj) {
		return saOpAuthorizeMapper.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return saOpAuthorizeMapper.deleteDataByPrimaryKey(sid);
	}

}
