package com.tlv8.system.listener;

import com.tlv8.system.bean.ContextBean;

public interface SessionListener {
	void sessionDestroyed(ContextBean centext);
}
