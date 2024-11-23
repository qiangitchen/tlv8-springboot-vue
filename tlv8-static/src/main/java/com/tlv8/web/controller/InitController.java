package com.tlv8.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.utils.StringUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.pojo.SaMenu;
import com.tlv8.system.service.ISaMenuService;
import com.tlv8.system.utils.ContextUtils;

/**
 * 门户配置
 * 
 * @author 陈乾
 *
 */
@Controller
@RequestMapping("/portal")
public class InitController {
	@Autowired
	ISaMenuService saMenuService;

	@ResponseBody
	@RequestMapping("/initMenu")
	public Object initMenu(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> res = new HashMap<String, Object>();
		Map<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("title", "首页");
		hmap.put("href", "home/console.html");
		res.put("homeInfo", hmap);
		Map<String, Object> logmap = new HashMap<String, Object>();
		logmap.put("title", "TLv8平台");
		logmap.put("image", "images/logo.png");
		logmap.put("href", "");
		res.put("logoInfo", logmap);
		res.put("menuInfo", getMenu());
		return res;
	}

	private List<Map<String, Object>> getMenu() {
		ContextBean context = ContextUtils.getContext();
		List<SaMenu> samenus = saMenuService.selectList(context.getCurrentPersonID(), context.getCurrentPersonFullID());
		List<Map<String, Object>> list = new ArrayList<>();
		for (SaMenu samenu : samenus) {
			if (StringUtils.isEmpty(samenu.getParent()) && !samenu.isHidden()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", samenu.getId());
				map.put("title", samenu.getTitle());
				map.put("icon", samenu.getLayuiicon());
				map.put("href", samenu.getLink());
				map.put("pid", samenu.getParent());
				map.put("child", getChildMenu(samenu.getId(), samenus));
				list.add(map);
			}
		}
		return list;
	}

	private List<Map<String, Object>> getChildMenu(String id, List<SaMenu> samenus) {
		List<Map<String, Object>> list = new ArrayList<>();
		for (SaMenu samenu : samenus) {
			if (id.equals(samenu.getParent()) && !samenu.isHidden()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("id", samenu.getId());
				map.put("title", samenu.getTitle());
				map.put("icon", samenu.getLayuiicon());
				map.put("href", samenu.getLink());
				map.put("pid", samenu.getParent());
				map.put("child", getChildMenu(samenu.getId(), samenus));
				list.add(map);
			}
		}
		return list;
	}

}
