package com.tlv8.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;

@Controller
public class IndexController {

	@RequestMapping("/")
	public void index(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ContextBean contextbean = ContextUtils.getContext();
		if (contextbean != null && contextbean.isLogin()) {
			response.sendRedirect("portal/login.html");
		}else {
			response.sendRedirect("portal/index.html");
		}
	}

}
