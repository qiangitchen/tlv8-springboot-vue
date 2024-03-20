package com.tlv8.oa.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.oa.service.OaPulicnoticeService;
import com.tlv8.system.utils.ContextUtils;

/**
 * Created by TLv8 IDE on 2024/03/20.
 */
@RestController
public class OaPulicnoticeController {
	@Autowired
	private OaPulicnoticeService oaPulicnoticeService;

	@RequestMapping("/getPortalNotesCount")
	public Object getPortalNotesCount() {
		Data data = new Data();
		try {
			String userid = ContextUtils.getContext().getCurrentPersonID();
			Map<String, Object> res = oaPulicnoticeService.selectPortalNotesCount(userid);
			data.setData(String.valueOf(res.get("cun")));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage("加载数据错误!");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	@RequestMapping("/getPortalNotesAction")
	public Object getPortalNotesAction() {
		Data data = new Data();
		try {
			String userid = ContextUtils.getContext().getCurrentPersonID();
			SQL sql = new SQL();
			sql.SELECT_DISTINCT("n.FID,n.FTITLE,n.FPUSHDATETIME");
			sql.FROM("oa_pulicnotice n");
			sql.LEFT_OUTER_JOIN("oa_notice_person p on p.fmainid = n.fid");
			sql.WHERE("n.fpushdatetime is not null");
			sql.WHERE("(n.ftype = '集体发布' or (n.ftype = '限制发布' and p.fpersonid = ?) )");
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
