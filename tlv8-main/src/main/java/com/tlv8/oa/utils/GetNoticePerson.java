package com.tlv8.oa.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.domain.AjaxResult;

@RestController
public class GetNoticePerson {

	@RequestMapping("/getNoticePersonAction")
	public Object execute(String fid) throws Exception {
		Data data = new Data();
		try {
			SQL sql = new SQL();
			sql.SELECT("*");
			sql.FROM("OA_NOTICE_PERSON");
			sql.WHERE("FMAINID=?");
			List<Object> param = new ArrayList<>();
			param.add(fid);
			List<Map<String, String>> list = DBUtils.selectStringList("oa", sql.toString(), param, true);
			data.setData(JSONArray.toJSONString(list));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

}
