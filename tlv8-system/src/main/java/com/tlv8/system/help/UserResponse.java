package com.tlv8.system.help;

import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.tlv8.system.help.enums.MsgStatus;
import com.tlv8.system.help.enums.RenderStatus;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class UserResponse {
	private static final Logger logger = Logger.getLogger(UserResponse.class);

	private final HttpServletRequest request;
	private final ArrayList<JSONObject> jsonList = new ArrayList();

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
		} catch (JSONException e) {
			logger.debug(e);
		}
		return json;
	}

	private static JSONArray genRenderJSON(ArrayList<JSONObject> jsonList) {
		Iterator list = jsonList.iterator();
		JSONArray array = new JSONArray();
		while (list.hasNext()) {
			array.put(list.next());
		}
		return array;
	}

	public UserResponse(HttpServletRequest request) {
		this.request = request;
	}

	public void put(RenderStatus status, String data) {
		this.jsonList.add(genRenderJSON(status.toString(), null, null, null, data));
	}

	public void put(MsgStatus status, String code, String title, String text, Object[] params) {
		this.jsonList.add(genRenderJSON(status.toString(), code,
				MessageResource.getMessage(SessionHelper.getLocale(this.request), title),
				MessageResource.getMessage(SessionHelper.getLocale(this.request), text, params), null));
	}

	public void put(MsgStatus status, String code, String title, String text) {
		this.jsonList.add(genRenderJSON(status.toString(), code,
				MessageResource.getMessage(SessionHelper.getLocale(this.request), title),
				MessageResource.getMessage(SessionHelper.getLocale(this.request), text), null));
	}

	public String toString() {
		return genRenderJSON(this.jsonList).toString();
	}

	public void reset() {
		this.jsonList.clear();
	}
}