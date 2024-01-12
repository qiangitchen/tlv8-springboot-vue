package com.tlv8.common.data.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.base.Data;
import com.tlv8.common.data.BaseQueryAction;
import com.tlv8.common.domain.AjaxResult;

/**
 * 用于公共查询动作(针对单行数据)
 * 
 * @author ChenQian
 */
@Controller
@Scope("prototype")
public class QueryAction extends BaseQueryAction {

	public Data getData() {
		return this.data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	@ResponseBody
	@PostMapping(value = "/queryAction", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		data = new Data();
		String r = "true";
		String m = "success";
		String f = "";
		try {
			r = getInfo(sql);
			f = "true";
		} catch (Exception e) {
			m = "操作失败：" + e.getMessage();
			f = "false";
			e.printStackTrace();
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		data.setTable(table);
		data.setRelation(relation);
		return AjaxResult.success(data);
	}
}
