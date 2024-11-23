package com.tlv8.system.service;

import com.tlv8.system.pojo.SaOprolemanagement;

import java.util.List;

/**
 * Created by TLv8 IDE on 2024/11/23.
 */
public interface SaOprolemanagementService {

	int deleteByPrimaryKey(String id);

	int insert(SaOprolemanagement row);

	SaOprolemanagement selectByPrimaryKey(String id);

	List<SaOprolemanagement> selectAll();

	int updateByPrimaryKey(SaOprolemanagement row);

	List<SaOprolemanagement> selectByOrgIdRoleId(String orgid, String roleid);
}
