package com.tlv8.common.utils;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class IPUtils {
	/**
	 * 获取服务器的IP
	 */
	public static String getIP() {
		String IP = "127.0.0.1";
		try {
			Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
			while (networkInterfaces.hasMoreElements()) {
				NetworkInterface networkInterface = networkInterfaces.nextElement();
				Enumeration<InetAddress> inetAddresses = networkInterface.getInetAddresses();
				while (inetAddresses.hasMoreElements()) {
					InetAddress inetAddress = inetAddresses.nextElement();
					if (!inetAddress.isLoopbackAddress() && !inetAddress.isLinkLocalAddress()
							&& inetAddress.isSiteLocalAddress()) {
						return inetAddress.getHostAddress();
					}
				}
			}
			InetAddress address = InetAddress.getLocalHost();
			IP = address.getHostAddress();
		} catch (Exception e) {
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
