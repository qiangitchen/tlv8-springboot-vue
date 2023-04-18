package com.tlv8.common.date;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 获取服务器时间的方法
 * 
 * @author 陈乾
 *
 */
@Controller
public class SystemDateController {

	@ResponseBody
	@RequestMapping("/getSystemDate")
	public Object getSystemDate() {
		Map<String, String> data = new HashMap<>();
		data.put("sysdate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		return data;
	}

	@ResponseBody
	@RequestMapping("/getSystemDateTime")
	public Object getSystemDateTime() {
		Map<String, String> data = new HashMap<>();
		data.put("sysdate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		return data;
	}

}
