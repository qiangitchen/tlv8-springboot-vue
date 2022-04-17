package com.tlv8.system.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SysLoginMapper;
import com.tlv8.system.service.ISysLoginService;

@Service
public class SysLoginServiceImpl implements ISysLoginService {

	@Autowired
	SysLoginMapper sysLoginMapper;

	@Override
	public Map<String, Object> getInfoByCode(String code, String loginname, String mphone) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("code", code);
		map.put("loginname", loginname);
		map.put("mphone", mphone);
		return sysLoginMapper.getInfoByCode(map);
	}

	@Override
	public Map<String, Object> getInfoByCASN(String casn) {
		return sysLoginMapper.getInfoByCASN(casn);
	}

	@Override
	public Map<String, Object> getInfoBySignm(String signm) {
		return sysLoginMapper.getInfoBySignm(signm);
	}

}
