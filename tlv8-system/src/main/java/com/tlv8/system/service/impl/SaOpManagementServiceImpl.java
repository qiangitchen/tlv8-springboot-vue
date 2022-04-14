package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.dao.SaOpManagementDao;
import com.tlv8.system.pojo.SaOpManagement;
import com.tlv8.system.service.ISaOpManagementService;

@Service
public class SaOpManagementServiceImpl implements ISaOpManagementService {

	@Autowired
	SaOpManagementDao dao;

	@Override
	public SaOpManagement selectByPrimaryKey(String sid) {
		return dao.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpManagement obj) {
		return dao.insertData(obj);
	}

	@Override
	public int updateData(SaOpManagement obj) {
		return dao.updateData(obj);
	}

	@Override
	public int deleteData(SaOpManagement obj) {
		return dao.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return dao.deleteDataByPrimaryKey(sid);
	}

}
