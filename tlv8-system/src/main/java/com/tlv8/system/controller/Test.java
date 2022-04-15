package com.tlv8.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.system.service.ISaLogService;

@Controller
@RequestMapping("/system")
public class Test {

	@Autowired
	ISaLogService logservice;

	@ResponseBody
	@RequestMapping("/log")
	public Object log() {
		return logservice.selectList();
	}
}
