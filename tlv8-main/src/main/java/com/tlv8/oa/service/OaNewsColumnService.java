package com.tlv8.oa.service;

import com.tlv8.oa.pojo.OaNewsColumn;

import java.util.List;

/**
 * Created by TLv8 IDE on 2024/03/21.
 */
public interface OaNewsColumnService {

	int deleteByPrimaryKey(String id);
	
	int insert(OaNewsColumn row);
	
	OaNewsColumn selectByPrimaryKey(String id);
	
	List<OaNewsColumn> selectAll();
	
	int updateByPrimaryKey(OaNewsColumn row);
}
