package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.dao.SaOpAuthorizeDao;
import com.tlv8.system.pojo.SaOpAuthorize;
import com.tlv8.system.service.ISaOpAuthorizeService;

@Service
public class SaOpAuthorizeServiceImpl implements ISaOpAuthorizeService {

	@Autowired
	SaOpAuthorizeDao dao;

	@Override
	public SaOpAuthorize selectByPrimaryKey(String sid) {
		return dao.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpAuthorize obj) {
		return dao.insertData(obj);
	}

	@Override
	public int updateData(SaOpAuthorize obj) {
		return dao.updateData(obj);
	}

	@Override
	public int deleteData(SaOpAuthorize obj) {
		return dao.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return dao.deleteDataByPrimaryKey(sid);
	}

}
