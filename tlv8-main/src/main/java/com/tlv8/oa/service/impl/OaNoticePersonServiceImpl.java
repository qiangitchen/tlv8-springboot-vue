package com.tlv8.oa.service.impl;

import com.tlv8.oa.mapper.OaNoticePersonMapper;
import com.tlv8.oa.pojo.OaNoticePerson;
import com.tlv8.oa.service.OaNoticePersonService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * Created by TLv8 IDE on 2024/03/19.
 */
@Service
public class OaNoticePersonServiceImpl implements OaNoticePersonService {
    @Autowired
    private OaNoticePersonMapper oaNoticePersonMapper;
    
    public int deleteByPrimaryKey(String id){
    	return oaNoticePersonMapper.deleteByPrimaryKey(id);
    }
	
	public int insert(OaNoticePerson row){
		return oaNoticePersonMapper.insert(row);
	}
	
	public OaNoticePerson selectByPrimaryKey(String id){
		return oaNoticePersonMapper.selectByPrimaryKey(id);
	}
	
	public List<OaNoticePerson> selectAll(){
		return oaNoticePersonMapper.selectAll();
	}
	
	public int updateByPrimaryKey(OaNoticePerson row){
		return oaNoticePersonMapper.updateByPrimaryKey(row);
	}

	@Override
	public List<OaNoticePerson> selectByMainid(String fmainid) {
		return oaNoticePersonMapper.selectByMainid(fmainid);
	}

	@Override
	public List<OaNoticePerson> selectByMainidPersonID(String fmainid, String fpersonid) {
		Map<String, String> param = new HashMap<>();
		param.put("fmainid", fpersonid);
		param.put("fpersonid", fpersonid);
		return oaNoticePersonMapper.selectByMainidPersonID(param);
	}

}
