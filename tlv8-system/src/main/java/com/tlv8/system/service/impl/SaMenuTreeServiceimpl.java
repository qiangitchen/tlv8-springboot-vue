package com.tlv8.system.service.impl;

import com.tlv8.system.mapper.SaMenuTreeMapper;
import com.tlv8.system.pojo.SaMenuTree;
import com.tlv8.system.service.ISaMenuTreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaMenuTreeServiceimpl implements ISaMenuTreeService {

    @Autowired
    private SaMenuTreeMapper saMenuTreeMapper;

    @Override
    public List<SaMenuTree> selectList() {
        return saMenuTreeMapper.selectList();
    }

    @Override
    public SaMenuTree selectByPrimaryKey(String sid) {
        return saMenuTreeMapper.selectByPrimaryKey(sid);
    }

    @Override
    public List<SaMenuTree> selectByPID(String pid) {
        return saMenuTreeMapper.selectByPID(pid);
    }

    @Override
    public int insertData(SaMenuTree obj) {
        return saMenuTreeMapper.insertData(obj);
    }

    @Override
    public int updateData(SaMenuTree obj) {
        return saMenuTreeMapper.updateData(obj);
    }

    @Override
    public int deleteData(SaMenuTree obj) {
        return saMenuTreeMapper.deleteData(obj);
    }

    @Override
    public int deleteDataByPrimaryKey(String sid) {
        return saMenuTreeMapper.deleteDataByPrimaryKey(sid);
    }
}
