package com.tlv8.common.db.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.db.pojo.DataListParam;
import com.tlv8.common.db.pojo.DataParam;
import com.tlv8.common.db.pojo.SubData;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.helper.DataTypeHelper;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.StringArray;
import com.tlv8.common.utils.StringUtils;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

@Controller
@RequestMapping("/common")
public class DBUtilsController {

    @Autowired
    SqlSessionFactory sqlSessionFactory;


    /**
     * 通用数据保存方法
     *
     * @param param
     * @return
     */
    @RequestMapping("/saveData")
    @ResponseBody
    public Object saveData(@RequestBody DataParam param) {
        AjaxResult result = null;
        SqlSession sqlSession = sqlSessionFactory.openSession();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = sqlSession.getConnection();
            SQL query = new SQL().SELECT(param.getKeyField());
            query.FROM(param.getTableName());
            query.WHERE(param.getKeyField() + "=?");
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, param.getKeyValue());
            rs = ps.executeQuery();
            Map<String, String> data = param.getData();
            String key = data.get(param.getKeyField());
            List<String> keyList = new ArrayList<>();
            Map<String, String> vlm = new HashMap<String, String>();
            SQL update = new SQL();
            if (rs.next()) {
                update = new SQL().UPDATE(param.getTableName());
                for (String field : data.keySet()) {
                    if (!field.equalsIgnoreCase(param.getKeyField())) {
                        keyList.add(field);
                        String value = data.get(field);
                        update.SET(field + "=?");
                        vlm.put(field, value);
                    }
                }
                update.WHERE(param.getKeyField() + "=?");
                keyList.add(param.getKeyField());
                vlm.put(param.getKeyField(), param.getKeyValue());
            } else {
                update.INSERT_INTO(param.getTableName());
                for (String field : data.keySet()) {
                    if (!field.equalsIgnoreCase(param.getKeyField())) {
                        keyList.add(field);
                        update.INTO_COLUMNS(field);
                        String value = data.get(field);
                        update.INTO_VALUES("?");
                        vlm.put(field, value);
                    }
                }
                update.INTO_COLUMNS(param.getKeyField());
                key = IDUtils.getGUID();
                keyList.add(param.getKeyField());
                update.INTO_VALUES("?");
                vlm.put(param.getKeyField(), key);
            }
            PreparedStatement ps1 = conn.prepareStatement(update.toString());
            for (int i = 0; i < keyList.size(); i++) {
                String dataType = DataTypeHelper.getColumnDataType(conn, param.getTableName(), keyList.get(i));
                String addVal = vlm.get(keyList.get(i));
                if (("DATE".equals(dataType.toUpperCase()) || "DATETIME".equals(dataType.toUpperCase())
                        || "TIMESTAMP".equals(dataType.toUpperCase())) && !"".equals(addVal)) {
                    try {
                        DateFormat dataTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        Date vl1 = dataTimeFormat.parse(addVal);
                        ps1.setTimestamp(i + 1, new java.sql.Timestamp(vl1.getTime()));
                    } catch (Exception e) {
                        try {
                            DateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
                            Date vl2 = dataFormat.parse(addVal);
                            ps1.setDate(i + 1, new java.sql.Date(vl2.getTime()));
                        } catch (Exception e2) {
                            ps1.setNull(i + 1, Types.NULL);
                        }
                    }
                } else {
                    if (addVal != null && !"".equals(addVal.trim()) && !"null".equalsIgnoreCase(addVal)) {
                        if (dataType.contains("int")) {
                            ps1.setInt(i + 1, Integer.parseInt(addVal));
                        } else if (dataType.contains("float")) {
                            ps1.setFloat(i + 1, Float.parseFloat(addVal));
                        } else if (dataType.contains("numeric")) {
                            ps1.setDouble(i + 1, Double.valueOf(addVal));
                        } else if (dataType.contains("decimal")) {
                            ps1.setDouble(i + 1, Double.valueOf(addVal));
                        } else {
                            ps1.setString(i + 1, addVal);
                        }
                    } else {
                        ps1.setNull(i + 1, Types.NULL);
                    }
                }
            }
            ps1.executeUpdate();
            sqlSession.commit(true);
            result = AjaxResult.success("操作成功", key);
        } catch (Exception e) {
            sqlSession.rollback(true);
            e.printStackTrace();
            result = AjaxResult.error(e.getMessage());
        } finally {
            DBUtils.closeConn(sqlSession, conn, ps, rs);
        }
        return result;
    }

    /**
     * 通用数据删除方法
     *
     * @param param
     * @return
     */
    @RequestMapping("/removeData")
    @ResponseBody
    public Object removeData(@RequestBody DataParam param) {
        AjaxResult result = null;
        SqlSession sqlSession = sqlSessionFactory.openSession();
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = sqlSession.getConnection();
            List<SubData> subDataList = param.getSubDataList();
            for (SubData sdata : subDataList) {
                SQL dels = new SQL().DELETE_FROM(sdata.getTableName());
                dels.WHERE(sdata.getSubField() + "=?");
                ps = conn.prepareStatement(dels.toString());
                ps.setString(1, param.getKeyValue());
                ps.executeUpdate();
            }
            SQL del = new SQL().DELETE_FROM(param.getTableName());
            del.WHERE(param.getKeyField() + "=?");
            ps = conn.prepareStatement(del.toString());
            ps.setString(1, param.getKeyValue());
            ps.executeUpdate();
            sqlSession.commit(true);
            result = AjaxResult.success("操作成功");
        } catch (Exception e) {
            sqlSession.rollback(true);
            e.printStackTrace();
            result = AjaxResult.error(e.getMessage());
        } finally {
            DBUtils.closeConn(sqlSession, conn, ps, null);
        }
        return result;
    }

    /**
     * 通用数据查询方法
     *
     * @param param
     * @return
     */
    @RequestMapping("/queryData")
    @ResponseBody
    public Object queryData(@RequestBody DataParam param) {
        AjaxResult result = null;
        SqlSession sqlSession = sqlSessionFactory.openSession();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = sqlSession.getConnection();
            SQL sql = new SQL();
            Map<String, String> data = param.getData();
            for (String field : data.keySet()) {
                sql.SELECT(field);
            }
            sql.FROM(param.getTableName());
            sql.WHERE(param.getKeyField() + "=?");
            ps = conn.prepareStatement(sql.toString());
            ps.setString(1, param.getKeyValue());
            rs = ps.executeQuery();
            if (rs.next()) {
                JSONObject json = new JSONObject();
                ResultSetMetaData rsd = rs.getMetaData();
                for (int i = 0; i < rsd.getColumnCount(); i++) {
                    String column = rsd.getColumnLabel(i + 1);
                    json.put(column, rs.getString(column));
                }
                json.put("key", rs.getString(param.getKeyField()));
                json.put("id", rs.getString(param.getKeyField()));
                result = AjaxResult.success(json);
            } else {
                result = AjaxResult.success("没有查询到指定的数据");
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = AjaxResult.error(e.getMessage());
        } finally {
            DBUtils.closeConn(sqlSession, conn, ps, rs);
        }
        return result;
    }

    /**
     * 通用数据列表方法
     *
     * @param param
     * @return
     */
    @RequestMapping("/queryDataList")
    @ResponseBody
    public Object queryDataList(@RequestBody DataListParam param) {
        AjaxResult result = null;
        SqlSession sqlSession = sqlSessionFactory.openSession();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = sqlSession.getConnection();
            SQL sql = new SQL().SELECT("*");
            sql.FROM(param.getTableName());
            String searchValue = param.getSearchValue();
            List<String> queryParam = new ArrayList<>();
            if (StringUtils.isNotEmpty(searchValue)) {
                List<String> columns = param.getColumns();
                StringArray qa = new StringArray();
                for (String field : columns) {
                    System.out.println(field);
                    qa.push(field + " like ?");
                    queryParam.add("%" + searchValue + "%");
                }
                sql.WHERE(qa.join(" or "));
            }
            System.out.println(sql);
            PreparedStatement ps1 = conn.prepareStatement("select count(*) as total from(" + sql.toString() + ")a");
            for (int i = 0; i < queryParam.size(); i++) {
                ps1.setString(i + 1, queryParam.get(i));
            }
            long total = 0;
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                total = rs1.getLong(1);
            }
            if (StringUtils.isNotEmpty(param.getDataOrder())) {
                sql.ORDER_BY(param.getDataOrder());
            }
            ps = conn.prepareStatement(sql.toString());
            for (int i = 0; i < queryParam.size(); i++) {
                ps.setString(i + 1, queryParam.get(i));
            }
            rs = ps.executeQuery();
            Map<String, Object> data = new HashMap<>();
            JSONArray jsona = new JSONArray();
            while (rs.next()) {
                JSONObject json = new JSONObject();
                json.put(param.getKeyField(), rs.getString(param.getKeyField()));
                ResultSetMetaData rsd = rs.getMetaData();
                for (int i = 0; i < rsd.getColumnCount(); i++) {
                    String column = rsd.getColumnLabel(i + 1);
                    json.put(column, rs.getString(column));
                }
                json.put("key", rs.getString(param.getKeyField()));
                json.put("id", rs.getString(param.getKeyField()));
                jsona.add(json);
            }
            data.put("total", total);
            data.put("data", jsona);
            result = AjaxResult.success(data);
        } catch (Exception e) {
            e.printStackTrace();
            result = AjaxResult.error(e.getMessage());
        } finally {
            DBUtils.closeConn(sqlSession, conn, ps, rs);
        }
        return result;
    }


}
