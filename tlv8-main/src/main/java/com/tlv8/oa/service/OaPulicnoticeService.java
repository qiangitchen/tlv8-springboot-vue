package com.tlv8.oa.service;

import com.tlv8.oa.pojo.OaPulicnotice;

import java.util.List;
import java.util.Map;

/**
 * Created by TLv8 IDE on 2024/03/20.
 */
public interface OaPulicnoticeService {

	int deleteByPrimaryKey(String id);
	
	int insert(OaPulicnotice row);
	
	OaPulicnotice selectByPrimaryKey(String id);
	
	List<OaPulicnotice> selectAll();
	
	int updateByPrimaryKey(OaPulicnotice row);
	
	Map<String,Object> selectPortalNotesCount(String fpersonid);
}
