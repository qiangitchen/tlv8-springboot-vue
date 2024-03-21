package com.tlv8.oa.service.impl;

import com.tlv8.oa.mapper.OaNewsCountMapper;
import com.tlv8.oa.pojo.OaNewsCount;
import com.tlv8.oa.service.OaNewsCountService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
/**
 * Created by TLv8 IDE on 2024/03/21.
 */
@Service
public class OaNewsCountServiceImpl implements OaNewsCountService {
    @Autowired
    private OaNewsCountMapper oaNewsCountMapper;
    
    public int deleteByPrimaryKey(String id){
    	return oaNewsCountMapper.deleteByPrimaryKey(id);
    }
	
	public int insert(OaNewsCount row){
		return oaNewsCountMapper.insert(row);
	}
	
	public OaNewsCount selectByPrimaryKey(String id){
		return oaNewsCountMapper.selectByPrimaryKey(id);
	}
	
	public List<OaNewsCount> selectAll(){
		return oaNewsCountMapper.selectAll();
	}
	
	public int updateByPrimaryKey(OaNewsCount row){
		return oaNewsCountMapper.updateByPrimaryKey(row);
	}

}
