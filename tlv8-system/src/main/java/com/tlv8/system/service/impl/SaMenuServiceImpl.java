package com.tlv8.system.service.impl;

import com.tlv8.system.mapper.SaMenuMapper;
import com.tlv8.system.pojo.SaMenu;
import com.tlv8.system.service.ISaMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SaMenuServiceImpl implements ISaMenuService {
    @Autowired
    SaMenuMapper saMenuMapper;

    @Override
    public List<SaMenu> selectList(String sorgid, String sorgfid) {
        Map<String, String> param = new HashMap<>();
        param.put("sorgid", sorgid);
        param.put("sorgfid", sorgfid);
        return saMenuMapper.selectList(param);
    }
}
