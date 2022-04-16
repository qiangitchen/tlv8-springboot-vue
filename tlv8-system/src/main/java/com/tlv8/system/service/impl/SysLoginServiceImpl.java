package com.tlv8.system.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.system.mapper.SysLoginMapper;
import com.tlv8.system.service.SysLoginService;

public class SysLoginServiceImpl implements SysLoginService {

	@Autowired
	SysLoginMapper sysLoginMapper;

	@Override
	public Map<String, String> getInfoByCode(String code) {
		return sysLoginMapper.getInfoByCode(code);
	}

	@Override
	public Map<String, String> getInfoByCASN(String casn) {
		return sysLoginMapper.getInfoByCASN(casn);
	}

	@Override
	public Map<String, String> getInfoBySignm(String signm) {
		return sysLoginMapper.getInfoBySignm(signm);
	}

}
