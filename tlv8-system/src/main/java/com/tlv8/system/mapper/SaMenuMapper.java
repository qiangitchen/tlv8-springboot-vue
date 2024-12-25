package com.tlv8.system.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.tlv8.system.pojo.SaMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@DS("system")
@Mapper
public interface SaMenuMapper {
    List<SaMenu> selectList(Map<String, String> param);
}
