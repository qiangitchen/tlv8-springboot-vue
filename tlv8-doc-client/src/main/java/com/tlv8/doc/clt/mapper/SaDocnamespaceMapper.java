package com.tlv8.doc.clt.mapper;

import com.tlv8.doc.clt.pojo.SaDocnamespace;
import java.util.List;

public interface SaDocnamespaceMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sa_docnamespace
     *
     * @mbg.generated Wed Apr 19 17:51:21 CST 2023
     */
    int deleteByPrimaryKey(String sid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sa_docnamespace
     *
     * @mbg.generated Wed Apr 19 17:51:21 CST 2023
     */
    int insert(SaDocnamespace row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sa_docnamespace
     *
     * @mbg.generated Wed Apr 19 17:51:21 CST 2023
     */
    SaDocnamespace selectByPrimaryKey(String sid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sa_docnamespace
     *
     * @mbg.generated Wed Apr 19 17:51:21 CST 2023
     */
    List<SaDocnamespace> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sa_docnamespace
     *
     * @mbg.generated Wed Apr 19 17:51:21 CST 2023
     */
    int updateByPrimaryKey(SaDocnamespace row);
}