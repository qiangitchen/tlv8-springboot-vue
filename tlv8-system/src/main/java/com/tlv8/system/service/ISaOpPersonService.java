package com.tlv8.system.service;

import com.tlv8.system.pojo.SaOpPerson;

public interface ISaOpPersonService {
    /**
     * 根据主键获取数据对象
     *
     * @param sid
     * @return
     */
    SaOpPerson selectByPrimaryKey(String sid);

    SaOpPerson selectByCode(String scode);

    /**
     * 插入数据到数据库
     *
     * @param obj
     * @return
     */
    int insertData(SaOpPerson obj);

    /**
     * 更新数据
     *
     * @param obj
     * @return
     */
    int updateData(SaOpPerson obj);

    /**
     * 删除对象对应的数据
     *
     * @param obj
     * @return
     */
    int deleteData(SaOpPerson obj);

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
}
