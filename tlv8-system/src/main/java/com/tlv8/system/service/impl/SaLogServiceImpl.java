package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SaLogMapper;
import com.tlv8.system.pojo.SaLog;
import com.tlv8.system.service.ISaLogService;

@Service
public class SaLogServiceImpl implements ISaLogService {

	@Autowired
	SaLogMapper saLogMapper;

	@Override
	public SaLog selectByPrimaryKey(String sid) {
		return saLogMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaLog obj) {
		return saLogMapper.insertData(obj);
	}

	@Override
	public int updateData(SaLog obj) {
		return saLogMapper.updateData(obj);
	}

	@Override
	public int deleteData(SaLog obj) {
		return saLogMapper.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return saLogMapper.deleteDataByPrimaryKey(sid);
	}

}
