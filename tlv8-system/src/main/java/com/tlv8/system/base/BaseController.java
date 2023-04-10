package com.tlv8.system.base;

import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.common.redis.RedisCache;
import com.tlv8.common.utils.ServletUtils;
import com.tlv8.system.action.GetSysParams;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.bean.HttpBean;
import com.tlv8.system.help.ResponseProcessor;
import com.tlv8.system.help.UserResponse;
import com.tlv8.system.help.enums.MsgStatus;
import com.tlv8.system.help.enums.RenderStatus;
import com.tlv8.system.pojo.SysLogin;
import com.tlv8.system.utils.ContextUtils;

import cn.dev33.satoken.stp.StpUtil;

/**
 * @author ChenQian
 * @category 2011-2-12
 */
public class BaseController {
	@Autowired
	protected HttpServletRequest request;
	@Autowired
	protected HttpServletResponse response;
	@Autowired
	private GetSysParams sysParams;

	@Autowired
	protected RedisCache redisCache;

	private UserResponse uesrResponse;

	private ContextBean contextbean;

	protected void renderData() {
		if (this.uesrResponse == null) {
			this.uesrResponse = new UserResponse(redisCache);
		}
		try {
			ResponseProcessor.renderText(this.response, this.uesrResponse.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.uesrResponse.reset();
		}
	}

	private void renderData(RenderStatus status, String data) {
		if (this.uesrResponse == null) {
			this.uesrResponse = new UserResponse(redisCache);
		}
		this.uesrResponse.put(status, data);
		renderData();
	}

	protected void renderData(Boolean success, String data) {
		renderData(success.booleanValue() ? RenderStatus.SUCCESS : RenderStatus.FAILURE, data);
	}

	protected void renderData(Boolean success) {
		renderData(success, null);
	}

	protected void renderData(String data) {
		renderData(Boolean.valueOf(true), data);
	}

	protected void prepareMsg(MsgStatus status, String code, String title, String text) {
		if (this.uesrResponse == null) {
			this.uesrResponse = new UserResponse(redisCache);
		}
		this.uesrResponse.put(status, code, title, text);
	}

	protected void prepareMsg(MsgStatus status, String code, String title, String text, Object[] params) {
		if (this.uesrResponse == null) {
			this.uesrResponse = new UserResponse(redisCache);
		}
		this.uesrResponse.put(status, code, title, text, params);
	}

	public void setDependency(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.uesrResponse = new UserResponse(redisCache);
	}

	private void initRequest() {
		if (this.request == null) {
			request = ServletUtils.getRequest();
		}
	}

	public String p(String name) {
		initRequest();
		return this.request.getParameter(name);
	}

	public Object a(String name) {
		initRequest();
		return this.request.getAttribute(name);
	}

	public String r(String key) {
		initRequest();
		return key;
	}

	public void setContext(ContextBean contextbean) {
		this.contextbean = contextbean;
	}

	public ContextBean getContext() {
		try {
			this.contextbean = redisCache.getCacheObject(StpUtil.getTokenValue());
		} catch (Exception e) {
		}
		if (this.contextbean == null) {
			String personid = StpUtil.getLoginId(null);
			if (personid != null) {
				this.contextbean = ContextUtils.getContext(personid);
			}
		}
		if (this.contextbean == null) {
			this.contextbean = new ContextBean();
		}
		return this.contextbean;
	}

	/**
	 *
	 */
	private HttpBean http = new HttpBean();

	public void setHttp(HttpBean http) {
		this.http = http;
	}

	public int executeMethod(String key, HttpMethod method) throws IOException {
		HttpClient client = this.http.getClient(key);
		return client.executeMethod(method);
	}

	public void clearHttpClient() {
		this.http.clear();
	}

	public Document executeMethodAsDocument(String key, HttpMethod method) throws IOException, DocumentException {
		int r = this.executeMethod(key, method);
		if (r == HttpStatus.SC_OK) {
			SAXReader reader = new SAXReader();
			return reader.read(new InputStreamReader(method.getResponseBodyAsStream(), StandardCharsets.UTF_8));
		} else {
			return null;
		}
	}

	public Document executeMethodAsDocument(HttpMethod method) throws IOException, DocumentException {
		return executeMethodAsDocument("BusinessServer", method);
	}

	protected HashMap<String, String> getSysParams(HttpServletRequest req, SysLogin sysLogin) {
		HashMap<String, String> map = new HashMap<String, String>();
		try {
			map = sysParams.getSysParamsFunc(sysLogin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}