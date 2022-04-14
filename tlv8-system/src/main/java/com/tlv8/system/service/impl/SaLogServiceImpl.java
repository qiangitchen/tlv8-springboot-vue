package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.dao.SaLogDao;
import com.tlv8.system.pojo.SaLog;
import com.tlv8.system.service.ISaLogService;

@Service
public class SaLogServiceImpl implements ISaLogService {

	@Autowired
	SaLogDao dao;

	@Override
	public SaLog selectByPrimaryKey(String sid) {
		return dao.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaLog obj) {
		return dao.insertData(obj);
	}

	@Override
	public int updateData(SaLog obj) {
		return dao.updateData(obj);
	}

	@Override
	public int deleteData(SaLog obj) {
		return dao.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return dao.deleteDataByPrimaryKey(sid);
	}

}
