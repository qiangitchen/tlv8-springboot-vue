package com.tlv8.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/base")
public class AQBaseController {

	/**
	 * 业务字典
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/dictManage")
	public void dictManage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/AQ/base/dictionary/mainActivity.html");
	}

}
