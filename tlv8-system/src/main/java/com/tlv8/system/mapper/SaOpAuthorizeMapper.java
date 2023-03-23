package com.tlv8.system.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.tlv8.system.pojo.SaOpAuthorize;

import java.util.List;
import java.util.Map;

@Mapper
public interface SaOpAuthorizeMapper {
    /**
     * 根据主键获取数据对象
     *
     * @param sid
     * @return
     */
    SaOpAuthorize selectByPrimaryKey(String sid);


    /**
     * 根据组织id获取授权列表
     *
     * @param sorgid
     * @return
     */
    List<SaOpAuthorize> selectByOrgID(String sorgid);

    /**
     * 根据组织id和角色id获取授权信息
     *
     * @param param
     * @return
     */
    SaOpAuthorize selectByOrgRole(Map<String, String> param);

    /**
     * 插入数据到数据库
     *
     * @param obj
     * @return
     */
    int insertData(SaOpAuthorize obj);

    /**
     * 更新数据
     *
     * @param obj
     * @return
     */
    int updateData(SaOpAuthorize obj);

    /**
     * 删除对象对应的数据
     *
     * @param obj
     * @return
     */
    int deleteData(SaOpAuthorize obj);

    /**
     * 删除指定主键的数据
     *
     * @param sid
     * @return
     */
    int deleteDataByPrimaryKey(String sid);

}
