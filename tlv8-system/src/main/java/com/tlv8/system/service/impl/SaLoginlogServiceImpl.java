package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.dao.SaLoginlogDao;
import com.tlv8.system.pojo.SaLoginlog;
import com.tlv8.system.service.ISaLoginlogService;

@Service
public class SaLoginlogServiceImpl implements ISaLoginlogService {

	@Autowired
	SaLoginlogDao dao;

	@Override
	public SaLoginlog selectByPrimaryKey(String sid) {
		return dao.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaLoginlog obj) {
		return dao.insertData(obj);
	}

	@Override
	public int updateData(SaLoginlog obj) {
		return dao.updateData(obj);
	}

	@Override
	public int deleteData(SaLoginlog obj) {
		return dao.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return dao.deleteDataByPrimaryKey(sid);
	}

}
