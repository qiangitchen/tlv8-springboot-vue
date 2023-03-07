package com.tlv8.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SysParamsMapper;
import com.tlv8.system.pojo.SaOpRole;
import com.tlv8.system.pojo.SysParams;
import com.tlv8.system.service.ISysParamsService;

@Service
public class SysParamsServiceImpl implements ISysParamsService {

	@Autowired
	SysParamsMapper sysParamsMapper;

	@Override
	public SysParams getOrgInfo(String orgid) {
		return sysParamsMapper.getOrgInfo(orgid);
	}

	@Override
	public SysParams getOgnInfo(String orgfid) {
		return sysParamsMapper.getOgnInfo(orgfid);
	}

	@Override
	public SysParams getDeptInfo(String orgfid) {
		return sysParamsMapper.getDeptInfo(orgfid);
	}

	@Override
	public SysParams getPositionInfo(String orgfid) {
		return sysParamsMapper.getPositionInfo(orgfid);
	}

	@Override
	public SysParams getPersonInfo(String personid) {
		return sysParamsMapper.getPersonInfo(personid);
	}

	@Override
	public SysParams getUserInfo(String orgid, String personid) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("orgid", orgid);
		map.put("personid", personid);
		return sysParamsMapper.getUserInfo(map);
	}

	@Override
	public List<SaOpRole> getRoles(String personfid) {
		return sysParamsMapper.getRoles(personfid);
	}

}
