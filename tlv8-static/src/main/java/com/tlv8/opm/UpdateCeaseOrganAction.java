package com.tlv8.opm;

import java.net.URLDecoder;
import java.sql.SQLException;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.base.Sys;
import com.tlv8.common.db.DBUtils;
import com.tlv8.system.utils.ContextUtils;

/**
 * @author LIUBING
 * @author 陈乾
 */
@Controller
@Scope("prototype")
public class UpdateCeaseOrganAction extends ActionSupport {
	private Data data = new Data();
	private String sql;

	@ResponseBody
	@RequestMapping(value = "/updateCeaseOrganAction", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public Object execute() throws Exception {
		data = new Data();
		String userid = ContextUtils.getContext().getCurrentPersonID();
		if (userid == null || "".equals(userid)) {
			data.setFlag("timeout");
			Sys.packErrMsg("未登录或登录已超时，不允许操作!");
			return success(data);
		}
		String r = "true";
		String m = "success";
		String f = "";
		try {
			exeUpdateCeaseOrgAction();
			f = "true";
		} catch (Exception e) {
			m = "error" + e.getMessage();
			f = "false";
			e.printStackTrace();
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		return success(data);
	}

	public String exeUpdateCeaseOrgAction() throws SQLException {
		try {
			if (sql.trim().toUpperCase().indexOf("insert".toUpperCase()) == 0) {
				DBUtils.execInsertQuery("system", sql);
			} else if (sql.trim().toUpperCase().indexOf("update".toUpperCase()) == 0) {
				DBUtils.execUpdateQuery("system", sql);
			} else {
				DBUtils.execdeleteQuery("system", sql);
			}
		} catch (Exception e) {
			throw new SQLException(e + ":" + sql);
		}
		return "true";
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		try {
			this.sql = URLDecoder.decode(sql, "UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

}
