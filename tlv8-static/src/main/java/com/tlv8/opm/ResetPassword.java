package com.tlv8.opm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.utils.MD5Util;
import com.tlv8.system.pojo.SaOpPerson;
import com.tlv8.system.service.ISaOpPersonService;

/**
 * 重置用户密码
 * 
 * @author 陈乾
 */
@Controller
@Scope("prototype")
public class ResetPassword extends ActionSupport {
	private String rowid;

	@Autowired
	ISaOpPersonService saOpPersonService;

	@ResponseBody
	@RequestMapping(value = "/ResetPassword", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public Object execute() throws Exception {
		Data data = new Data();
		String r = "";
		String m = "success";
		String f = "";
		try {
			SaOpPerson person = saOpPersonService.selectByPrimaryKey(rowid);
			if (person != null) {
				person.setSpassword(MD5Util.encode("123456"));
				saOpPersonService.updateData(person);
			}
			f = "true";
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
		this.rowid = rowid;
	}

	public String getRowid() {
		return rowid;
	}

}
