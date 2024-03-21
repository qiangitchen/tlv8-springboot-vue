package com.tlv8.oa.service.impl;

import com.tlv8.oa.mapper.OaNewsOpenMapper;
import com.tlv8.oa.pojo.OaNewsOpen;
import com.tlv8.oa.service.OaNewsOpenService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
/**
 * Created by TLv8 IDE on 2024/03/21.
 */
@Service
public class OaNewsOpenServiceImpl implements OaNewsOpenService {
    @Autowired
    private OaNewsOpenMapper oaNewsOpenMapper;
    
    public int deleteByPrimaryKey(String id){
    	return oaNewsOpenMapper.deleteByPrimaryKey(id);
    }
	
	public int insert(OaNewsOpen row){
		return oaNewsOpenMapper.insert(row);
	}
	
	public OaNewsOpen selectByPrimaryKey(String id){
		return oaNewsOpenMapper.selectByPrimaryKey(id);
	}
	
	public List<OaNewsOpen> selectAll(){
		return oaNewsOpenMapper.selectAll();
	}
	
	public int updateByPrimaryKey(OaNewsOpen row){
		return oaNewsOpenMapper.updateByPrimaryKey(row);
	}

}
