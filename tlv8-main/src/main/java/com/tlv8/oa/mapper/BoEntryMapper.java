package com.tlv8.oa.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tlv8.oa.pojo.BoEntry;

@DS("oa")
@Mapper
public interface BoEntryMapper extends BaseMapper<BoEntry>{
    
}