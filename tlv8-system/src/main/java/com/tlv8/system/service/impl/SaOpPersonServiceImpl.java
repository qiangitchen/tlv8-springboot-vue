package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.dao.SaOpPersonDao;
import com.tlv8.system.pojo.SaOpPerson;
import com.tlv8.system.service.ISaOpPersonService;

@Service
public class SaOpPersonServiceImpl implements ISaOpPersonService {

	@Autowired
	SaOpPersonDao saoppersondao;

	@Override
	public SaOpPerson selectByPrimaryKey(String sid) {
		return saoppersondao.selectByPrimaryKey(sid);
	}

	@Override
	public int insertData(SaOpPerson obj) {
		return saoppersondao.insertData(obj);
	}

	@Override
	public int updateData(SaOpPerson obj) {
		return saoppersondao.updateData(obj);
	}

	@Override
	public int deleteData(SaOpPerson obj) {
		return saoppersondao.deleteData(obj);
	}

	@Override
	public int deleteDataByPrimaryKey(String sid) {
		return saoppersondao.deleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicDeleteDataByPrimaryKey(String sid) {
		return saoppersondao.logicDeleteDataByPrimaryKey(sid);
	}

	@Override
	public int logicRecoveryByPrimaryKey(String sid) {
		return saoppersondao.logicRecoveryByPrimaryKey(sid);
	}

}
