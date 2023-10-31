package com.tlv8.system.help;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletResponse;

public final class ResponseProcessor {
	private static final Logger logger = LoggerFactory.getLogger(ResponseProcessor.class);

	public static void renderText(HttpServletResponse res, String text) {
		try {
			res.setHeader("Content-Type", "application/json;charset=utf-8");
			res.getWriter().print(text);
			res.getWriter().close();
		} catch (Exception e) {
			//e.printStackTrace();
			logger.debug(e.toString());
		}
	}
}
