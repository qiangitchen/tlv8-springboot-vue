package com.tlv8.flw.mapper;

import com.tlv8.flw.pojo.SaFlowfolder;
import java.util.List;

public interface SaFlowfolderMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sa_flowfolder
     *
     * @mbg.generated Tue Apr 11 10:30:26 CST 2023
     */
    int deleteByPrimaryKey(String sid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sa_flowfolder
     *
     * @mbg.generated Tue Apr 11 10:30:26 CST 2023
     */
    int insert(SaFlowfolder row);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sa_flowfolder
     *
     * @mbg.generated Tue Apr 11 10:30:26 CST 2023
     */
    SaFlowfolder selectByPrimaryKey(String sid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sa_flowfolder
     *
     * @mbg.generated Tue Apr 11 10:30:26 CST 2023
     */
    List<SaFlowfolder> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sa_flowfolder
     *
     * @mbg.generated Tue Apr 11 10:30:26 CST 2023
     */
    int updateByPrimaryKey(SaFlowfolder row);
}