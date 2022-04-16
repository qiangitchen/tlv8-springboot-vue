package com.tlv8.system.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.system.service.SysLoginService;

@SuppressWarnings({ "rawtypes", "unchecked" })
public class Login {

	@Autowired
	SysLoginService sysLoginService;

	private String message;

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessage() {
		return this.message;
	}

	public HashMap<String, String> doLogin(String username, String password, String ip, String logintype)
			throws Exception {
		HashMap<String, String> m = new HashMap<String, String>();
		try {
			Map<String, String> rs = sysLoginService.getInfoByCode(username);
			if (!rs.isEmpty()) {
				m.put("username", rs.get("USERNAME"));
				m.put("personID", rs.get("PERSONID"));
				m.put("personName", rs.get("PERSONNAME"));
				m.put("personCode", rs.get("PERSONCODE"));
				m.put("orgID", rs.get("ORGID"));
				m.put("orgName", rs.get("ORGNAME"));
				m.put("orgPath", rs.get("ORGPATH"));
				m.put("agentPersonID", rs.get("AGENTPERSONID"));
				m.put("agentPersonName", rs.get("AGENTPERSONNAME"));
				m.put("agentPersonCode", rs.get("AGENTPERSONCODE"));
				m.put("agentOrgID", rs.get("AGENTORGID"));
				m.put("agentOrgName", rs.get("AGENTORGNAME"));
				m.put("agentOrgPath", rs.get("AGENTORGPATH"));
				m.put("mobilephone", rs.get("SMOBILEPHONE"));
				if (!password.equals(rs.get("SPASSWORD"))) {
					throw new Exception("用户名或密码错误!");
				}
				if ("-1".equals(rs.get("SVALIDSTATE"))) {
					throw new Exception("用户已被删除!");
				} else if (!"1".equals(rs.get("SVALIDSTATE"))) {
					throw new Exception("您的账号暂时无法登陆，请联系管理员。");
				}
			} else {
				throw new Exception("用户名或密码错误!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}

	public HashMap<String, String> MD5doLogin(String username, String password) throws Exception {
		HashMap m = new HashMap();
		try {
			Map<String, String> rs = sysLoginService.getInfoByCode(username);
			if (!rs.isEmpty()) {
				m.put("username", rs.get("USERNAME"));
				m.put("personID", rs.get("PERSONID"));
				m.put("personName", rs.get("PERSONNAME"));
				m.put("personCode", rs.get("PERSONCODE"));
				m.put("orgID", rs.get("ORGID"));
				m.put("orgName", rs.get("ORGNAME"));
				m.put("orgPath", rs.get("ORGPATH"));
				m.put("agentPersonID", rs.get("AGENTPERSONID"));
				m.put("agentPersonName", rs.get("AGENTPERSONNAME"));
				m.put("agentPersonCode", rs.get("AGENTPERSONCODE"));
				m.put("agentOrgID", rs.get("AGENTORGID"));
				m.put("agentOrgName", rs.get("AGENTORGNAME"));
				m.put("agentOrgPath", rs.get("AGENTORGPATH"));
				m.put("mobilephone", rs.get("SMOBILEPHONE"));
				if (!password.equals(rs.get("SPASSWORD"))) {
					throw new Exception("用户名或密码错误!");
				}
				if ("-1".equals(rs.get("SVALIDSTATE"))) {
					throw new Exception("用户已被删除!");
				} else if (!"1".equals(rs.get("SVALIDSTATE"))) {
					throw new Exception("您的账号暂时无法登陆，请联系管理员。");
				}
			} else {
				throw new Exception("用户名或密码错误!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}

	public HashMap<String, String> CAdoLogin(String sn) throws Exception {
		HashMap m = new HashMap();
		try {
			Map<String, String> rs = sysLoginService.getInfoByCASN(sn);
			if (!rs.isEmpty()) {
				m.put("username", rs.get("USERNAME"));
				m.put("personID", rs.get("PERSONID"));
				m.put("personName", rs.get("PERSONNAME"));
				m.put("personCode", rs.get("PERSONCODE"));
				m.put("orgID", rs.get("ORGID"));
				m.put("orgName", rs.get("ORGNAME"));
				m.put("orgPath", rs.get("ORGPATH"));
				m.put("agentPersonID", rs.get("AGENTPERSONID"));
				m.put("agentPersonName", rs.get("AGENTPERSONNAME"));
				m.put("agentPersonCode", rs.get("AGENTPERSONCODE"));
				m.put("agentOrgID", rs.get("AGENTORGID"));
				m.put("agentOrgName", rs.get("AGENTORGNAME"));
				m.put("agentOrgPath", rs.get("AGENTORGPATH"));
				m.put("mobilephone", rs.get("SMOBILEPHONE"));
				if ("-1".equals(rs.get("SVALIDSTATE"))) {
					throw new Exception("用户已被删除!");
				} else if (!"1".equals(rs.get("SVALIDSTATE"))) {
					throw new Exception("您的账号暂时无法登陆，请联系管理员。");
				}
			} else {
				throw new Exception("证书无效或未配置!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}

	public HashMap<String, String> sCAdoLogin(String signm) throws Exception {
		HashMap m = new HashMap();
		try {
			Map<String, String> rs = sysLoginService.getInfoBySignm(signm);
			if (!rs.isEmpty()) {
				m.put("username", rs.get("USERNAME"));
				m.put("personID", rs.get("PERSONID"));
				m.put("personName", rs.get("PERSONNAME"));
				m.put("personCode", rs.get("PERSONCODE"));
				m.put("orgID", rs.get("ORGID"));
				m.put("orgName", rs.get("ORGNAME"));
				m.put("orgPath", rs.get("ORGPATH"));
				m.put("agentPersonID", rs.get("AGENTPERSONID"));
				m.put("agentPersonName", rs.get("AGENTPERSONNAME"));
				m.put("agentPersonCode", rs.get("AGENTPERSONCODE"));
				m.put("agentOrgID", rs.get("AGENTORGID"));
				m.put("agentOrgName", rs.get("AGENTORGNAME"));
				m.put("agentOrgPath", rs.get("AGENTORGPATH"));
				m.put("mobilephone", rs.get("SMOBILEPHONE"));
				if ("-1".equals(rs.get("SVALIDSTATE"))) {
					throw new Exception("用户已被删除!");
				} else if (!"1".equals(rs.get("SVALIDSTATE"))) {
					throw new Exception("您的账号暂时无法登陆，请联系管理员。");
				}
			} else {
				throw new Exception("证书无效或未配置!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
}