package com.tlv8.oa.mail;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;

@Controller
@Scope("prototype")
public class DeleteMailAction extends ActionSupport {
	private Data data = new Data();
	private String rowid;
	private String type;

	@ResponseBody
	@RequestMapping("/DeleteMailAction")
	@Override
	public Object execute() throws Exception {
		SQL sql = new SQL();
		if (type.equals("收件箱")) {
			sql.DELETE_FROM("oa_em_receiveemail");
		} else {
			sql.DELETE_FROM("oa_em_sendemail");
		}
		sql.WHERE("FID IN (" + rowid + ")");
		try {
			DBUtils.execdeleteQuery("oa", sql.toString());
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
		}
		return success(data);
	}

	public void setRowid(String rowid) {
		try {
			String id = URLDecoder.decode(rowid, "UTF-8");
			if (!id.startsWith("'")) {
				id = "'" + id + "'";
			}
			this.rowid = id;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getRowid() {
		return rowid;
	}

	public void setData(Data data) {
		this.data = data;
	}

	public Data getData() {
		return data;
	}

	public void setType(String type) {
		try {
			this.type = URLDecoder.decode(type, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getType() {
		return type;
	}
}
