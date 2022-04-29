package com.tlv8.system.help;

public class PassCodeHelper {
	private static final String key = "tlv8pass";// 可以自定义密码

	// 加密
	public static String enCode(String s) {
		String str = "";
		int ch;
		if (key.length() == 0) {
			return s;
		} else if (!s.equals(null)) {
			for (int i = 0, j = 0; i < s.length(); i++, j++) {
				if (j > key.length() - 1) {
					j = j % key.length();
				}
				ch = s.codePointAt(i) + key.codePointAt(j);
				if (ch > 65535) {
					ch = ch % 65535;
				}
				str += getSp(i) + (char) ch;
			}
		}
		return str;

	}

	// 解密
	public static String deCode(String s) {
		String str = "";
		int ch;
		if (key.length() == 0) {
			return s;
		} else if (!s.equals(key)) {
			for (int i = 0, j = 0; i < s.length(); i++, j++) {
				s = s.replace(getSp(i), "");
				if (j > key.length() - 1) {
					j = j % key.length();
				}
				ch = (s.codePointAt(i) + 65535 - key.codePointAt(j));
				if (ch > 65535) {
					ch = ch % 65535;
				}
				str += (char) ch;
			}
		}
		return str;
	}

	public static String getSp(int i) {
		String[] spstr = { "", "!", "@", "#", "$", "%", "^", "&", "*" };
		if (i < 9) {
			return spstr[i];
		}
		return "";
	}

}
