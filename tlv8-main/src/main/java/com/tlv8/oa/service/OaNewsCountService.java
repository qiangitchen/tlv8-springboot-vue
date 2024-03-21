package com.tlv8.oa.service;

import com.tlv8.oa.pojo.OaNewsCount;

import java.util.List;

/**
 * Created by TLv8 IDE on 2024/03/21.
 */
public interface OaNewsCountService {

	int deleteByPrimaryKey(String id);
	
	int insert(OaNewsCount row);
	
	OaNewsCount selectByPrimaryKey(String id);
	
	List<OaNewsCount> selectAll();
	
	int updateByPrimaryKey(OaNewsCount row);
}
