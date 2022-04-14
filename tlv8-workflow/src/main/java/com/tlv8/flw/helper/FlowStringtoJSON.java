package com.tlv8.flw.helper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.alibaba.fastjson.JSON;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class FlowStringtoJSON {
	/*
	 * 将JSON字符串转换成Java对象
	 */
	public static List<Map> ParseMapList(String jsonStr) {
		List list = new ArrayList();
		JSONArray array;
		try {
			array = new JSONArray(jsonStr);
			for (int i = 0; i < array.length(); i++) {
				JSONObject obj = (JSONObject) array.get(i);
				Map m = (Map) JSON.parse(obj.toString());
				list.add(m);
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static Map parseMap(String jsonStr) {
		Map map = new HashMap();
		try {
			map = (Map) JSON.parse(jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
