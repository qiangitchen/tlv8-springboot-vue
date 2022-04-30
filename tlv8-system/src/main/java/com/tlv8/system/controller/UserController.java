package com.tlv8.system.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Node;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.base.Sys;
import com.tlv8.common.constant.HttpStatus;
import com.tlv8.system.action.Login;
import com.tlv8.system.action.SAPerson;
import com.tlv8.system.action.WriteLoginLog;
import com.tlv8.system.base.BaseController;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.help.Configuration;
import com.tlv8.system.help.OnlineHelper;
import com.tlv8.system.help.SessionHelper;
import com.tlv8.system.service.ISaOnlineinfoService;

/**
 * 系统用户登录相关
 * 
 * @author chenqian
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/system/User")
@SuppressWarnings({ "rawtypes", "unchecked" })
public class UserController extends BaseController {

	@Autowired
	private ISaOnlineinfoService onlineinfosvr;

	@Autowired
	private Login login;

	@Autowired
	private WriteLoginLog writeLoginLog;

	@Autowired
	private SAPerson saPerson;

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(@RequestBody Map<String, String> rqparams) throws DocumentException, IOException {
		String username = rqparams.get("username");
		String password = rqparams.get("password");
		String loginDate = rqparams.get("loginDate");
		String language = rqparams.get("language");
		String logintype = (rqparams.get("logintype") != null ? rqparams.get("logintype") : "mobile");

		String captcha = rqparams.get("captcha");
		String agent = rqparams.get("agent");
		String onceFunc = rqparams.get("onceFunc");
		String mode = rqparams.get("mode");
		String ip = rqparams.get("ip");

		String msg = "";

		boolean isAgent = ((agent != null) && (!agent.equals("")));
		boolean isNTLogin = ((mode != null) && (mode.equals("nt")));
		if ((isNTLogin) && ((ip == null) || (ip.equals("")))) {
			Object ipAttribute = a("ip");
			ip = (ipAttribute != null ? ipAttribute.toString() : getRemoteAddr(this.request));
		}
		if ((ip == null) || ("".equals(ip))) {
			ip = getRemoteAddr(this.request);
		}
		if (captcha == null) {
			captcha = "";
		}
		try {
			Configuration.processConfiguration();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if ((!"no_captcha".equals(captcha)) && (Configuration.getCaptchaEnabled().booleanValue())) {
			if (captcha == "") {
				msg = "system.UserController.login.3:请输入验证码!";
				renderData(Boolean.valueOf(false), "{\"msg\":\"" + r(msg) + "\"}");
				return;
			}
			if (!captcha.equals(SessionHelper.getAttrString(this.request, "SESSION_SECURITY_CODE"))) {
				msg = "system.UserController.login.4:验证码错误！";
				renderData(Boolean.valueOf(false), "{\"msg\":\"" + r(msg) + "\"}");
				return;
			}
		}
		if ((loginDate == null) || (loginDate.equals(""))) {
			loginDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		}
		getContext().setLocale(this.request, language);
		String serverURL = Configuration.getUIServerURL(null);
		getContext().setUIServerURL(serverURL);

		clearHttpClient();

		boolean success = false;
		try {
			HashMap<String, String> params = login.doLogin(username, password, ip, logintype);
			getSysParams(this.request, params);
			getContext().initLoginContext(this.request, params);
			getContext().setOnceFunc(onceFunc);
			getContext().setUsername(username);
			getContext().setPassword(password);
			getContext().setAgent(agent);
			getContext().setIsAgent(isAgent);
			getContext().setIsNTLogin(isNTLogin);
			getContext().setLoginDate(loginDate);
			getContext().setIp(ip);
			OnlineHelper.refresh(this.request, this.response);
			success = true;
			writeLoginLog.write(getContext().getCurrentUserID(), username, getRemoteAddr(this.request), password,
					this.request);
			String signm = p("signm");
			if ((signm != null) && (!"".equals(signm)))
				saPerson.addSign(getContext().getCurrentPersonID(), signm);
		} catch (Exception e) {
			success = false;
			msg = e.getMessage();
			e.printStackTrace();
		}
		if (!success) {
			clearHttpClient();
			getContext().initLogoutContext(this.request);
		}
		System.out.println("sessionid:" + getContext().getSessionID());
		renderData(Boolean.valueOf(success), "{\"msg\":\"" + r(msg) + "\"}");
	}

	@ResponseBody
	@RequestMapping(value = "/MD5login", method = RequestMethod.POST)
	public Object MD5login(@RequestBody Map<String, String> rqparams)
			throws DocumentException, IOException {
		Map<String, Object> res = new HashMap<String, Object>();
		String username = rqparams.get("username");
		String password = rqparams.get("password");
		String loginDate = rqparams.get("loginDate");
		String language = rqparams.get("language");

		String captcha = rqparams.get("captcha");
		String agent = rqparams.get("agent");
		String onceFunc = rqparams.get("onceFunc");
		String mode = rqparams.get("mode");
		String ip = rqparams.get("ip");
		String mobilestatus = "0";
		// String title = "jpolite.res.system.UserController.login.0";
		String msg = "";
		String hxname = "";
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ").format(new Date()) + " " + username + ":登录系统");
		boolean isAgent = ((agent != null) && (!agent.equals("")));
		boolean isNTLogin = ((mode != null) && (mode.equals("nt")));
		clearHttpClient();
		boolean success = false;
		try {
			Configuration.processConfiguration();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!"no_captcha".equals(captcha) && captcha != null) {
			if (captcha == "") {
				msg = "请输入验证码!";
				res.put("state", false);
				res.put("msg", r(msg));
				return res;
			}
			if (!captcha.equals(SessionHelper.getAttrString(this.request, "SESSION_SECURITY_CODE"))) {
				msg = "验证码错误！";
				res.put("state", false);
				res.put("msg", r(msg));
				return res;
			}
		}
		if ((isNTLogin) && ((ip == null) || (ip.equals("")))) {
			Object ipAttribute = a("ip");
			ip = (ipAttribute != null ? ipAttribute.toString() : getRemoteAddr(this.request));
		}
		if ((ip == null) || ("".equals(ip))) {
			ip = getRemoteAddr(this.request);
		}
		if ((loginDate == null) || (loginDate.equals(""))) {
			loginDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		}
		getContext().setLocale(this.request, language);
		String serverURL = Configuration.getUIServerURL(null);
		getContext().setUIServerURL(serverURL);

		try {
			HashMap<String, String> params = login.MD5doLogin(username, password);
			getSysParams(this.request, params);
			getContext().initLoginContext(this.request, params);
			getContext().setOnceFunc(onceFunc);
			getContext().setUsername(username);
			getContext().setPassword(password);
			getContext().setAgent(agent);
			getContext().setIsAgent(isAgent);
			getContext().setIsNTLogin(isNTLogin);
			getContext().setLoginDate(loginDate);
			getContext().setIp(ip);
			OnlineHelper.refresh(this.request, this.response);
			success = true;
			String signm = p("signm");
			if ((signm != null) && (!"".equals(signm)))
				saPerson.addSign(getContext().getCurrentPersonID(), signm);
		} catch (Exception e) {
			success = false;
			msg = e.getMessage();
			System.out.println(e.getMessage());
		}
		if (!success) {
			clearHttpClient();
			getContext().initLogoutContext(this.request);
		}
		System.out.println("sessionid:" + getContext().getSessionID());
		res.put("code", HttpStatus.SUCCESS);
		res.put("message", r(msg));
		res.put("bsessionID", getContext().getSessionID());
		res.put("mobilestatus", mobilestatus);
		res.put("hxname", hxname);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("token", getContext().getSessionID());
		res.put("result", result);
		return res;
	}

	@ResponseBody
	@RequestMapping({ "/sCALogin" })
	public void scalogin() {
		getContext().setLocale(this.request, "zh_CN");
		String serverURL = Configuration.getUIServerURL(null);
		getContext().setUIServerURL(serverURL);
		String msg = "";
		clearHttpClient();
		String signm = p("signm");
		boolean success = false;
		try {
			HashMap params = login.sCAdoLogin(signm);
			getSysParams(this.request, params);
			getContext().initLoginContext(this.request, params);

			getContext().setUsername((String) params.get("username"));

			getContext().setIsAgent(false);
			getContext().setIsNTLogin(false);
			getContext().setLoginDate(p("loginDate"));
			getContext().setIp(getRemoteAddr(this.request));
			OnlineHelper.refresh(this.request, this.response);
			success = true;
			writeLoginLog.write(getContext().getCurrentUserID(), (String) params.get("username"),
					getRemoteAddr(this.request), "", this.request);
		} catch (Exception e) {
			success = false;
			msg = e.getMessage();
			e.printStackTrace();
		}
		if (!success) {
			clearHttpClient();
			getContext().initLogoutContext(this.request);
		}
		System.out.println("sessionid:" + getContext().getSessionID());
		renderData(Boolean.valueOf(success), "{\"msg\":\"" + r(msg) + "\"}");
	}

	@ResponseBody
	@RequestMapping("/Sessionlogin")
	public void Sessionlogin() throws DocumentException, IOException {
		String session = p("sessionid");
		SessionHelper.setContext(this.request, getContext(session));
		renderData(Boolean.valueOf(true),
				"{\"msg\":\"" + r("") + "\",bsessionID:\"" + getContext().getSessionID() + "\"}");
	}

	@ResponseBody
	@RequestMapping("/linkToX5")
	public void linkToX5() {
		Sys.printMsg("连接X5... ...");
		try {
			getBusinessServerSession(getContext().getUsername(), getContext().getAgent(), getContext().getPassword(),
					getContext().getIsAgent(), getContext().getIsNTLogin(), getContext().getLoginDate(),
					getContext().getIp());
			Sys.printMsg("连接X5成功.");
		} catch (Exception e) {
			Sys.packErrMsg("连接X5异常");
		}
		renderData(Boolean.valueOf(true), "{\"msg\":\"success\"}");
	}

	@ResponseBody
	@RequestMapping("/setBusinessID")
	public void setBusinessID() {
		String bsessionID = p("bsessionid");
		Sys.printMsg("连接X5... ..." + bsessionID);
		this.request.getSession().setAttribute("jpolite_key_ses_bsessionid", bsessionID);
		renderData(Boolean.valueOf(true), "{\"msg\":\"success\"}");
	}

	@ResponseBody
	@RequestMapping("/logout")
	public void logout() throws IOException, DocumentException {
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ").format(new Date()) + " 用户："
				+ getContext().getPersonName() + " 退出系统,sessionid:" + getContext().getSessionID() + ".");
		if ((getContext().getSessionID() != null) && (!getContext().getSessionID().equals(""))) {
			OnlineHelper.reMove(getContext().getSessionID());
			onlineinfosvr.deleteDataBySessionID(getContext().getSessionID());
			try {
				if (getContext().hasBusinessSession().booleanValue()) {
					unregisterBusinessSession();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		getContext().initLogoutContext(this.request);
		renderData(Boolean.valueOf(true));
	}

	@ResponseBody
	@RequestMapping("/MD5logout")
	public void MD5logout() throws IOException, DocumentException {
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ").format(new Date()) + " 用户："
				+ getContext().getPersonName() + " 退出系统,sessionid:" + getContext().getSessionID() + ".");
		if ((getContext().getSessionID() != null) && (!getContext().getSessionID().equals(""))) {
			OnlineHelper.reMove(getContext().getSessionID());
			onlineinfosvr.deleteDataBySessionID(getContext().getSessionID());
			try {
				if (getContext().hasBusinessSession().booleanValue()) {
					unregisterBusinessSession();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		getContext().initLogoutContext(this.request);
		renderData(Boolean.valueOf(true));
	}

	@ResponseBody
	@RequestMapping("/check")
	public void check() throws JSONException {
		renderData(getContext().isLogin(), getContext().toJSONString());
	}

	@ResponseBody
	@RequestMapping("/getAgents")
	public void getAgents() throws IOException, DocumentException, JSONException {
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
		if (((username == null) || (username.equals(""))) && (getContext().isLogin().booleanValue())) {
			username = getContext().getPersonCode();
		}
		if ((username != null) && (!username.equals(""))) {
			try {
				System.out.println(username + "修改密码，原密码:" + password + "新密码：" + new_password);
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
		String sessionid = p("seesionid");
		if ((sessionid != null) && (!sessionid.equals("")) && (!sessionid.equals("undefined"))) {
			context = getContext(sessionid);
			setContext(context);
		}
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
			json.put("locale", context.getLocale(request));
			json.put("uiserverremoteurl", context.getUIServerURL(this.request, null, null));
		} catch (Exception e) {
		}
		return json;
	}

	@ResponseBody
	@RequestMapping("/getPrincipalList")
	public void getPrincipalList() {
//		renderData(Agents.getPrincipalList(getContext().getCurrentPersonID()));
	}

	@ResponseBody
	@RequestMapping("/getPrincipalInfo")
	public void getPrincipalInfo() {
		String principalID = p("principalid");
		if (principalID != null) {
//			renderData(Agents.getPrincipalInfo(principalID, getContext()));
		} else {
			renderData(Boolean.valueOf(true), "{\"msg\":\"success\"}");
		}
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
	public Object getOnlineUserInfo() throws JSONException {
		Map m = OnlineHelper.getOnlineUserMap();
		Iterator it = m.keySet().iterator();
		List jsonList = new ArrayList();
		while (it.hasNext()) {
			Map jsonMap = new HashMap();
			String sessionID = (String) it.next();
			String username = ((ContextBean) m.get(sessionID)).getPersonName();
			String userfullid = ((ContextBean) m.get(sessionID)).getCurrentPersonFullID();
			String userfullname = ((ContextBean) m.get(sessionID)).getCurrentPersonFullName();
			String userid = ((ContextBean) m.get(sessionID)).getPersonID();
			String loginIP = ((ContextBean) m.get(sessionID)).getIp();
			String loginDate = ((ContextBean) m.get(sessionID)).getLoginDate();
			jsonMap.put("rowid", sessionID);
			jsonMap.put("userid", userid);
			jsonMap.put("username", username);
			jsonMap.put("userfullid", userfullid);
			jsonMap.put("userfullname", userfullname);
			jsonMap.put("loginIP", loginIP);
			jsonMap.put("loginDate", loginDate);
			jsonMap.put("sessionID", sessionID);
			jsonList.add(jsonMap);
		}
		JSONObject json = new JSONObject();
		json.put("state",true);
		json.put("data", jsonList);
		return json;
	}

	@ResponseBody
	@RequestMapping("/getOnceFunc")
	public void getOnceFunc() throws JSONException {
		Boolean b = getContext().isLogin();
		String s = "";
		if (b.booleanValue()) {
			String onceFunc = getContext().getOnceFunc();
			if ((onceFunc != null) && (!onceFunc.equals(""))) {
				JSONObject jsonOnceFunc = new JSONObject(onceFunc);
				if (jsonOnceFunc.has("url")) {
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
		getContext().setLocale(this.request, language);
		renderData(Boolean.valueOf(true), "{\"language\":\"" + language + "\"}");
	}

	@ResponseBody
	@RequestMapping("/getLanguage")
	public void getLanguage() {
		String language = getContext().getLocale(this.request);
		renderData(Boolean.valueOf(true), "{\"language\":\"" + language + "\"}");
	}

	public void getBusinessServerSession(String username, String agent, String password, boolean isAgent,
			boolean isNTLogin, String loginDate, String ip) throws IOException, DocumentException {
		if (getContext().hasBusinessSession().booleanValue()) {
			unregisterBusinessSession();
		}
		clearHttpClient();
		if (!getContext().hasBusinessSession().booleanValue()) {
			registerBusinessSession();
		}
		if (getContext().hasBusinessSession().booleanValue()) {
			Hashtable<String, String> attributes = new Hashtable();
			Hashtable<String, String> parameters = new Hashtable();

			attributes.put("process", "/SA/OPM/system/systemProcess");
			if (isAgent) {
				attributes.put("name", "agentLoginAction");
				parameters.put("userName", username);
				parameters.put("personName", agent);
				parameters.put("pwd", password);
			} else if (isNTLogin) {
				attributes.put("name", "ntLoginAction");
				attributes.put("ip", ip);
				attributes.put("password", password);
				parameters.put("name", username);
			} else {
				attributes.put("name", "loginAction");
				parameters.put("name", username);
				parameters.put("pwd", password);
			}
			parameters.put("loginDate#date", loginDate);
			parameters.put("lang", getContext().getLocale(this.request));

			String act = genAction(attributes, parameters);
			String actionURL = isNTLogin
					? getContext().getBusinessServerURL(this.request, "ntloginaction", "/ntLoginAction")
					: getContext().getBusinessServerURL(this.request, "action", "/business-action");

			PostMethod post = new PostMethod(actionURL + "?language=" + getContext().getLocale(this.request));
			try {
				post.setRequestEntity(new StringRequestEntity(act, "text/html", "UTF-8"));
				Document resultDoc = executeMethodAsDocument(post);
				if (resultDoc != null) {
					Node node_flag = resultDoc.getRootElement().selectSingleNode("data/items/item[1]");
					if ((node_flag != null) && (node_flag.getText().trim().equalsIgnoreCase("true"))) {
						Node node_personID = resultDoc.getRootElement().selectSingleNode("data/items/item[2]");
						Node node_personName = resultDoc.getRootElement().selectSingleNode("data/items/item[3]");
						Node node_orgID = resultDoc.getRootElement().selectSingleNode("data/items/item[4]");
						Node node_orgName = resultDoc.getRootElement().selectSingleNode("data/items/item[5]");
						Node node_orgPath = resultDoc.getRootElement().selectSingleNode("data/items/item[6]");
						Node node_personCode = isAgent ? null
								: resultDoc.getRootElement().selectSingleNode("data/items/item[7]");

						Node node_client_personID = isAgent
								? resultDoc.getRootElement().selectSingleNode("data/items/item[7]")
								: null;
						Node node_client_personName = isAgent
								? resultDoc.getRootElement().selectSingleNode("data/items/item[8]")
								: null;
						Node node_client_personCode = isAgent
								? resultDoc.getRootElement().selectSingleNode("data/items/item[9]")
								: null;

						String personID =

								node_personID != null ? node_personID.getText().trim()
										: isAgent ? ""
												: node_client_personID != null ? node_client_personID.getText().trim()
														: "";
						String personName =

								node_personName != null ? node_personName.getText().trim()
										: isAgent ? ""
												: node_client_personName != null
														? node_client_personName.getText().trim()
														: "";
						String personCode =

								node_personCode != null ? node_personCode.getText().trim()
										: isAgent ? ""
												: node_client_personCode != null
														? node_client_personCode.getText().trim()
														: "";
						String orgID = node_orgID != null ? node_orgID.getText().trim() : "";
						String orgName = node_orgName != null ? node_orgName.getText().trim() : "";
						String orgPath = node_orgPath != null ? node_orgPath.getText().trim() : "";

						String agentPersonID = isAgent ? ""
								: node_personID != null ? node_personID.getText().trim() : "";
						String agentPersonName = isAgent ? ""
								: node_personName != null ? node_personName.getText().trim() : "";
						String agentPersonCode = "";
						String agentOrgID = isAgent ? "" : node_orgID != null ? node_orgID.getText().trim() : "";
						String agentOrgName = isAgent ? "" : node_orgName != null ? node_orgName.getText().trim() : "";
						String agentOrgPath = isAgent ? "" : node_orgPath != null ? node_orgPath.getText().trim() : "";

						HashMap<String, String> params = new HashMap();
						params.put("username", username);
						params.put("personID", personID);
						params.put("personName", personName);
						params.put("personCode", personCode);
						params.put("orgID", orgID);
						params.put("orgName", orgName);
						params.put("orgPath", orgPath);
						params.put("agentPersonID", agentPersonID);
						params.put("agentPersonName", agentPersonName);
						params.put("agentPersonCode", agentPersonCode);
						params.put("agentOrgID", agentOrgID);
						params.put("agentOrgName", agentOrgName);
						params.put("agentOrgPath", agentOrgPath);

						getSysParams(this.request, params);
					}
				}
			} catch (Exception localException) {
			} finally {
				post.releaseConnection();
			}
		}
	}

	@ResponseBody
	@RequestMapping("/userInfo")
	public Object info() {
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("code", HttpStatus.SUCCESS);
		res.put("message", "");
		Map<String,Object> userInfo = new HashMap<String, Object>();
		userInfo.put("id", getContext().getPersonID());
		userInfo.put("name", getContext().getPersonName());
		userInfo.put("fullName", getContext().getCurrentPersonFullName());
		userInfo.put("username", getContext().getPersonCode());
		userInfo.put("avatar", "/avatar2.jpg");
		userInfo.put("status", 1);
		userInfo.put("telephone","");
		userInfo.put("lastLoginIp", getContext().getIp());
		userInfo.put("lastLoginTime", getContext().getLoginDate());
		userInfo.put("creatorId", "PSM01");
		userInfo.put("createTime", new Date().getTime());
		userInfo.put("deleted", 0);
		userInfo.put("roleId", "admin");
		userInfo.put("role", "{}");
		res.put("result", userInfo);
		return res;
	}
}