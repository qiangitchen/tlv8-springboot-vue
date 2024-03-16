package com.tlv8.system.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.HttpException;
import org.dom4j.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.system.base.BaseController;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.pojo.SaMenu;
import com.tlv8.system.service.ISaMenuService;
import com.tlv8.system.utils.ContextUtils;

@Controller
@Scope("prototype")
@RequestMapping("/system")
public class FuncTreeController extends BaseController {
	@Autowired
	ISaMenuService saMenuService;

	@ResponseBody
	@RequestMapping("/Func")
	public void index() throws HttpException, IOException, DocumentException {
		ContextBean context = ContextUtils.getContext();
		List<SaMenu> samenus = saMenuService.selectList(context.getCurrentPersonID(), context.getCurrentPersonFullID());
		String funmenu = this.readElement(samenus);
		this.renderData(funmenu);
	}

	@ResponseBody
	@RequestMapping("/FuncTree")
	public void funcTree() throws HttpException, IOException, DocumentException {
		index();
	}

	@ResponseBody
	@RequestMapping("/FuncTree2")
	public void index2() throws HttpException, IOException, DocumentException {
		ContextBean context = ContextUtils.getContext();
		List<SaMenu> samenus = saMenuService.selectList(context.getCurrentPersonID(), context.getCurrentPersonFullID());
		String funmenu = this.readElement2(samenus);
		this.renderData(funmenu);
	}

	@ResponseBody
	@RequestMapping("/FuncTree3")
	public void index3() throws HttpException, IOException, DocumentException {
		JSONObject json = new JSONObject();
		try {
			ContextBean context = ContextUtils.getContext();
			List<SaMenu> samenus = saMenuService.selectList(context.getCurrentPersonID(),
					context.getCurrentPersonFullID());
			json = readElement3(samenus);
		} catch (Exception e) {
		}
		this.renderData(json.toString());
	}

	@ResponseBody
	@RequestMapping("/MFuncTree")
	public void mindex() throws HttpException, IOException, DocumentException {
		ContextBean context = ContextUtils.getContext();
		List<SaMenu> samenus = saMenuService.selectList(context.getCurrentPersonID(), context.getCurrentPersonFullID());
		String funmenu = this.readElement(samenus);
		this.renderData(funmenu);
	}

	protected String readElement(List<SaMenu> samenus) {
		List<Map<String, Object>> list = new ArrayList<>();
		for (SaMenu samenu : samenus) {
			if (StringUtils.isEmpty(samenu.getParent()) && !samenu.isHidden()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("nodeName", "item");
				map.put("id", samenu.getId());
				map.put("label", samenu.getTitle());
				map.put("icon", samenu.getIcon());
				map.put("layuiIcon", samenu.getLayuiicon());
				map.put("process", samenu.getProcess());
				map.put("activity", samenu.getProcess());
				map.put("url", samenu.getLink());
				map.put("pid", samenu.getParent());
				map.put("childNodes", getChildMenu(samenu.getId(), samenus));
				list.add(map);
			}
		}
		return JSONArray.toJSONString(list);
	}

	protected List<Map<String, Object>> getChildMenu(String id, List<SaMenu> samenus) {
		List<Map<String, Object>> list = new ArrayList<>();
		for (SaMenu samenu : samenus) {
			if (id.equals(samenu.getParent()) && !samenu.isHidden()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("nodeName", "item");
				map.put("id", samenu.getId());
				map.put("label", samenu.getTitle());
				map.put("icon", samenu.getIcon());
				map.put("layuiIcon", samenu.getLayuiicon());
				map.put("process", samenu.getProcess());
				map.put("activity", samenu.getProcess());
				map.put("url", samenu.getLink());
				map.put("pid", samenu.getParent());
				map.put("childNodes", getChildMenu(samenu.getId(), samenus));
				list.add(map);
			}
		}
		return list;
	}

	protected String readElement2(List<SaMenu> samenus) {
		List<Map<String, Object>> list = new ArrayList<>();
		for (SaMenu samenu : samenus) {
			if (StringUtils.isEmpty(samenu.getParent()) && !samenu.isHidden()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", samenu.getId());
				map.put("label", samenu.getTitle());
				map.put("icon", samenu.getIcon());
				map.put("layuiIcon", samenu.getLayuiicon());
				map.put("process", samenu.getProcess());
				map.put("activity", samenu.getProcess());
				map.put("path", samenu.getLink());
				map.put("pId", samenu.getParent());
				list.add(map);
				list.addAll(getChildMenu2(samenu.getId(), samenus));
			}
		}
		return JSONArray.toJSONString(list);
	}

	protected List<Map<String, Object>> getChildMenu2(String id, List<SaMenu> samenus) {
		List<Map<String, Object>> list = new ArrayList<>();
		for (SaMenu samenu : samenus) {
			if (id.equals(samenu.getParent()) && !samenu.isHidden()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", samenu.getId());
				map.put("label", samenu.getTitle());
				map.put("icon", samenu.getIcon());
				map.put("layuiIcon", samenu.getLayuiicon());
				map.put("process", samenu.getProcess());
				map.put("activity", samenu.getProcess());
				if (!hashChild(samenu, samenus)) {
					map.put("path", samenu.getLink());
				}
				map.put("pId", samenu.getParent());
				list.add(map);
				list.addAll(getChildMenu2(samenu.getId(), samenus));
			}
		}
		return list;
	}

	protected boolean hashChild(SaMenu menu, List<SaMenu> samenus) {
		for (SaMenu samenu : samenus) {
			if (menu.getId().equals(samenu.getParent())) {
				return true;
			}
		}
		return false;
	}

	protected JSONObject readElement3(List<SaMenu> samenus) throws Exception {
		List<Map<String, Object>> list = new ArrayList<>();
		for (SaMenu samenu : samenus) {
			if (StringUtils.isEmpty(samenu.getParent()) && !samenu.isHidden()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", samenu.getId());
				map.put("text", samenu.getTitle());
				map.put("icon", samenu.getIcon());
				map.put("layuiIcon", samenu.getLayuiicon());
				map.put("process", samenu.getProcess());
				map.put("activity", samenu.getProcess());
				map.put("url", samenu.getLink());
				map.put("path", samenu.getLink());
				map.put("pid", samenu.getParent());
				List<Map<String, Object>> children = getChildMenu3(samenu.getId(), samenus);
				if (children.size() > 0) {
					map.put("children", children);
					map.put("iconCls", "icon-sum");
				} else {
					map.put("iconCls", "icon-file");
				}
				list.add(map);
			}
		}
		return JSONArray.parseObject(JSONArray.toJSONString(list));
	}

	protected List<Map<String, Object>> getChildMenu3(String id, List<SaMenu> samenus) {
		List<Map<String, Object>> list = new ArrayList<>();
		for (SaMenu samenu : samenus) {
			if (id.equals(samenu.getParent()) && !samenu.isHidden()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", samenu.getId());
				map.put("text", samenu.getTitle());
				map.put("icon", samenu.getIcon());
				map.put("layuiIcon", samenu.getLayuiicon());
				map.put("process", samenu.getProcess());
				map.put("activity", samenu.getProcess());
				map.put("url", samenu.getLink());
				map.put("path", samenu.getLink());
				map.put("pid", samenu.getParent());
				List<Map<String, Object>> children = getChildMenu3(samenu.getId(), samenus);
				if (children.size() > 0) {
					map.put("children", children);
					map.put("iconCls", "icon-sum");
				} else {
					map.put("iconCls", "icon-file");
				}
				list.add(map);
			}
		}
		return list;
	}

}
