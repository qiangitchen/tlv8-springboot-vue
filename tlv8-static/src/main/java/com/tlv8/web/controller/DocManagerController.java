package com.tlv8.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/docManage")
public class DocManagerController {

	@RequestMapping("/docSetting")
	public void docSetting(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/SA/doc/docSetting/mainActivity.html");
	}
	
	@RequestMapping("/docCenter")
	public void docCenter(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/SA/doc/docCenter/mainActivity.html");
	}
}
