package com.tlv8.system.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.dom4j.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

import com.tlv8.common.base.Sys;
import com.tlv8.common.constant.CacheConstants;
import com.tlv8.common.constant.HttpStatus;
import com.tlv8.common.utils.IPUtils;
import com.tlv8.system.action.Login;
import com.tlv8.system.action.SAPerson;
import com.tlv8.system.action.WriteLoginLog;
import com.tlv8.system.base.BaseController;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.help.Configuration;
import com.tlv8.system.online.InitOnlineInfoAction;
import com.tlv8.system.online.OnlineUtils;
import com.tlv8.system.pojo.SysLogin;
import com.tlv8.system.service.ISaOnlineinfoService;

import cn.dev33.satoken.stp.StpUtil;

/**
 * 系统用户登录相关
 *
 * @author chenqian
 */
@Controller
@Scope("prototype")
@RequestMapping("/system/User")
public class UserController extends BaseController {

	@Autowired
	private ISaOnlineinfoService onlineinfosvr;

	@Autowired
	private Login login;

	@Autowired
	private WriteLoginLog writeLoginLog;

	@Autowired
	private SAPerson saPerson;

	@Autowired
	InitOnlineInfoAction initOnline;

	@Autowired
	OnlineUtils onlineUtil;

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(@RequestBody Map<String, String> rqparams) throws DocumentException, IOException {
		String username = rqparams.get("username");
		String password = rqparams.get("password");
		String loginDate = rqparams.get("loginDate");
		String language = rqparams.get("language");
		String logintype = (rqparams.get("logintype") != null ? rqparams.get("logintype") : "mobile");
		String uuid = rqparams.get("uuid");
		String captcha = rqparams.get("captcha");
		String agent = rqparams.get("agent");
		String onceFunc = rqparams.get("onceFunc");
		String mode = rqparams.get("mode");
		String ip = rqparams.get("ip");
		String msg = "";
		String token = "";
		Sys.printMsg(username + ":登录系统");
		boolean isAgent = ((agent != null) && (!agent.equals("")));
		boolean isNTLogin = ((mode != null) && (mode.equals("nt")));
		if ((isNTLogin) && ((ip == null) || (ip.equals("")))) {
			Object ipAttribute = a("ip");
			ip = (ipAttribute != null ? ipAttribute.toString() : IPUtils.getRemoteAddr(this.request));
		}
		if ((ip == null) || ("".equals(ip))) {
			ip = IPUtils.getRemoteAddr(this.request);
		}
		if (captcha == null) {
			captcha = "";
		}
		try {
			Configuration.processConfiguration();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;
		if ((!"no_captcha".equals(captcha)) && (Configuration.getCaptchaEnabled().booleanValue())) {
			if (captcha == "") {
				msg = "system.UserController.login.3:请输入验证码!";
				renderData(Boolean.valueOf(false), "{\"msg\":\"" + r(msg) + "\"}");
				return;
			}
			if (!captcha.equals(redisCache.getCacheObject(verifyKey))) {
				msg = "验证码错误！";
				renderData(Boolean.valueOf(false), "{\"msg\":\"" + r(msg) + "\"}");
				return;
			}
		}
		if ((loginDate == null) || (loginDate.equals(""))) {
			loginDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		}
		ContextBean contextBean = getContext();
		contextBean.setLocale(language);
		String serverURL = Configuration.getUIServerURL(null);
		contextBean.setUIServerURL(serverURL);
		clearHttpClient();
		boolean success = false;
		try {
			SysLogin sysLogin = login.doLogin(username, password, ip, logintype);
			HashMap<String, String> params = getSysParams(this.request, sysLogin);
			contextBean.initLoginContext(this.request, params);
			contextBean.setOnceFunc(onceFunc);
			contextBean.setUsername(username);
			contextBean.setPassword(password);
			contextBean.setAgent(agent);
			contextBean.setIsAgent(isAgent);
			contextBean.setIsNTLogin(isNTLogin);
			contextBean.setLoginDate(loginDate);
			contextBean.setIp(ip);
			StpUtil.login(contextBean.getPersonID());
			token = StpUtil.getTokenValue();
			redisCache.setCacheObject(token, contextBean);
			success = true;
			initOnline.execute(contextBean, token);
			writeLoginLog.write(contextBean.getCurrentUserID(), username, IPUtils.getRemoteAddr(this.request), password,
					this.request);
			String signm = p("signm");
			if ((signm != null) && (!"".equals(signm)))
				saPerson.addSign(contextBean.getCurrentPersonID(), signm);
		} catch (Exception e) {
			success = false;
			msg = e.getMessage();
			e.printStackTrace();
		}
		if (!success) {
			clearHttpClient();
			contextBean.initLogoutContext(this.request);
		}
		renderData(Boolean.valueOf(success), "{\"msg\":\"" + r(msg) + "\",\"token\":\"" + token + "\"}");
	}

	@ResponseBody
	@RequestMapping(value = "/MD5login", method = RequestMethod.POST)
	public Object MD5login(@RequestBody Map<String, String> rqparams) throws DocumentException, IOException {
		Map<String, Object> res = new HashMap<String, Object>();
		String username = rqparams.get("username");
		String password = rqparams.get("password");
		String loginDate = rqparams.get("loginDate");
		String language = rqparams.get("language");
		String uuid = rqparams.get("uuid");
		String captcha = rqparams.get("captcha");
		String agent = rqparams.get("agent");
		String onceFunc = rqparams.get("onceFunc");
		String mode = rqparams.get("mode");
		String ip = rqparams.get("ip");
		String mobilestatus = "0";
		// String title = "jpolite.res.system.UserController.login.0";
		String msg = "";
		String hxname = "";
		String token = "";
		Sys.printMsg(username + ":登录系统");
		boolean isAgent = ((agent != null) && (!agent.equals("")));
		boolean isNTLogin = ((mode != null) && (mode.equals("nt")));
		clearHttpClient();
		boolean success = false;
		try {
			Configuration.processConfiguration();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;
		if (!"no_captcha".equals(captcha) && captcha != null) {
			if (captcha == "") {
				msg = "请输入验证码!";
				res.put("code", HttpStatus.ERROR);
				res.put("message", r(msg));
				return res;
			}
			if (!captcha.equals(redisCache.getCacheObject(verifyKey))) {
				msg = "验证码错误！";
				res.put("code", HttpStatus.ERROR);
				res.put("message", r(msg));
				return res;
			}
		}
		if ((isNTLogin) && ((ip == null) || (ip.equals("")))) {
			Object ipAttribute = a("ip");
			ip = (ipAttribute != null ? ipAttribute.toString() : IPUtils.getRemoteAddr(this.request));
		}
		if ((ip == null) || ("".equals(ip))) {
			ip = IPUtils.getRemoteAddr(this.request);
		}
		if ((loginDate == null) || (loginDate.equals(""))) {
			loginDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		}
		ContextBean contextBean = getContext();
		contextBean.setLocale(language);
		String serverURL = Configuration.getUIServerURL(null);
		contextBean.setUIServerURL(serverURL);
		try {
			SysLogin sysLogin = login.MD5doLogin(username, password);
			HashMap<String, String> params = getSysParams(this.request, sysLogin);
			contextBean.initLoginContext(this.request, params);
			contextBean.setOnceFunc(onceFunc);
			contextBean.setUsername(username);
			contextBean.setPassword(password);
			contextBean.setAgent(agent);
			contextBean.setIsAgent(isAgent);
			contextBean.setIsNTLogin(isNTLogin);
			contextBean.setLoginDate(loginDate);
			contextBean.setIp(ip);
			StpUtil.login(contextBean.getPersonID());
			token = StpUtil.getTokenValue();
			redisCache.setCacheObject(token, contextBean);
			success = true;
			initOnline.execute(contextBean, token);
			writeLoginLog.write(contextBean.getCurrentUserID(), username, IPUtils.getRemoteAddr(this.request), password,
					this.request);
			String signm = rqparams.get("signm");
			if ((signm != null) && (!"".equals(signm)))
				saPerson.addSign(contextBean.getCurrentPersonID(), signm);
			String sn = rqparams.get("padsn");
			if ((sn != null) && (!"".equals(sn)))
				saPerson.addCASN(contextBean.getCurrentPersonID(), sn);
		} catch (Exception e) {
			success = false;
			msg = e.getMessage();
			Sys.printErr(e.getMessage());
		}
		if (!success) {
			clearHttpClient();
			contextBean.initLogoutContext(this.request);
		}
		res.put("code", HttpStatus.SUCCESS);
		res.put("state", success);
		res.put("message", r(msg));
		res.put("mobilestatus", mobilestatus);
		res.put("hxname", hxname);
		res.put("token", token);
		res.put("tokenName", StpUtil.getTokenName());
		res.put("tokenValue", StpUtil.getTokenValue());
		res.put("result", contextBean);
		return res;
	}

	@ResponseBody
	@RequestMapping({ "/CALogin" })
	public Object calogin(@RequestBody Map<String, String> rqparams) {
		Map<String, Object> res = new HashMap<String, Object>();
		ContextBean contextBean = getContext();
		contextBean.setLocale("zh_CN");
		String serverURL = Configuration.getUIServerURL(null);
		contextBean.setUIServerURL(serverURL);
		String msg = "";
		String token = "";
		clearHttpClient();
		String sn = rqparams.get("sn");
		boolean success = false;
		try {
			SysLogin sysLogin = login.CAdoLogin(sn);
			HashMap<String, String> params = getSysParams(this.request, sysLogin);
			contextBean.initLoginContext(this.request, params);
			contextBean.setUsername((String) params.get("username"));
			contextBean.setIsAgent(false);
			contextBean.setIsNTLogin(false);
			contextBean.setLoginDate(p("loginDate"));
			contextBean.setIp(IPUtils.getRemoteAddr(this.request));
			StpUtil.login(contextBean.getPersonID());
			token = StpUtil.getTokenValue();
			redisCache.setCacheObject(token, contextBean);
			success = true;
			writeLoginLog.write(contextBean.getCurrentUserID(), (String) params.get("username"),
					IPUtils.getRemoteAddr(this.request), "", this.request);
		} catch (Exception e) {
			success = false;
			msg = e.getMessage();
			e.printStackTrace();
		}
		if (!success) {
			clearHttpClient();
			contextBean.initLogoutContext(this.request);
		}
		// renderData(Boolean.valueOf(success), "{\"msg\":\"" + r(msg) +
		// "\",\"token\":\"" + token + "\"}");
		res.put("code", HttpStatus.SUCCESS);
		res.put("state", success);
		res.put("message", r(msg));
		res.put("tokenName", StpUtil.getTokenName());
		res.put("tokenValue", StpUtil.getTokenValue());
		// res.put("result", contextBean);
		return res;
	}

	@ResponseBody
	@RequestMapping({ "/sCALogin" })
	public void scalogin() {
		ContextBean contextBean = getContext();
		contextBean.setLocale("zh_CN");
		String serverURL = Configuration.getUIServerURL(null);
		contextBean.setUIServerURL(serverURL);
		String msg = "";
		String token = "";
		clearHttpClient();
		String signm = p("signm");
		boolean success = false;
		try {
			SysLogin sysLogin = login.sCAdoLogin(signm);
			HashMap<String, String> params = getSysParams(this.request, sysLogin);
			contextBean.initLoginContext(this.request, params);
			contextBean.setUsername((String) params.get("username"));
			contextBean.setIsAgent(false);
			contextBean.setIsNTLogin(false);
			contextBean.setLoginDate(p("loginDate"));
			contextBean.setIp(IPUtils.getRemoteAddr(this.request));
			StpUtil.login(contextBean.getPersonID());
			token = StpUtil.getTokenValue();
			redisCache.setCacheObject(token, contextBean);
			success = true;
			writeLoginLog.write(contextBean.getCurrentUserID(), (String) params.get("username"),
					IPUtils.getRemoteAddr(this.request), "", this.request);
		} catch (Exception e) {
			success = false;
			msg = e.getMessage();
			e.printStackTrace();
		}
		if (!success) {
			clearHttpClient();
			contextBean.initLogoutContext(this.request);
		}
		renderData(Boolean.valueOf(success), "{\"msg\":\"" + r(msg) + "\",\"token\":\"" + token + "\"}");
	}

	@ResponseBody
	@RequestMapping("/logout")
	public void logout() throws IOException, DocumentException {
		ContextBean contextBean = getContext();
		Sys.printMsg("用户：" + contextBean.getPersonName() + " 退出系统.");
		contextBean.initLogoutContext(this.request);
		StpUtil.logout();
		try {
			redisCache.deleteObject(StpUtil.getTokenValue());
		} catch (Exception e) {
		}
		renderData(Boolean.valueOf(true));
	}

	@ResponseBody
	@RequestMapping("/MD5logout")
	public void MD5logout() throws IOException, DocumentException {
		ContextBean contextBean = getContext();
		Sys.printMsg("用户：" + contextBean.getPersonName() + " 退出系统.");
		contextBean.initLogoutContext(this.request);
		StpUtil.logout();
		try {
			redisCache.deleteObject(StpUtil.getTokenValue());
		} catch (Exception e) {
		}
		renderData(Boolean.valueOf(true));
	}

	@ResponseBody
	@RequestMapping("/check")
	public void check() throws Exception {
		ContextBean contextBean = getContext();
		renderData(contextBean.isLogin(), JSON.toJSONString(contextBean));
	}

	@ResponseBody
	@RequestMapping("/getAgents")
	public void getAgents() throws IOException, DocumentException, Exception {
		JSONObject json = new JSONObject();
		renderData(Boolean.valueOf(true), json.toString());
	}

	@ResponseBody
	@RequestMapping("/changePassword")
	public void changePassword() throws IOException, DocumentException {
		String username = p("username");
		String password = p("password");
		String new_password = p("new_password");
		try {
			username = URLDecoder.decode(username, "UTF-8");
			password = URLDecoder.decode(password, "UTF-8");
			new_password = URLDecoder.decode(new_password, "UTF-8");
		} catch (Exception localException) {
		}
		Boolean success = Boolean.valueOf(false);
		String msg = "";
		ContextBean contextBean = getContext();
		if (((username == null) || (username.equals(""))) && (contextBean.isLogin().booleanValue())) {
			username = contextBean.getPersonCode();
		}
		if ((username != null) && (!username.equals(""))) {
			try {
				Sys.printMsg(username + "修改密码，原密码:" + password + "新密码：" + new_password);
				saPerson.changePassword(username, password, new_password);
				msg = "修改成功！";
				success = Boolean.valueOf(true);
			} catch (Exception e) {
				success = Boolean.valueOf(false);
				msg = r("密码验证失败！");
			}
		}
		renderData(success, "{\"msg\":\"" + msg + "\"}");
	}

	@ResponseBody
	@RequestMapping("/initPortalInfo")
	public Object initPortalInfo() {
		ContextBean context = getContext();
		JSONObject json = new JSONObject();
		try {
			json.put("username", context.getUsername());
			json.put("orgFullName", context.getCurrentOgnFullName());
			json.put("personName", context.getCurrentPersonName());
			json.put("personid", context.getCurrentPersonID());
			json.put("personcode", context.getCurrentPersonCode());
			json.put("userCode", context.getCurrentUserCode());
			json.put("positionid", context.getCurrentPositionID());
			json.put("positioncode", context.getCurrentPositionCode());
			json.put("positionname", context.getCurrentPositionName());
			json.put("deptid", context.getCurrentDeptID());
			json.put("deptcode", context.getCurrentDeptCode());
			json.put("deptname", context.getCurrentDeptName());
			json.put("deptfid", context.getCurrentDeptFullID());
			json.put("deptfcode", context.getCurrentDeptFullCode());
			json.put("deptfname", context.getCurrentDeptFullName());
			json.put("orgid", context.getCurrentOrgID());
			json.put("orgcode", context.getCurrentOrgCode());
			json.put("orgname", context.getCurrentOrgName());
			json.put("orgfid", context.getCurrentOrgFullID());
			json.put("orgfcode", context.getCurrentOrgFullCode());
			json.put("orgfname", context.getCurrentOrgFullName());
			json.put("ognid", context.getCurrentOgnID());
			json.put("ogncode", context.getCurrentOgnCode());
			json.put("ognname", context.getCurrentOgnName());
			json.put("ognfid", context.getCurrentOgnFullID());
			json.put("ognfcode", context.getCurrentOgnFullCode());
			json.put("ognfname", context.getCurrentOgnFullName());
			json.put("personfid", context.getCurrentPersonFullID());
			json.put("personfcode", context.getCurrentPersonFullCode());
			json.put("personfname", context.getCurrentPersonFullName());
			json.put("businessid", context.getBusinessID());
			json.put("locale", context.getLocale());
			json.put("uiserverremoteurl", context.getUIServerURL(this.request, null, null));
		} catch (Exception e) {
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/PersonMembers")
	public void PersonMembers() {
		initPortalInfo();
	}

	@ResponseBody
	@RequestMapping("/getOnlineCount")
	public void getOnlineCount() {
		renderData(Boolean.valueOf(true), "{\"count\":" + onlineinfosvr.getCount() + "}");
	}

	@ResponseBody
	@RequestMapping("/getOnlineUserInfo")
	public Object getOnlineUserInfo() {
		JSONObject json = new JSONObject();
		json.put("data", onlineUtil.getOnlineList());
		json.put("state", true);
		return json;
	}

	@ResponseBody
	@RequestMapping("/getOnceFunc")
	public void getOnceFunc() throws Exception {
		Boolean b = getContext().isLogin();
		String s = "";
		if (b.booleanValue()) {
			String onceFunc = getContext().getOnceFunc();
			if ((onceFunc != null) && (!onceFunc.equals(""))) {
				JSONObject jsonOnceFunc = JSONObject.parseObject(onceFunc);
				if (jsonOnceFunc.containsKey("url")) {
					JSONObject json = new JSONObject();

					json.put("onceFunc", jsonOnceFunc.toString());
					s = json.toString();
				}
			}
		}
		renderData(b, s);
	}

	@ResponseBody
	@RequestMapping("/setLanguage")
	public void setLanguage() {
		String language = p("language");
		getContext().setLocale(language);
		renderData(Boolean.valueOf(true), "{\"language\":\"" + language + "\"}");
	}

	@ResponseBody
	@RequestMapping("/getLanguage")
	public void getLanguage() {
		String language = getContext().getLocale();
		renderData(Boolean.valueOf(true), "{\"language\":\"" + language + "\"}");
	}

	@ResponseBody
	@RequestMapping("/userInfo")
	public Object info() {
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("code", HttpStatus.SUCCESS);
		res.put("message", "");
		Map<String, Object> userInfo = new HashMap<String, Object>();
		ContextBean contextBean = getContext();
		userInfo.put("id", contextBean.getPersonID());
		userInfo.put("name", contextBean.getPersonName());
		userInfo.put("fullName", contextBean.getCurrentPersonFullName());
		userInfo.put("username", contextBean.getPersonCode());
		userInfo.put("avatar", "/avatar2.jpg");
		userInfo.put("status", 1);
		userInfo.put("telephone", "");
		userInfo.put("lastLoginIp", contextBean.getIp());
		userInfo.put("lastLoginTime", contextBean.getLoginDate());
		userInfo.put("creatorId", "PSM01");
		userInfo.put("createTime", new Date().getTime());
		userInfo.put("deleted", 0);
		userInfo.put("roleId", "admin");
		userInfo.put("role", "{}");
		res.put("result", userInfo);
		return res;
	}
}