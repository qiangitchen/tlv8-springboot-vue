package com.tlv8.opm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.system.pojo.SaMenuTree;
import com.tlv8.system.service.ISaMenuTreeService;

@Controller
public class GetFunTableListAction {
	@Autowired
	ISaMenuTreeService saMenuTreeService;

	@RequestMapping("/getFunTableListAction")
	@ResponseBody
	public Object loadData() {
		Map<String, Object> map = new HashMap<>();
		map.put("data", getTableList());
		map.put("flag", true);
		return map;
	}

	List<Map<String, Object>> getTableList() {
		List<Map<String, Object>> rl = new ArrayList<>();
		List<SaMenuTree> roots = saMenuTreeService.selectRootList();
		for (SaMenuTree fun : roots) {
			Map<String, Object> m = new HashMap<>();
			m.put("id", fun.getSid());
			m.put("text", fun.getLabel());
			m.put("name", fun.getLabel());
			m.put("pid", fun.getPid());
			m.put("label", fun.getLabel());
			m.put("surl", fun.getUrl());
			m.put("process", fun.getProcess());
			m.put("activity", fun.getActivity());
			m.put("children", getTableListChild(fun.getSid()));
			rl.add(m);
		}
		return rl;
	}

	List<Map<String, Object>> getTableListChild(String pid) {
		List<Map<String, Object>> rl = new ArrayList<>();
		List<SaMenuTree> roots = saMenuTreeService.selectByPID(pid);
		for (SaMenuTree fun : roots) {
			Map<String, Object> m = new HashMap<>();
			m.put("id", fun.getSid());
			m.put("text", fun.getLabel());
			m.put("name", fun.getLabel());
			m.put("pid", fun.getPid());
			m.put("label", fun.getLabel());
			m.put("surl", fun.getUrl());
			m.put("process", fun.getProcess());
			m.put("activity", fun.getActivity());
			m.put("children", getTableListChild(fun.getSid()));
			rl.add(m);
		}
		return rl;
	}
}
