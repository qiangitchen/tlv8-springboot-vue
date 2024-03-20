package com.tlv8.flw.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;

@RestController
public class WaitTaskController {

	@RequestMapping("/getWaitTaskCount")
	public Object getCompleteTaskCount(HttpServletRequest requst) {
		Data data = new Data();
		data.setData("0");
		ContextBean user = ContextUtils.getContext();
		String userid = user.getCurrentPersonID();
		List<Object> param = new ArrayList<Object>();
		param.add(userid);
		try {
			SQL sql = new SQL().SELECT("count(*) CUN").FROM("sa_task");
			sql.WHERE("SEPERSONID=? and SSTATUSID != 'tesExecuting' and SEURL !='null'");
			sql.WHERE(" SSTATUSID='tesReady' ");
			List<Map<String, String>> list = DBUtils.selectStringList("system", sql.toString(), param, true);
			if (list.size() > 0) {
				data.setData(list.get(0).get("CUN"));
			}
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			e.printStackTrace();
		}
		return data;
	}

}
