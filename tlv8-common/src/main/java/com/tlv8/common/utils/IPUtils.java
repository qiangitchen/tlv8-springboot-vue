package com.tlv8.common.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

public class IPUtils {
	/**
	 * 获取服务器的IP
	 */
	public static String getIP() {
		String IP = "127.0.0.1";
		try {
			InetAddress address = InetAddress.getLocalHost();
			IP = address.getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return IP;
	}

	/**
	 * 获取访问者的IP
	 */
	public static String getRemoteAddr(HttpServletRequest req) {
		String ip = req.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = req.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = req.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = req.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = req.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = req.getRemoteAddr();
		}
		if (ip.equals("0:0:0:0:0:0:0:1"))
			ip = "127.0.0.1";
		return ip;
	}
}
