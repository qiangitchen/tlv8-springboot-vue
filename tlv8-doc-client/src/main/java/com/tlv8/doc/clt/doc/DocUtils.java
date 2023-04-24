package com.tlv8.doc.clt.doc;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.InetAddress;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.SimpleHttpConnectionManager;
import org.apache.commons.httpclient.methods.InputStreamRequestEntity;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.params.HttpClientParams;
import org.apache.commons.httpclient.protocol.Protocol;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class DocUtils {
	protected static void registHttps(String url) {
		if ("https".equals(url.substring(0, url.indexOf(":")))) {
			@SuppressWarnings("deprecation")
			Protocol myhttps = new Protocol("https", new SslSecureProtocolSocketFactory(), 443);
			Protocol.registerProtocol("https", myhttps);
		}
	}

	public static Document excutePostAction(String url, InputStream param) throws Exception {
		registHttps(url);
		// System.out.println("test0:"+url);
		HttpClient httpClient = new HttpClient(new HttpClientParams(), new SimpleHttpConnectionManager(true));
		// System.out.println(getUrlAssign(url));
		PostMethod postMethod = new PostMethod(addBsessionId(getUrlAssign(url)));
		if (Utils.isNotNull(param)) {
			RequestEntity requestEntity = new InputStreamRequestEntity(param);
			postMethod.setRequestEntity(requestEntity);
			postMethod.setRequestHeader("Content-type", "text/xml");
		}
		try {
			int statusCode = httpClient.executeMethod(postMethod);
			if (statusCode != HttpStatus.SC_OK) {
				if (statusCode == 202) {
					// System.out.println("test1:"+postMethod.getResponseBodyAsString());
					InputStream is = postMethod.getResponseBodyAsStream();
					SAXReader reader = new SAXReader();
					Document responseDoc = reader.read(is);
					postMethod.releaseConnection();
					Element rootElement = responseDoc.getRootElement();
					Element ns_exception = (Element) rootElement
							.selectSingleNode("//*[local-name()= 'cause']/*[local-name()= 'exception']");
					throw new DocRTException(
							"Failed to send request to DocServer: " + ns_exception.attributeValue("message"),
							new Exception());
				}
				throw new DocRTException("Failed to send request to DocServer: " + postMethod.getStatusLine(),
						new Exception());
			} else {
				InputStream is = postMethod.getResponseBodyAsStream();
				// System.out.println(is.available());
				SAXReader reader = new SAXReader();
				if (Utils.isNotNull(is)) {
					Document responseDoc = reader.read(is);
					return responseDoc;
				}
			}
		} finally {
			postMethod.releaseConnection();
		}
		return null;
	}

	public static void saveDocFlag(String host, String docPath, String kind, String fileID, String cacheName,
			Boolean isHttps) throws Exception {
		String url = host + "/repository/file/cache/commit";
		if (Utils.isNotEmptyString(fileID)) {
			StringBuffer sb = new StringBuffer();
			sb.append("<data><item>");
			sb.append("<operation-type>flagCommit</operation-type>");
			sb.append("<kind>");
			sb.append(kind);
			sb.append("</kind>");
			sb.append("<file-id>");
			sb.append(fileID);
			sb.append("</file-id>");
			sb.append("<cache-name>");
			sb.append(cacheName);
			sb.append("</cache-name>");
			sb.append("</item></data>");
			Document result = excutePostAction(url, new ByteArrayInputStream(sb.toString().getBytes("UTF-8")));
			System.out.println(result.asXML());
			if (!"true".equals(result.selectSingleNode("//flag").getText())) {
				throw new DocRTException("DocServer flagCommit error ", new Exception());
			}
		}
	}

	protected static String getSecureKey(String urlPattern) throws Exception {
		DesUtils des = new DesUtils();
		String key = des.encrypt(urlPattern + "," + new java.util.Date().getTime());
		return key;
	}

	protected static String getUrlAssign(String urlPattern) throws Exception {
		if (Utils.isEmptyString(urlPattern)) {
			return null;
		}
		String key = getSecureKey(urlPattern);

		if (urlPattern.contains("?")) {
			return urlPattern + "&key=" + key;
		} else {
			return urlPattern + "?key=" + key;
		}
	}

	protected static String getBsessionid() {
		return ActionUtils.getSessionID();
	}

	protected static String addBsessionId(String url) throws Exception {
		if (Utils.isEmptyString(url)) {
			return null;
		}
		if (url.contains("?")) {
			return url + "&bsessionid=" + getBsessionid();
		} else {
			return url + "?bsessionid=" + getBsessionid();
		}
	}

	public static String getValue(String obj, String defaultValue) {
		if (obj == null) {
			return defaultValue;
		} else {
			return obj;
		}
	}

	public static String getBizSecureParams() throws Exception {
		InetAddress localhost = InetAddress.getLocalHost();
		String ipStr = localhost.getHostAddress();
		DesUtils des = new DesUtils();
		String key = des.encrypt(ipStr);
		return "bizAddress=" + key;
	}

}
