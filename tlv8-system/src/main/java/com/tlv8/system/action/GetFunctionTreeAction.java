package com.tlv8.system.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.system.pojo.SaMenuTree;
import com.tlv8.system.service.ISaMenuTreeService;

/**
 * 获取功能树（不带权限控制，用于流程图设设计）
 * 
 * @author chenqian
 */
@Controller
@Scope("prototype")
public class GetFunctionTreeAction extends ActionSupport {
	private Data data = new Data();

	@Autowired
	ISaMenuTreeService menuTrssService;

	public void setData(Data data) {
		this.data = data;
	}

	public Data getData() {
		return data;
	}

	@ResponseBody
	@RequestMapping(value = "/getFunctionTreeAction", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public Object execute() throws Exception {
		data = new Data();
		String r = "true";
		String m = "success";
		String f = "";
		try {
			f = "true";
			List<SaMenuTree> menus = menuTrssService.selectList();
			List<Map<String, Object>> rl = new ArrayList<>();
			for (SaMenuTree fun : menus) {
				Map<String, Object> map = new HashMap<>();
				map.put("id", fun.getSid());
				map.put("name", fun.getLabel());
				map.put("pid", fun.getPid());
				map.put("surl", fun.getUrl());
				map.put("process", fun.getProcess());
				map.put("activity", fun.getActivity());
				rl.add(map);
			}
			r = JSON.toJSONString(rl);
		} catch (Exception e) {
			m = "操作失败：" + e.toString();
			f = "false";
			e.printStackTrace();
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		return success(data);
	}
}
