package com.tlv8.doc.controller.svlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/DocServer")
public class SWFServlet {

	@ResponseBody
	@RequestMapping("/crossdomain.xml")
	public void service(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
			throws ServletException, IOException {
		paramHttpServletResponse.setContentType("text/xml");
		ServletOutputStream localServletOutputStream = paramHttpServletResponse.getOutputStream();
		String str = "<?xml version=\"1.0\"?><cross-domain-policy>\t<allow-access-from domain=\"*\" />\t<allow-http-request-headers-from domain=\"*\" headers=\"Authorization\" /></cross-domain-policy>";
		localServletOutputStream.write(str.getBytes());
	}
}
