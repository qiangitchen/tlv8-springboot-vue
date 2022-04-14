package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.dao.SaOpManagetypeDao;
import com.tlv8.system.pojo.SaOpManagetype;
import com.tlv8.system.service.ISaOpManagetypeService;

@Service
public class SaOpManagetypeServiceImpl implements ISaOpManagetypeService {

	@Autowired
	SaOpManagetypeDao dao;

	@Override
	public SaOpManagetype selectByPrimaryKey(String sid) {
		return dao.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpManagetype obj) {
		return dao.insertData(obj);
	}

	@Override
	public int updateData(SaOpManagetype obj) {
		return dao.updateData(obj);
	}

	@Override
	public int deleteData(SaOpManagetype obj) {
		return dao.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return dao.deleteDataByPrimaryKey(sid);
	}

}
