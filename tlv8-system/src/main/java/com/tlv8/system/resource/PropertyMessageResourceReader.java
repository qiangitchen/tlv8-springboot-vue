package com.tlv8.system.resource;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class PropertyMessageResourceReader extends MessageResourceReader {
	private final Map<String, Properties> messages = new HashMap();

	public synchronized void load(String locale) {
		if (locale == null) {
			locale = "";
		}
		if (this.messages.containsKey(locale)) {
			return;
		}
	}

	public String getProperty(String key, Locale locale) {
		String localeKey = "";
		if (locale != null) {
			localeKey = locale.toString();
		}
		load(localeKey);

		Properties props = this.messages.get(localeKey);

		if (props == null) {
			load("");
			props = this.messages.get("");
		}

		if (props == null) {
			return key;
		}

		String message = props.getProperty(key);

		return message != null ? message : key;
	}

	public String getProperty(String key, Locale locale, Object[] params) {
		return format(getProperty(key, locale), params);
	}

	public String getProperty(String key, Locale locale, Iterable<Object> params) {
		return format(getProperty(key, locale), params);
	}

	private String format(String message, Object[] params) {
		if (message == null) {
			return message;
		}
		if ((params != null) && (params.length > 0)) {
			for (int index = 0; index < params.length; index++) {
				if (params[0] != null) {
					message = message.replace("{" + index + "}",
							params[index].toString());
				}
			}
		}
		message.replace("\\{", "{");
		message.replace("\\}", "}");
		return message;
	}

	private String format(String message, Iterable<Object> params) {
		if (message == null)
			return message;
		int index;
		Iterator i$;
		if (params != null) {
			index = 0;
			for (i$ = params.iterator(); i$.hasNext();) {
				Object param = i$.next();
				if (param != null) {
					message = message.replace("{" + index++ + "}",
							param.toString());
				}
			}
		}
		message.replace("\\{", "{");
		message.replace("\\}", "}");
		return message;
	}
}