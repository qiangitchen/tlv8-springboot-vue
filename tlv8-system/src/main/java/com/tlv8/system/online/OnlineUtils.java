package com.tlv8.system.online;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tlv8.system.pojo.SaOnlineinfo;
import com.tlv8.system.service.ISaOnlineinfoService;

@Component
public class OnlineUtils {

	@Autowired
	ISaOnlineinfoService saOnlineinfoService;

	public void deleteOnlie(String token) {
		saOnlineinfoService.deleteDataBySessionID(token);
	}

	public long getOnlineCount() {
		return saOnlineinfoService.getCount();
	}

	public List<Map<String, Object>> getOnlineList() {
		List<Map<String, Object>> relist = new ArrayList<Map<String, Object>>();
		List<SaOnlineinfo> dlist = saOnlineinfoService.selectList();
		for (SaOnlineinfo online : dlist) {
			Map<String, Object> jsonMap = new HashMap<>();
			jsonMap.put("rowid", online.getSid());
			jsonMap.put("userid", online.getSuserid());
			jsonMap.put("username", online.getSusername());
			jsonMap.put("userfullid", online.getSuserfid());
			jsonMap.put("userfullname", online.getSuserfid());
			jsonMap.put("loginIP", online.getSloginip());
			jsonMap.put("loginDate", online.getSlogindate());
			jsonMap.put("sessionID", online.getSsessionid());
			relist.add(jsonMap);
		}
		return relist;
	}
}
