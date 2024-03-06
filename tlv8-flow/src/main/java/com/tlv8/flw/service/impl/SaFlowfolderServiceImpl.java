package com.tlv8.flw.service.impl;

import com.tlv8.flw.mapper.SaFlowfolderMapper;
import com.tlv8.flw.pojo.SaFlowfolder;
import com.tlv8.flw.service.SaFlowfolderService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by TLv8 IDE on 2023/04/11.
 */
@Service
public class SaFlowfolderServiceImpl implements SaFlowfolderService {
	@Autowired
	private SaFlowfolderMapper saFlowfolderMapper;

	public int deleteByPrimaryKey(String id) {
		return saFlowfolderMapper.deleteByPrimaryKey(id);
	}

	public int insert(SaFlowfolder row) {
		return saFlowfolderMapper.insert(row);
	}

	public SaFlowfolder selectByPrimaryKey(String id) {
		return saFlowfolderMapper.selectByPrimaryKey(id);
	}

	public List<SaFlowfolder> selectAll() {
		return saFlowfolderMapper.selectAll();
	}

	public int updateByPrimaryKey(SaFlowfolder row) {
		return saFlowfolderMapper.updateByPrimaryKey(row);
	}

	@Override
	public List<SaFlowfolder> selectByParent(String sparent) {
		return saFlowfolderMapper.selectByParent(sparent);
	}

}
