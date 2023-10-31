package com.tlv8.system.help;

import java.util.ArrayList;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.redis.RedisCache;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.help.enums.MsgStatus;
import com.tlv8.system.help.enums.RenderStatus;

import cn.dev33.satoken.stp.StpUtil;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class UserResponse {
	private static final Logger logger = LoggerFactory.getLogger(UserResponse.class);
	private final ArrayList<JSONObject> jsonList = new ArrayList();

	private RedisCache redisCache;

	private static JSONObject genRenderJSON(String status, String code, String title, String text, String data) {
		JSONObject json = new JSONObject();
		try {
			if ((status != null) && (status != ""))
				json.put("status", status);
			if ((code != null) && (code != ""))
				json.put("code", code);
			if ((title != null) && (title != ""))
				json.put("title", title);
			if ((text != null) && (text != ""))
				json.put("text", text);
			if ((data != null) && (data != ""))
				json.put("data", data);
		} catch (Exception e) {
			logger.debug(e.toString());
		}
		return json;
	}

	private static JSONArray genRenderJSON(ArrayList<JSONObject> jsonList) {
		Iterator list = jsonList.iterator();
		JSONArray array = new JSONArray();
		while (list.hasNext()) {
			array.add(list.next());
		}
		return array;
	}

	public UserResponse(RedisCache redisCache) {
		this.redisCache = redisCache;
	}

	public void put(RenderStatus status, String data) {
		this.jsonList.add(genRenderJSON(status.toString(), null, null, null, data));
	}

	public void put(MsgStatus status, String code, String title, String text, Object[] params) {
		ContextBean contextBean = redisCache.getCacheObject(StpUtil.getTokenValue());
		this.jsonList
				.add(genRenderJSON(status.toString(), code, MessageResource.getMessage(contextBean.getLocale(), title),
						MessageResource.getMessage(contextBean.getLocale(), text, params), null));
	}

	public void put(MsgStatus status, String code, String title, String text) {
		ContextBean contextBean = redisCache.getCacheObject(StpUtil.getTokenValue());
		this.jsonList
				.add(genRenderJSON(status.toString(), code, MessageResource.getMessage(contextBean.getLocale(), title),
						MessageResource.getMessage(contextBean.getLocale(), text), null));
	}

	public String toString() {
		return genRenderJSON(this.jsonList).toString();
	}

	public void reset() {
		this.jsonList.clear();
	}
}