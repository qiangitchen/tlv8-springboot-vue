package com.tlv8.web.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.base.Sys;
import com.tlv8.common.redis.RedisCache;
import com.tlv8.common.utils.IPUtils;
import com.tlv8.system.action.Login;
import com.tlv8.system.action.WriteLoginLog;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.controller.UserController;
import com.tlv8.system.help.Configuration;
import com.tlv8.system.online.InitOnlineInfoAction;
import com.tlv8.system.pojo.SysLogin;

import cn.dev33.satoken.stp.StpUtil;

@Controller
@RequestMapping("/dev")
public class DevController {
	@Autowired
	private UserController userController;
	@Autowired
	protected RedisCache redisCache;
	@Autowired
	private Login login;
	@Autowired
	private InitOnlineInfoAction initOnline;
	@Autowired
	private WriteLoginLog writeLoginLog;

	@ResponseBody
	@RequestMapping("/devLogin")
	public void devLogin(HttpServletRequest request, String username, String password, HttpServletResponse response)
			throws IOException {
		ContextBean contextBean = new ContextBean();
		String serverURL = Configuration.getUIServerURL(null);
		contextBean.setUIServerURL(serverURL);
		String token = "";
		boolean success;
		try {
			SysLogin sysLogin = login.MD5doLogin(username, password);
			HashMap<String, String> params = userController.getSysParams(request, sysLogin);
			contextBean.initLoginContext(request, params);
			contextBean.setUsername(username);
			contextBean.setPassword(password);
			StpUtil.login(contextBean.getPersonID());
			token = StpUtil.getTokenValue();
			redisCache.setCacheObject(token, contextBean);
			success = true;
			initOnline.execute(contextBean, token);
			writeLoginLog.write(contextBean.getCurrentUserID(), username, IPUtils.getRemoteAddr(request), password,
					request);
		} catch (Exception e) {
			success = false;
			Sys.printErr(e.getMessage());
		}
		if (!success) {
			userController.clearHttpClient();
			contextBean.initLogoutContext(request);
			response.sendRedirect("/portal/login.html");
		} else {
			response.sendRedirect("/portal/index.html");
		}
	}
}
