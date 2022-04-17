package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SaOnlineinfoMapper;
import com.tlv8.system.pojo.SaOnlineinfo;
import com.tlv8.system.service.ISaOnlineinfoService;

@Service
public class SaOlineinfoServiceImpl implements ISaOnlineinfoService {

	@Autowired
	SaOnlineinfoMapper saOnlineinfoMapper;

	@Override
	public SaOnlineinfo selectByPrimaryKey(String sid) {
		return saOnlineinfoMapper.selectByPrimaryKey(sid);
	}

	@Override
	public SaOnlineinfo selectBySessionID(String sessionid) {
		return saOnlineinfoMapper.selectBySessionID(sessionid);
	}

	@Override
	public int insertData(SaOnlineinfo obj) {
		return saOnlineinfoMapper.insertData(obj);
	}

	@Override
	public int updateData(SaOnlineinfo obj) {
		return saOnlineinfoMapper.updateData(obj);
	}

	@Override
	public int deleteData(SaOnlineinfo obj) {
		return saOnlineinfoMapper.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return saOnlineinfoMapper.deleteDataByPrimaryKey(sid);
	}

	@Override
	public int deleteDataBySessionID(String sessionid) {
		return saOnlineinfoMapper.deleteDataBySessionID(sessionid);
	}

	@Override
	public long getCount() {
		return saOnlineinfoMapper.getCount();
	}

}
