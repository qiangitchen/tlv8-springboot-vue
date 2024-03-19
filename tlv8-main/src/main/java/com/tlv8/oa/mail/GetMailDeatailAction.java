package com.tlv8.oa.mail;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.alibaba.fastjson.JSON;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;

@Controller
@Scope("prototype")
public class GetMailDeatailAction extends ActionSupport {
	private Data data = new Data();
	private String rowid;
	private String type;

	public void setData(Data data) {
		this.data = data;
	}

	public Data getData() {
		return data;
	}

	@ResponseBody
	@RequestMapping("/getMailDeatailAction")
	@SuppressWarnings("rawtypes")
	public Object execute() throws Exception {
		ContextBean context = ContextUtils.getContext();
		String personid = context.getPersonID();
		if (personid == null || "null".equals(personid)) {
			data.setFlag("false");
			data.setMessage("未登录，请重新登录!");
		}
		String filter = "";
		if (rowid == null) {
			filter = "1=2";
		} else {
			filter = "e.FID = '" + rowid + "'";
		}
		SQL sql = new SQL();
		sql.SELECT("*");
		if (type.equals("收件箱") || type.equals("receive")) {
			sql.FROM("oa_em_receiveemail");
			SQL upsql = new SQL();
			upsql.UPDATE("oa_em_receiveemail");
			upsql.SET("FQUREY = '已查看'");
			upsql.WHERE("FID='" + rowid + "'");
			upsql.WHERE("FQUREY != '已查看'");
			DBUtils.execUpdateQuery("oa", upsql.toString());
		} else {
			sql.FROM("oa_em_sendemail");
		}
		sql.WHERE(filter);
		try {
			List list = DBUtils.execQueryforList("oa", sql.toString(), true);
			data.setData(JSON.toJSONString(list));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			e.printStackTrace();
		}
		return success(data);
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
