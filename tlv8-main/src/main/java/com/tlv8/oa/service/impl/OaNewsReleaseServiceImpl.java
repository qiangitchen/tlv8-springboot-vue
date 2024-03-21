package com.tlv8.oa.service.impl;

import com.tlv8.oa.mapper.OaNewsReleaseMapper;
import com.tlv8.oa.pojo.OaNewsRelease;
import com.tlv8.oa.service.OaNewsReleaseService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
/**
 * Created by TLv8 IDE on 2024/03/21.
 */
@Service
public class OaNewsReleaseServiceImpl implements OaNewsReleaseService {
    @Autowired
    private OaNewsReleaseMapper oaNewsReleaseMapper;
    
    public int deleteByPrimaryKey(String id){
    	return oaNewsReleaseMapper.deleteByPrimaryKey(id);
    }
	
	public int insert(OaNewsRelease row){
		return oaNewsReleaseMapper.insert(row);
	}
	
	public OaNewsRelease selectByPrimaryKey(String id){
		return oaNewsReleaseMapper.selectByPrimaryKey(id);
	}
	
	public List<OaNewsRelease> selectAll(){
		return oaNewsReleaseMapper.selectAll();
	}
	
	public int updateByPrimaryKey(OaNewsRelease row){
		return oaNewsReleaseMapper.updateByPrimaryKey(row);
	}

}
