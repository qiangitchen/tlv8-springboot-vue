package com.tlv8.common.db.controller;

import com.tlv8.common.db.pojo.DataParam;
import com.tlv8.common.db.pojo.SubData;
import com.tlv8.common.db.service.DBUtilsService;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.IDUtils;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/common")
public class DBUtilsController {

    @Autowired
    DBUtilsService dbUtilsService;

    @RequestMapping("/saveData")
    @ResponseBody
    public Object saveData(@RequestBody DataParam param) {
        try {
            SQL query = new SQL().SELECT(param.getKeyField());
            query.FROM(param.getTableName());
            query.WHERE(param.getKeyField() + "='" + param.getKeyValue() + "'");
            List<Map<String, Object>> list = dbUtilsService.selectSQL(query.toString());
            Map<String, String> data = param.getData();
            String key = data.get(param.getKeyField());
            if (list.size() > 0) {
                SQL update = new SQL().UPDATE(param.getTableName());
                for (String field : data.keySet()) {
                    String value = data.get(field);
                    if ("null".equalsIgnoreCase(value)) {
                        value = "";
                    }
                    update.SET(field + "='" + value + "'");
                }
                update.WHERE(param.getKeyField() + "='" + param.getKeyValue() + "'");
                dbUtilsService.updateSQL(update.toString());
            } else {
                SQL insert = new SQL().INSERT_INTO(param.getTableName());
                insert.INTO_COLUMNS(param.getKeyField());
                key = IDUtils.getGUID();
                insert.INTO_VALUES("'" + key + "'");
                for (String field : data.keySet()) {
                    if (!field.equalsIgnoreCase(param.getKeyField())) {
                        insert.INTO_COLUMNS(field);
                        String value = data.get(field);
                        if ("null".equalsIgnoreCase(value)) {
                            value = "";
                        }
                        insert.INTO_VALUES("'" + value + "'");
                    }
                }
                dbUtilsService.insertSQL(insert.toString());
            }
            return AjaxResult.success("操作成功", key);
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    @RequestMapping("/removeData")
    @ResponseBody
    public Object removeData(@RequestBody DataParam param) {
        try {
            List<SubData> subDataList = param.getSubDataList();
            for (SubData sdata : subDataList) {
                SQL dels = new SQL().DELETE_FROM(sdata.getTableName());
                dels.WHERE(sdata.getSubField() + "='" + param.getKeyValue() + "'");
                dbUtilsService.deleteSQL(dels.toString());
            }
            SQL del = new SQL().DELETE_FROM(param.getTableName());
            del.WHERE(param.getKeyField() + "='" + param.getKeyValue() + "'");
            dbUtilsService.deleteSQL(del.toString());
            return AjaxResult.success("操作成功");
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }


}
