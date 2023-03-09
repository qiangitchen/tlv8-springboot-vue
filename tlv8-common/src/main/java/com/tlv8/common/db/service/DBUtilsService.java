package com.tlv8.common.db.service;

import com.tlv8.common.db.mapper.UtilsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DBUtilsService {

    @Autowired
    UtilsMapper utilsMapper;

    /**
     * 通用SQL语句查询方法
     *
     * @param sql
     * @return List<Map < String, Object>>
     */
    public List<Map<String, Object>> selectSQL(String sql) {
        return utilsMapper.selectSQL(sql);
    }

    /**
     * 通用SQL语句插入方法
     *
     * @param sql
     * @return int
     */
    public int insertSQL(String sql) {
        return utilsMapper.insertSQL(sql);
    }

    /**
     * 通用SQL语句删除方法
     *
     * @param sql
     * @return int
     */
    public int deleteSQL(String sql) {
        return utilsMapper.deleteSQL(sql);
    }

    /**
     * 通用SQL语句更新方法
     *
     * @param sql
     * @return int
     */
    public int updateSQL(String sql) {
        return utilsMapper.updateSQL(sql);
    }

}
