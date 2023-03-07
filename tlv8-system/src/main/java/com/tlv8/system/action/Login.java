package com.tlv8.system.action;

import com.tlv8.system.pojo.SysLogin;
import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.system.service.ISysLoginService;

public class Login {

	@Autowired
	ISysLoginService iSysLoginService;

	private String message;

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessage() {
		return this.message;
	}

	public SysLogin doLogin(String username, String password, String ip, String logintype) throws Exception {
		SysLogin sysLogin = iSysLoginService.getInfoByCode(username, username, username);
		if (sysLogin != null) {
			if (!password.equalsIgnoreCase(sysLogin.getSpassword())) {
				throw new Exception("用户名或密码错误!");
			}
			if ("-1".equals(sysLogin.getSvalidstate())) {
				throw new Exception("用户已被删除!");
			} else if (!"1".equals(sysLogin.getSvalidstate())) {
				throw new Exception("您的账号暂时无法登陆，请联系管理员。");
			}
		} else {
			throw new Exception("用户名或密码错误!");
		}
		return sysLogin;
	}

	public SysLogin MD5doLogin(String username, String password) throws Exception {
		SysLogin sysLogin = iSysLoginService.getInfoByCode(username, username, username);
		if (sysLogin != null) {
			if (!password.equalsIgnoreCase(sysLogin.getSpassword())) {
				throw new Exception("用户名或密码错误!");
			}
			if ("-1".equals(sysLogin.getSvalidstate())) {
				throw new Exception("用户已被删除!");
			} else if (!"1".equals(sysLogin.getSvalidstate())) {
				throw new Exception("您的账号暂时无法登陆，请联系管理员。");
			}
		} else {
			throw new Exception("用户名或密码错误!");
		}
		return sysLogin;
	}

	public SysLogin CAdoLogin(String sn) throws Exception {
		SysLogin sysLogin = iSysLoginService.getInfoByCASN(sn);
		if (sysLogin != null) {
			if ("-1".equals(sysLogin.getSvalidstate())) {
				throw new Exception("用户已被删除!");
			} else if (!"1".equals(sysLogin.getSvalidstate())) {
				throw new Exception("您的账号暂时无法登陆，请联系管理员。");
			}
		} else {
			throw new Exception("证书无效或未配置!");
		}
		return sysLogin;
	}

	public SysLogin sCAdoLogin(String signm) throws Exception {
		SysLogin sysLogin = iSysLoginService.getInfoBySignm(signm);
		if (sysLogin != null) {
			if ("-1".equals(sysLogin.getSvalidstate())) {
				throw new Exception("用户已被删除!");
			} else if (!"1".equals(sysLogin.getSvalidstate())) {
				throw new Exception("您的账号暂时无法登陆，请联系管理员。");
			}
		} else {
			throw new Exception("证书无效或未配置!");
		}
		return sysLogin;
	}
}