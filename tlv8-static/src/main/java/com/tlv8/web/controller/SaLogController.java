package com.tlv8.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/SA/log")
public class SaLogController {

	@RequestMapping("/sysLog")
	public void sysLog(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/SA/system/log/mainActivity.html");
	}
}
