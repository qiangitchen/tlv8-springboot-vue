package com.tlv8.system.help;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.common.base.Sys;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.listener.SessionListener;
import com.tlv8.system.online.InitOnlineInfoAction;
import com.tlv8.system.service.ISaOnlineinfoService;

/**
 * Session监听-处理在线用户信息
 * 
 * @author chenqian
 *
 */
@SuppressWarnings({ "unchecked", "rawtypes" })
public final class OnlineHelper implements HttpSessionListener {
	private static final Hashtable<String, Date> userList = new Hashtable();
	private static final Map<String, ContextBean> onlienusemap = new HashMap();
	private static final List<SessionListener> sslistener = new ArrayList<SessionListener>();

	@Autowired
	ISaOnlineinfoService onlineinfosvr;

	public OnlineHelper(ISaOnlineinfoService onlineinfosvr){
		this.onlineinfosvr = onlineinfosvr;
	}

	public void sessionCreated(HttpSessionEvent se) {
		Sys.printMsg("session创建：" + new java.util.Date());
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		String sessionID = se.getSession().getId();
		if (sessionID != null) {
			try {
				reMove(sessionID);
				Sys.printMsg("session销毁:" + new java.util.Date() + " sessionid:" + sessionID);
				onlineinfosvr.deleteDataBySessionID(sessionID);
			} catch (Exception e) {
			}
		}
	}

	public static synchronized void refresh(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// RegisterCheck.check();
		Date date = new Date();
		// LoginSetting.checkLog(getOnlineCount() + 1);
		String sessionID = SessionHelper.getContext(request).getSessionID();
		// String userID = SessionHelper.getContext(request).getCurrentUserID();
		if ((sessionID != null) && (!"".equals(sessionID))) {
			userList.put(sessionID, date);
			onlienusemap.put(sessionID, SessionHelper.getContext(request));
			Sys.printMsg("系统当前在线人数：" + userList.size());
		}

		try {
			new InitOnlineInfoAction().execute(request, response);
		} catch (Exception e) {
		}
	}

	public static void reMove(String sessionID) {
		destroyedMyListener(sessionID);
		userList.remove(sessionID);
		onlienusemap.remove(sessionID);
		Sys.printMsg("系统当前在线人数：" + userList.size());
	}

	public long getOnlineCount() {
		long count = onlineinfosvr.getCount();
		return (count == -1) ? userList.size() : count;
	}

	public static List getOnlineUserList() {
		List list = new ArrayList();
		Iterator it = userList.keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			list.add(onlienusemap.get(key).getCurrentPersonID());
		}
		return list;
	}

	public static Map getOnlineUserMap() {
		return onlienusemap;
	}

	public static ContextBean getOnlineUserMap(String sessionid) {
		return onlienusemap.get(sessionid);
	}

	private static void destroyedMyListener(String sessionID) {
		if (onlienusemap.containsKey(sessionID)) {
			for (SessionListener ln : sslistener) {
				ln.sessionDestroyed(onlienusemap.get(sessionID));
			}
		}
	}

	public static void addListener(SessionListener listener) {
		sslistener.add(listener);
	}

	public static void removeListener(SessionListener listener) {
		sslistener.remove(listener);
	}
}
