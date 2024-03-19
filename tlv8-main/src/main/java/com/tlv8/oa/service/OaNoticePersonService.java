package com.tlv8.oa.service;

import com.tlv8.oa.pojo.OaNoticePerson;

import java.util.List;

/**
 * Created by TLv8 IDE on 2024/03/19.
 */
public interface OaNoticePersonService {

	int deleteByPrimaryKey(String id);
	
	int insert(OaNoticePerson row);
	
	OaNoticePerson selectByPrimaryKey(String id);
	
	List<OaNoticePerson> selectAll();
	
	int updateByPrimaryKey(OaNoticePerson row);
	
	List<OaNoticePerson> selectByMainid(String fmainid);
	
	List<OaNoticePerson> selectByMainidPersonID(String fmainid,String fpersonid);
}
