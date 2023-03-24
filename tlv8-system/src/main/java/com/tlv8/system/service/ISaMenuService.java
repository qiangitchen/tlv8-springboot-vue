package com.tlv8.system.service;

import com.tlv8.system.pojo.SaMenu;

import java.util.List;

public interface ISaMenuService {

    List<SaMenu> selectList(String sorgid, String sorgfid);
}
