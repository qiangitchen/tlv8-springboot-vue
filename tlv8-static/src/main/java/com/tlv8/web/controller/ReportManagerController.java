package com.tlv8.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 报表管理
 * 
 * @author 陈乾
 *
 */
@Controller
@RequestMapping("/reportManager")
public class ReportManagerController {

	@RequestMapping("/ureportDesigner")
	public void docSetting(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/ureport/designer");
	}
}
