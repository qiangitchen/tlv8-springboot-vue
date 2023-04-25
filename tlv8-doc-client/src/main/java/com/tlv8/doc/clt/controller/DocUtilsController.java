package com.tlv8.doc.clt.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.doc.clt.pojo.SaDocnamespace;
import com.tlv8.doc.clt.service.SaDocnamespaceService;

@Controller
public class DocUtilsController {
	@Autowired
	private SaDocnamespaceService saDocnamespaceService;

	@ResponseBody
	@RequestMapping("/queryHostAction")
	public Object queryHostAction(String urlPattern) {
		Map<String, Object> res = new HashMap<>();
		List<SaDocnamespace> nms = saDocnamespaceService.selectAll();
		if (nms.size() > 0) {
			String url = nms.get(0).getSurl();
			if (StringUtils.isNotEmpty(urlPattern)) {
				try {
					urlPattern = URLDecoder.decode(urlPattern, "utf-8");
				} catch (Exception e) {
				}
				url += urlPattern;
			}
			if (url.indexOf("?") > 0) {
				url += "&";
			} else {
				url += "?";
			}
			url += "key=" + IDUtils.getGUID();
			res.put("data", url);
			res.put("flag", true);
		} else {
			res.put("flag", false);
			res.put("message", "没有找到文档服务配置");
		}
		return res;
	}
}
