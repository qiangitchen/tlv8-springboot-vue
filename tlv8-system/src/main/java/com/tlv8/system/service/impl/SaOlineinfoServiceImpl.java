package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.dao.SaOnlineinfoDao;
import com.tlv8.system.pojo.SaOnlineinfo;
import com.tlv8.system.service.ISaOnlineinfoService;

@Service
public class SaOlineinfoServiceImpl implements ISaOnlineinfoService {

	@Autowired
	SaOnlineinfoDao dao;

	@Override
	public SaOnlineinfo selectByPrimaryKey(String sid) {
		return dao.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOnlineinfo obj) {
		return dao.insertData(obj);
	}

	@Override
	public int updateData(SaOnlineinfo obj) {
		return dao.updateData(obj);
	}

	@Override
	public int deleteData(SaOnlineinfo obj) {
		return dao.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return dao.deleteDataByPrimaryKey(sid);
	}

}
