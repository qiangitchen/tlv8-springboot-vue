package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SaLoginlogMapper;
import com.tlv8.system.pojo.SaLoginlog;
import com.tlv8.system.service.ISaLoginlogService;

@Service
public class SaLoginlogServiceImpl implements ISaLoginlogService {

	@Autowired
	SaLoginlogMapper saloginlogMapper;

	@Override
	public SaLoginlog selectByPrimaryKey(String sid) {
		return saloginlogMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaLoginlog obj) {
		return saloginlogMapper.insertData(obj);
	}

	@Override
	public int updateData(SaLoginlog obj) {
		return saloginlogMapper.updateData(obj);
	}

	@Override
	public int deleteData(SaLoginlog obj) {
		return saloginlogMapper.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return saloginlogMapper.deleteDataByPrimaryKey(sid);
	}

}
