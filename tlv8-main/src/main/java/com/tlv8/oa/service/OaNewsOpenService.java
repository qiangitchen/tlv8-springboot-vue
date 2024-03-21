package com.tlv8.oa.service;

import com.tlv8.oa.pojo.OaNewsOpen;

import java.util.List;

/**
 * Created by TLv8 IDE on 2024/03/21.
 */
public interface OaNewsOpenService {

	int deleteByPrimaryKey(String id);
	
	int insert(OaNewsOpen row);
	
	OaNewsOpen selectByPrimaryKey(String id);
	
	List<OaNewsOpen> selectAll();
	
	int updateByPrimaryKey(OaNewsOpen row);
}
