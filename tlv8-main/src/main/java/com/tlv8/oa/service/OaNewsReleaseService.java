package com.tlv8.oa.service;

import com.tlv8.oa.pojo.OaNewsRelease;

import java.util.List;

/**
 * Created by TLv8 IDE on 2024/03/25.
 */
public interface OaNewsReleaseService {

	int deleteByPrimaryKey(String id);
	
	int insert(OaNewsRelease row);
	
	OaNewsRelease selectByPrimaryKey(String id);
	
	List<OaNewsRelease> selectAll();
	
	int updateByPrimaryKey(OaNewsRelease row);
}
