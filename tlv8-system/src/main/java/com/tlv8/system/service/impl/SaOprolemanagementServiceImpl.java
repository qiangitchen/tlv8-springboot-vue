package com.tlv8.system.service.impl;

import com.tlv8.system.mapper.SaOprolemanagementMapper;
import com.tlv8.system.pojo.SaOprolemanagement;
import com.tlv8.system.service.SaOprolemanagementService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by TLv8 IDE on 2024/11/23.
 */
@Service
public class SaOprolemanagementServiceImpl implements SaOprolemanagementService {
	@Autowired
	private SaOprolemanagementMapper saOprolemanagementMapper;

	public int deleteByPrimaryKey(String id) {
		return saOprolemanagementMapper.deleteByPrimaryKey(id);
	}

	public int insert(SaOprolemanagement row) {
		return saOprolemanagementMapper.insert(row);
	}

	public SaOprolemanagement selectByPrimaryKey(String id) {
		return saOprolemanagementMapper.selectByPrimaryKey(id);
	}

	public List<SaOprolemanagement> selectAll() {
		return saOprolemanagementMapper.selectAll();
	}

	public int updateByPrimaryKey(SaOprolemanagement row) {
		return saOprolemanagementMapper.updateByPrimaryKey(row);
	}

	@Override
	public List<SaOprolemanagement> selectByOrgIdRoleId(String orgid, String roleid) {
		Map<String, String> param = new HashMap<>();
		param.put("orgid", orgid);
		param.put("roleid", roleid);
		return saOprolemanagementMapper.selectByOrgIdRoleId(param);
	}

}
