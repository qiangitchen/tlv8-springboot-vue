package com.tlv8.system.mapper;

import com.tlv8.system.pojo.SaMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SaMenuMapper {
    List<SaMenu> selectList();

    /**
     * 根据主键获取数据对象
     *
     * @param sid
     * @return
     */
    SaMenu selectByPrimaryKey(String sid);

    /**
     * 插入数据到数据库
     *
     * @param obj
     * @return
     */
    int insertData(SaMenu obj);

    /**
     * 更新数据
     *
     * @param obj
     * @return
     */
    int updateData(SaMenu obj);

    /**
     * 删除对象对应的数据
     *
     * @param obj
     * @return
     */
    int deleteData(SaMenu obj);

    /**
     * 删除指定主键的数据
     *
     * @param sid
     * @return
     */
    int deleteDataByPrimaryKey(String sid);
}
