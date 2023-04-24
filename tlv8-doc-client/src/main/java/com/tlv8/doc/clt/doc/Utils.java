package com.tlv8.doc.clt.doc;

import java.io.InputStream;
import java.util.List;
import java.util.UUID;

public class Utils {

	public static boolean isNotEmptyString(String paramString) {
		return (paramString != null) && (paramString.trim().length() != 0);
	}

	public static boolean isNotNull(InputStream paramObject) {
		return paramObject != null;
	}

	public static boolean isEmptyString(String paramString) {
		return (null == paramString) || ("".equals(paramString));
	}

	public static boolean isNull(Object paramObject) {
		return paramObject == null;
	}

	public static boolean isNotNull(Object paramObject) {
		return paramObject != null;
	}

	public static void checkNotEmptyString(String string, List<?> paramTable, Object logger) {

	}

	public static String moveRepeatStr(String ms, String cs) {
		int index = 0;
		while (ms.indexOf(cs) > -1) {
			index = ms.indexOf(cs);
			ms = ms.replace(cs, "");
		}
		ms = ms.substring(0, index) + cs + ms.substring(index);
		return ms;
	}

	public static String getID() {
		return UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
	}

}
