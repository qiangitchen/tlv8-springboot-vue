package com.tlv8.opm;

import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.service.ISaOpOrgService;

/**
 * 禁用组织
 * 
 * @author chenqian
 *
 */
@Controller
@Scope("prototype")
public class DisableOrganization extends ActionSupport {
	private String rowid;

	@Autowired
	ISaOpOrgService saOpOrgService;

	@ResponseBody
	@PostMapping(value = "/disableOrganization", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		Data data = new Data();
		String r = "";
		String m = "success";
		String f = "false";
		try {
			if (rowid != null && !"".equals(rowid) && !"%".equals(rowid)) {
				SaOpOrg org = saOpOrgService.selectByPrimaryKey(rowid);
				if (org != null) {
					org.setSvalidstate(0);
					saOpOrgService.updateData(org);
					changeChildSate(org.getSid(), 0);
					f = "true";
				} else {
					f = "false";
					m = "操作失败：指定的rowid无效~";
				}
			} else {
				f = "false";
				m = "操作失败：未正确指定rowid.";
			}
		} catch (Exception e) {
			m = "操作失败：" + e.getMessage();
			f = "false";
			e.printStackTrace();
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		return success(data);
	}

	private void changeChildSate(String pid, int state) {
		List<SaOpOrg> orgList = saOpOrgService.selectListByParentID(pid);
		for (SaOpOrg org : orgList) {
			if (state < 1 && (org.getSid().equalsIgnoreCase("ORG01") || org.getSid().equalsIgnoreCase("PSN01@ORG01"))) {
				continue;
			}
			org.setSvalidstate(state);
			saOpOrgService.updateData(org);
			changeChildSate(org.getSid(), state);
		}
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
}
