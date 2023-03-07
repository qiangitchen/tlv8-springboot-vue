package com.tlv8.system.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.tlv8.common.base.Data;
import com.tlv8.common.redis.RedisCache;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.service.ISysParamsService;

import cn.dev33.satoken.stp.StpUtil;

/**
 * 角色
 */
@Controller
@RequestMapping("/system")
public class RolesController {

	@Autowired
	private ISysParamsService sysParamsService;

	@Autowired
	private RedisCache redisCache;

	@ResponseBody
	@RequestMapping("/getAllRolesAction")
	public Object getAllRoles(HttpServletRequest request) throws Exception {
		Data data = new Data();
		try {
			ContextBean context = redisCache.getCacheObject(StpUtil.getTokenValue());
			String personfid = context.getCurrentPersonFullID();
			List<Map<String, String>> list = sysParamsService.getRoles(personfid);
			List<String> rolelist = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				rolelist.add(list.get(i).get("SCODE"));
			}
			data.setData(JSON.toJSONString(rolelist));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.getMessage());
			e.printStackTrace();
		}
		return data;
	}

}
