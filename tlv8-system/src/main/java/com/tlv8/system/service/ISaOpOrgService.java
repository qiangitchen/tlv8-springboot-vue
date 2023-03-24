package com.tlv8.system.service;

import com.tlv8.system.pojo.SaOpOrg;

import java.util.List;

public interface ISaOpOrgService {

    /**
     * 查询所有数据
     *
     * @return
     */
    List<SaOpOrg> selectList();

    /**
     * 查询根数据（父节点为空）
     *
     * @return
     */
    List<SaOpOrg> selectRootList();

    /**
     * 根据父id获取数据列表
     * @param parent
     * @return
     */
    List<SaOpOrg> selectListByParentID(String parent);

    /**
     * 根据主键获取数据对象
     *
     * @param sid
     * @return
     */
    SaOpOrg selectByPrimaryKey(String sid);

    /**
     * 插入数据到数据库
     *
     * @param obj
     * @return
     */
    int insertData(SaOpOrg obj);

    /**
     * 更新数据
     *
     * @param obj
     * @return
     */
    int updateData(SaOpOrg obj);

    /**
     * 删除对象对应的数据
     *
     * @param obj
     * @return
     */
    int deleteData(SaOpOrg obj);

    /**
     * 删除指定主键的数据
     *
     * @param sid
     * @return
     */
    int deleteDataByPrimaryKey(String sid);

    /**
     * 逻辑删除指定主键的数据
     *
     * @param sid
     * @return
     */
    int logicDeleteDataByPrimaryKey(String sid);

    /**
     * 逻辑恢复指定主键的数据
     *
     * @param sid
     * @return
     */
    int logicRecoveryByPrimaryKey(String sid);

    List<SaOpOrg> selectRecycleList();

    List<SaOpOrg> selectAllByParentID(String parent);
}
