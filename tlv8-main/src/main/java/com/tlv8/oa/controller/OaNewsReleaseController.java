package com.tlv8.oa.controller;

import com.tlv8.oa.service.OaNewsReleaseService;
import com.tlv8.system.utils.ContextUtils;
import com.alibaba.fastjson.JSONArray;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.domain.AjaxResult;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OaNewsReleaseController {
	@Autowired
	OaNewsReleaseService oaNewsReleaseService;

	@RequestMapping("/loadNewsAction")
	public Object loadNewsAction() {
		Data data = new Data();
		try {
			String userid = ContextUtils.getContext().getCurrentPersonID();
			SQL sql = new SQL();
			sql.SELECT_DISTINCT("n.FID, FNEWSTITLE FTITLE, FPEOPLE, FTIME FPEOPLEDATE");
			sql.FROM("oa_news_release n");
			sql.LEFT_OUTER_JOIN("oa_news_open o on o.fnewsid = n.fid");
			sql.WHERE("n.FSTATE='已发布'");
			sql.WHERE("(n.faccessories = '集体发布' or (n.faccessories = '限制发布' and o.fopenid = ?) )");
			List<Object> param = new ArrayList<Object>();
			param.add(userid);
			List<Map<String, String>> list = DBUtils.selectStringList("oa", sql.toString(), param, true);
			data.setData(JSONArray.toJSONString(list));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage("加载数据错误!");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

}
