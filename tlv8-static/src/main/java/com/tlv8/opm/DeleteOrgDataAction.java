package com.tlv8.opm;

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
import com.tlv8.system.pojo.SaOpPerson;
import com.tlv8.system.service.ISaOpOrgService;
import com.tlv8.system.service.ISaOpPersonService;

/**
 * 彻底删除组织数据
 * 
 * @author 陈乾
 * 
 */
@Controller
@Scope("prototype")
public class DeleteOrgDataAction extends ActionSupport {
	Logger log = LoggerFactory.getLogger(getClass());
	private String rowid;

	@Autowired
	ISaOpOrgService saOpOrgService;
	@Autowired
	ISaOpPersonService saOpPersonService;

	@ResponseBody
	@PostMapping(value = "/deleteOrgDataAction", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		Data data = new Data();
		try {
			String[] rowids = rowid.split(",");
			for (String orgid : rowids) {
				SaOpOrg org = saOpOrgService.selectByPrimaryKey(orgid);
				if (org != null) {
					clearChild(org.getSid());
					if ("psm".equalsIgnoreCase(org.getSorgkindid())) {
						SaOpPerson person = saOpPersonService.selectByPrimaryKey(org.getSpersonid());
						if (person != null) {
							saOpPersonService.deleteData(person);
						}
					}
					saOpOrgService.deleteData(org);
				}
			}
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.getMessage());
			e.printStackTrace();
		}
		return success(data);
	}

	private void clearChild(String pid) {
		List<SaOpOrg> orgs = saOpOrgService.selectAllByParentID(pid);
		for (SaOpOrg org : orgs) {
			clearChild(org.getSid());
			if ("psm".equalsIgnoreCase(org.getSorgkindid())) {
				SaOpPerson person = saOpPersonService.selectByPrimaryKey(org.getSpersonid());
				if (person != null) {
					saOpPersonService.deleteData(person);
				}
			}
			saOpOrgService.deleteData(org);
		}
	}

	public void setRowid(String rowid) {
		try {
			this.rowid = URLDecoder.decode(rowid, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getRowid() {
		return rowid;
	}
}
