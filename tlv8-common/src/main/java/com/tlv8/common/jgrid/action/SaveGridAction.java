package com.tlv8.common.jgrid.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.base.Data;
import com.tlv8.common.jgrid.BaseSaveGridAction;

/**
 * 公用的grid数据保存动作
 * 
 * @author 陈乾
 *
 */
@Controller
@Scope("prototype")
public class SaveGridAction extends BaseSaveGridAction {

	public Data getData() {
		return this.data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	@ResponseBody
	@PostMapping(value = "/saveGridAction", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		data = new Data();
		String r = "";
		String m = "success";
		String f = "";
		try {
			r = saveData();
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

}
