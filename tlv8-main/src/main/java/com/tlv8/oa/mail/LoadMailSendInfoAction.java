package com.tlv8.oa.mail;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.alibaba.fastjson.JSON;

@Controller
@Scope("prototype")
public class LoadMailSendInfoAction extends ActionSupport {
	private Data data = new Data();
	private String type;
	private String rowid;

	public void setData(Data data) {
		this.data = data;
	}

	public Data getData() {
		return data;
	}

	@ResponseBody
	@RequestMapping("/LoadMailSendInfoAction")
	public Object execute() throws Exception {
		SQL sql = new SQL();
		if ("send".equals(type)) {
			sql.SELECT("FEMAILNAME,FCONSIGNEEID,FCONSIGNEECODE,FCONSIGNEE,FTEXT");
			sql.FROM("OA_EM_SendEmail");
		} else {
			sql.SELECT("FID,FSENDPERID,FSENDPERCODE,FSENDPERNAME,FEMAILNAME,FTEXT");
			sql.FROM("OA_EM_ReceiveEmail");
		}
		sql.WHERE("FID=?");
		try {
			List<Object> param = new ArrayList<>();
			param.add(rowid);
			List<Map<String, String>> list = DBUtils.selectStringList("oa", sql.toString(), param, true);
			data.setData(JSON.toJSONString(list));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return success(data);
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setRowid(String rowid) {
		this.rowid = rowid;
	}

	public String getRowid() {
		return rowid;
	}

}
