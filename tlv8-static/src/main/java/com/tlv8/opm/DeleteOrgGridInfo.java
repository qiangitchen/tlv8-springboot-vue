package com.tlv8.opm;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.service.ISaOpOrgService;
import com.tlv8.system.utils.ContextUtils;

/**
 * 逻辑删除组织机构信息
 * 
 * @author ChenQian
 */
@Controller
@Scope("prototype")
public class DeleteOrgGridInfo extends ActionSupport {
	Logger log = LoggerFactory.getLogger(getClass());
	private String rowid;

	@Autowired
	ISaOpOrgService saOpOrgService;

	@ResponseBody
	@PostMapping(value = "/deleteOrgGridInfo", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		Data data = new Data();
		String userfname = ContextUtils.getContext().getCurrentPersonFullName();
		String m = "success";
		String f = "";
		try {
			if (rowid != null && ("ORG01".equals(rowid) || rowid.startsWith("PSN01@"))) {
				f = "false";
				m = "操作失败：超管信息不可以删除!";
			} else if (rowid != null && !"".equals(rowid)) {
				SaOpOrg org = saOpOrgService.selectByPrimaryKey(rowid);
				if (org != null) {
					if (rowid.equalsIgnoreCase("ORG01") || rowid.equalsIgnoreCase("PSN01@ORG01")) {
						f = "false";
						m = "超管用户不能删除和禁用";
					} else {
						org.setSvalidstate(-1);
						saOpOrgService.updateData(org);
						changeChildSate(org.getSid(), -1);
						f = "true";
					}
				} else {
					f = "false";
					m = "操作失败：指定的rowid无效~";
				}
			} else {
				f = "false";
				m = "操作失败：未正确指定需要删除的rowid.";
			}
		} catch (Exception e) {
			m = "操作失败：" + e.getMessage();
			f = "false";
			e.printStackTrace();
		}
		log.error(userfname + "-逻辑删除组织数据：" + rowid + "！");
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
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getRowid() {
		return rowid;
	}

}
