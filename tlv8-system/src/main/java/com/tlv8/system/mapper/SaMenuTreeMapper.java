package com.tlv8.system.mapper;

import com.tlv8.system.pojo.SaMenuTree;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SaMenuTreeMapper {
    List<SaMenuTree> selectList();

    /**
     * 根据主键获取数据对象
     *
     * @param sid
     * @return
     */
    SaMenuTree selectByPrimaryKey(String sid);

    /**
     * 根据pid获取数据
     *
     * @param pid
     * @return
     */
    List<SaMenuTree> selectByPID(String pid);

    /**
     * 插入数据到数据库
     *
     * @param obj
     * @return
     */
    int insertData(SaMenuTree obj);

    /**
     * 更新数据
     *
     * @param obj
     * @return
     */
    int updateData(SaMenuTree obj);

    /**
     * 删除对象对应的数据
     *
     * @param obj
     * @return
     */
    int deleteData(SaMenuTree obj);

    /**
     * 删除指定主键的数据
     *
     * @param sid
     * @return
     */
    int deleteDataByPrimaryKey(String sid);
}