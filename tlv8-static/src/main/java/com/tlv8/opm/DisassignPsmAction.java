package com.tlv8.opm;

import java.net.URLDecoder;

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
 * 取消人员分配
 * 
 * @author 陈乾
 */
@Controller
@Scope("prototype")
public class DisassignPsmAction extends ActionSupport {
	private String rowid;

	@Autowired
	ISaOpOrgService saOpOrgService;

	@ResponseBody
	@PostMapping(value = "/disassignPsmAction", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		Data data = new Data();
		String r = "";
		String m = "success";
		String f = "false";
		try {
			SaOpOrg saorg = saOpOrgService.selectByPrimaryKey(rowid);
			if (saorg != null) {
				if ("nkLimb".equals(saorg.getSnodekind())) {
					saOpOrgService.deleteData(saorg);
					f = "true";
				} else {
					m = "操作失败：当前人员组织为所属组织不能取消分配!";
				}
			} else {
				m = "操作失败：指定的ID不存在!";
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
