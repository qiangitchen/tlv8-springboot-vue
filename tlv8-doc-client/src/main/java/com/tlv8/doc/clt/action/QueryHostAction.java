package com.tlv8.doc.clt.action;

import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.doc.clt.pojo.SaDocnamespace;
import com.tlv8.doc.clt.service.SaDocnamespaceService;

@Controller
@Scope("prototype")
public class QueryHostAction extends ActionSupport {
	private Data data = new Data();
	private String urlPattern;
	@Autowired
	private SaDocnamespaceService saDocnamespaceService;

	@ResponseBody
	@RequestMapping("/queryHostAction")
	public Object execute() throws Exception {
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
			data.setData(url);
			data.setFlag("true");
		} else {
			data.setFlag("false");
			data.setMessage("没有找到文档服务配置");
		}
		return success(data);
	}

	public String getUrlPattern() {
		return urlPattern;
	}

	public void setUrlPattern(String urlPattern) {
		this.urlPattern = urlPattern;
	}

}
