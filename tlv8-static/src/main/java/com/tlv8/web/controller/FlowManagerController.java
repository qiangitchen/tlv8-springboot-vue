package com.tlv8.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 流程管理
 * 
 * @author 陈乾
 *
 */
@Controller
@RequestMapping("/flowManager")
public class FlowManagerController {

	@RequestMapping("/flowDesign")
	public void flowDesign(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/flw/dwr/vml-dwr-editer.html");
	}

}
