package com.tlv8.oa.service.impl;

import com.tlv8.oa.mapper.OaNewsColumnMapper;
import com.tlv8.oa.pojo.OaNewsColumn;
import com.tlv8.oa.service.OaNewsColumnService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
/**
 * Created by TLv8 IDE on 2024/03/21.
 */
@Service
public class OaNewsColumnServiceImpl implements OaNewsColumnService {
    @Autowired
    private OaNewsColumnMapper oaNewsColumnMapper;
    
    public int deleteByPrimaryKey(String id){
    	return oaNewsColumnMapper.deleteByPrimaryKey(id);
    }
	
	public int insert(OaNewsColumn row){
		return oaNewsColumnMapper.insert(row);
	}
	
	public OaNewsColumn selectByPrimaryKey(String id){
		return oaNewsColumnMapper.selectByPrimaryKey(id);
	}
	
	public List<OaNewsColumn> selectAll(){
		return oaNewsColumnMapper.selectAll();
	}
	
	public int updateByPrimaryKey(OaNewsColumn row){
		return oaNewsColumnMapper.updateByPrimaryKey(row);
	}

}
