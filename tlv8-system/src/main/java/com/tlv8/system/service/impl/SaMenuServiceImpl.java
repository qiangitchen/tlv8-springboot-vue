package com.tlv8.system.service.impl;

import com.tlv8.system.mapper.SaMenuMapper;
import com.tlv8.system.pojo.SaMenu;
import com.tlv8.system.service.ISaMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaMenuServiceImpl implements ISaMenuService {
    @Autowired
    SaMenuMapper saMenuMapper;

    @Override
    public List<SaMenu> selectList() {
        return saMenuMapper.selectList();
    }


    @Override
    public SaMenu selectByPrimaryKey(String sid) {
        return saMenuMapper.selectByPrimaryKey(sid);
    }

    @Override
    public int insertData(SaMenu obj) {
        return saMenuMapper.insertData(obj);
    }

    @Override
    public int updateData(SaMenu obj) {
        return saMenuMapper.updateData(obj);
    }

    @Override
    public int deleteData(SaMenu obj) {
        return saMenuMapper.deleteData(obj);
    }

    @Override
    public int deleteDataByPrimaryKey(String sid) {
        return saMenuMapper.deleteDataByPrimaryKey(sid);
    }

}
