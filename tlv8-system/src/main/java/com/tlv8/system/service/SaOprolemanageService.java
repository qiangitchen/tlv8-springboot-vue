package com.tlv8.system.service;

import com.tlv8.system.pojo.SaOprolemanage;

import java.util.List;

/**
 * Created by TLv8 IDE on 2024/11/23.
 */
public interface SaOprolemanageService {

	int deleteByPrimaryKey(String id);
	
	int insert(SaOprolemanage row);
	
	SaOprolemanage selectByPrimaryKey(String id);
	
	List<SaOprolemanage> selectAll();
	
	int updateByPrimaryKey(SaOprolemanage row);
}
