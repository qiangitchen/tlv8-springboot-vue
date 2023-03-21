package com.tlv8.system.service.impl;

import com.tlv8.system.mapper.SaOpPermissionMapper;
import com.tlv8.system.pojo.SaOpPermission;
import com.tlv8.system.service.SaOpPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SaOpPermissionServiceImpl implements SaOpPermissionService {

    @Autowired
    SaOpPermissionMapper saOpPermissionMapper;

    @Override
    public SaOpPermission selectByPrimaryKey(String sid) {
        return saOpPermissionMapper.selectByPrimaryKey(sid);
    }

    public SaOpPermission selectByRoleMenu(String spermissionroleid, String smenuid) {
        Map<String, String> param = new HashMap<>();
        param.put("spermissionroleid", spermissionroleid);
        param.put("smenuid", smenuid);
        return saOpPermissionMapper.selectByRoleMenu(param);
    }

    @Override
    public List<SaOpPermission> selectByRoleID(String spermissionroleid) {
        return saOpPermissionMapper.selectByRoleID(spermissionroleid);
    }

    @Override
    public int insertData(SaOpPermission obj) {
        return saOpPermissionMapper.insertData(obj);
    }

    @Override
    public int updateData(SaOpPermission obj) {
        return saOpPermissionMapper.updateData(obj);
    }

    @Override
    public int deleteData(SaOpPermission obj) {
        return saOpPermissionMapper.deleteData(obj);
    }

    @Override
    public int deleteDataByPrimaryKey(String sid) {
        return saOpPermissionMapper.deleteDataByPrimaryKey(sid);
    }

    @Override
    public int logicDeleteDataByPrimaryKey(String sid) {
        return saOpPermissionMapper.logicDeleteDataByPrimaryKey(sid);
    }

    @Override
    public int logicRecoveryByPrimaryKey(String sid) {
        return saOpPermissionMapper.logicRecoveryByPrimaryKey(sid);
    }
}
