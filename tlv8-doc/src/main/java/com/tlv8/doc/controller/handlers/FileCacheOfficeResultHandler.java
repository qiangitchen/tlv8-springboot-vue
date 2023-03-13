package com.tlv8.doc.controller.handlers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tlv8.doc.controller.impl.AbstractRequestHandler;
import com.tlv8.doc.generator.service.DocService;

@Controller
@RequestMapping("/DocServer/repository")
public class FileCacheOfficeResultHandler extends AbstractRequestHandler {
	@Autowired
	DocService docService;

	@Override
	public String getPathPattern() {
		return "/resultInfo/*";
	}

	@Override
	public void initHttpHeader(HttpServletResponse paramHttpServletResponse) {
		paramHttpServletResponse.setCharacterEncoding("utf-8");
	}

	@RequestMapping("/resultInfo/*")
	public void handleRequest(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
			throws Exception {
		Map<String, String> localparam = getParams(paramHttpServletRequest);
		String Field = localparam.get("1");
		String Text = docService.getCustomField(Field);
		paramHttpServletResponse.setContentType("application/json;charset=UTF-8");
		ServletOutputStream localServletOutputStream = null;
		try {
			localServletOutputStream = paramHttpServletResponse.getOutputStream();
			localServletOutputStream.write(Text.getBytes());
		} catch (Exception localException) {
			localException.printStackTrace();
		}
	}

	private Map<String, String> getParams(HttpServletRequest request) {
		Map<String, String> rmap = new HashMap<String, String>();
		String pathinfo = request.getPathInfo();
		pathinfo = pathinfo.replace("/repository/resultInfo/", "");
		if (pathinfo.indexOf("?") > 0) {
			pathinfo = pathinfo.substring(0, pathinfo.indexOf("?"));
		}
		rmap.put("1", pathinfo.split("/")[0]);
		Map<String, String[]> pmap = request.getParameterMap();
		for (String k : pmap.keySet()) {
			rmap.put(k, pmap.get(k)[0]);
		}
		return rmap;
	}

}
