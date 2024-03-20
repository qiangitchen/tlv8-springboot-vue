package com.tlv8.oa.mail;

import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.oa.service.OaEmReceiveemailService;
import com.tlv8.oa.service.OaEmSendemailService;

@Controller
@Scope("prototype")
public class DeleteMailAction extends ActionSupport {
	private String rowid;
	private String type;

	@Autowired
	OaEmReceiveemailService oaEmReceiveemailService;

	@Autowired
	OaEmSendemailService oaEmSendemailService;

	@ResponseBody
	@RequestMapping("/DeleteMailAction")
	@Override
	public Object execute() throws Exception {
		Data data = new Data();
		try {
			if (StringUtils.isNotEmpty(rowid)) {
				String[] ids = rowid.split(",");
				for (String id : ids) {
					if (type.equals("收件箱")) {
						oaEmReceiveemailService.removeById(id);
					} else {
						oaEmSendemailService.removeById(id);
					}
				}
			}
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
		}
		return success(data);
	}

	public void setRowid(String rowid) {
		try {
			this.rowid = URLDecoder.decode(rowid, "UTF-8");
		} catch (Exception e) {
			this.rowid = rowid;
		}
	}

	public String getRowid() {
		return rowid;
	}

	public void setType(String type) {
		try {
			this.type = URLDecoder.decode(type, "UTF-8");
		} catch (Exception e) {
			this.type = type;
		}
	}

	public String getType() {
		return type;
	}
}
