package com.tlv8.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.system.mapper.SaOpPersonMapper;
import com.tlv8.system.pojo.SaOpPerson;
import com.tlv8.system.service.ISaOpPersonService;

@Service
public class SaOpPersonServiceImpl implements ISaOpPersonService {

    @Autowired
    SaOpPersonMapper saOpPersonMapper;

    @Override
    public SaOpPerson selectByPrimaryKey(String sid) {
        return saOpPersonMapper.selectByPrimaryKey(sid);
    }

    public SaOpPerson selectByCode(String scode) {
        return saOpPersonMapper.selectByCode(scode);
    }

    @Override
    public int insertData(SaOpPerson obj) {
        return saOpPersonMapper.insertData(obj);
    }

    @Override
    public int updateData(SaOpPerson obj) {
        return saOpPersonMapper.updateData(obj);
    }

    @Override
    public int deleteData(SaOpPerson obj) {
        return saOpPersonMapper.deleteData(obj);
    }

    @Override
    public int deleteDataByPrimaryKey(String sid) {
        return saOpPersonMapper.deleteDataByPrimaryKey(sid);
    }

    @Override
    public int logicDeleteDataByPrimaryKey(String sid) {
        return saOpPersonMapper.logicDeleteDataByPrimaryKey(sid);
    }

    @Override
    public int logicRecoveryByPrimaryKey(String sid) {
        return saOpPersonMapper.logicRecoveryByPrimaryKey(sid);
    }

}
