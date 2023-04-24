package com.tlv8.doc.clt.service.impl;

import com.tlv8.doc.clt.mapper.SaDocnamespaceMapper;
import com.tlv8.doc.clt.pojo.SaDocnamespace;
import com.tlv8.doc.clt.service.SaDocnamespaceService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
/**
 * Created by TLv8 IDE on 2023/04/19.
 */
@Service
public class SaDocnamespaceServiceImpl implements SaDocnamespaceService {
    @Autowired
    private SaDocnamespaceMapper saDocnamespaceMapper;
    
    public int deleteByPrimaryKey(String id){
    	return saDocnamespaceMapper.deleteByPrimaryKey(id);
    }
	
	public int insert(SaDocnamespace row){
		return saDocnamespaceMapper.insert(row);
	}
	
	public SaDocnamespace selectByPrimaryKey(String id){
		return saDocnamespaceMapper.selectByPrimaryKey(id);
	}
	
	public List<SaDocnamespace> selectAll(){
		return saDocnamespaceMapper.selectAll();
	}
	
	public int updateByPrimaryKey(SaDocnamespace row){
		return saDocnamespaceMapper.updateByPrimaryKey(row);
	}

}
