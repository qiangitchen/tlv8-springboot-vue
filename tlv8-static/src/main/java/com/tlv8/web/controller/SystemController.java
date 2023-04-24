package com.tlv8.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/system")
public class SystemController {

	@RequestMapping("/sysMenu")
	public void sysMenu(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/flw/dwr/vml-dwr-editer.html");
	}

}
