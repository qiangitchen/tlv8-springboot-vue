package com.tlv8.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.system.mapper.SysParamsMapper;
import com.tlv8.system.service.SysParamsService;

public class SysParamsServiceImpl implements SysParamsService {

	@Autowired
	SysParamsMapper sysParamsMapper;

	@Override
	public Map<String, String> getOrgInfo(String orgid) {
		return sysParamsMapper.getOrgInfo(orgid);
	}

	@Override
	public Map<String, String> getOgnInfo(String orgfid) {
		return sysParamsMapper.getOgnInfo(orgfid);
	}

	@Override
	public Map<String, String> getDeptInfo(String orgfid) {
		return sysParamsMapper.getDeptInfo(orgfid);
	}

	@Override
	public Map<String, String> getPositionInfo(String orgfid) {
		return sysParamsMapper.getPositionInfo(orgfid);
	}

	@Override
	public Map<String, String> getPersonInfo(String personid) {
		return sysParamsMapper.getPersonInfo(personid);
	}

	@Override
	public Map<String, String> getUserInfo(String orgid, String personid) {
		return sysParamsMapper.getUserInfo(orgid, personid);
	}
	
	@Override
	public List<Map<String, String>> getRoles(String personfid){
		return sysParamsMapper.getRoles(personfid);
	}

}
