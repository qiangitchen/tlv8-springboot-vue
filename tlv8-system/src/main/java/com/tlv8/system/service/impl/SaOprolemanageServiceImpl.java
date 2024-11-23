package com.tlv8.system.service.impl;

import com.tlv8.system.mapper.SaOprolemanageMapper;
import com.tlv8.system.pojo.SaOprolemanage;
import com.tlv8.system.service.SaOprolemanageService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
/**
 * Created by TLv8 IDE on 2024/11/23.
 */
@Service
public class SaOprolemanageServiceImpl implements SaOprolemanageService {
    @Autowired
    private SaOprolemanageMapper saOprolemanageMapper;
    
    public int deleteByPrimaryKey(String id){
    	return saOprolemanageMapper.deleteByPrimaryKey(id);
    }
	
	public int insert(SaOprolemanage row){
		return saOprolemanageMapper.insert(row);
	}
	
	public SaOprolemanage selectByPrimaryKey(String id){
		return saOprolemanageMapper.selectByPrimaryKey(id);
	}
	
	public List<SaOprolemanage> selectAll(){
		return saOprolemanageMapper.selectAll();
	}
	
	public int updateByPrimaryKey(SaOprolemanage row){
		return saOprolemanageMapper.updateByPrimaryKey(row);
	}

}
