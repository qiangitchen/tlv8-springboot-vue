package com.tlv8.common.jgrid.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.db.DBUtils;

/**
 * 
 */
@Controller
@Scope("prototype")
public class GetStaticListDataAction extends ActionSupport {
	private String dbkey;
	private String table;
	private String relations;
	private String filter;
	private String orderby;
	private String jsondata;

	@ResponseBody
	@PostMapping(value = "/getStaticListDataAction", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		String sql = "select " + relations + " from " + table;
		if (filter != null && !"".equals(filter)) {
			sql += " where " + filter;
		}
		if (orderby != null && !"".equals(orderby)) {
			sql += " order by " + orderby;
		}
		String[] cells = relations.split(",");
		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getAppConn(dbkey);
			stm = conn.createStatement();
			rs = stm.executeQuery(sql);
			JSONArray jsona = new JSONArray();
			while (rs.next()) {
				JSONObject json = new JSONObject();
				for (int i = 0; i < cells.length; i++) {
					int c = i + 1;
					String value = (rs.getString(c) == null) ? "" : rs.getString(c);
					json.put(cells[i], value);
				}
				jsona.add(json);
			}
			jsondata = jsona.toString();
		} catch (SQLException e) {
			throw new SQLException(e + "dblink:" + dbkey + ",sql:" + sql);
		} finally {
			try {
				DBUtils.closeConn(conn, stm, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return this;
	}

	public String getDbkey() {
		return dbkey;
	}

	public void setDbkey(String dbkey) {
		this.dbkey = dbkey;
	}

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public String getRelations() {
		return relations;
	}

	public void setRelations(String relations) {
		this.relations = relations;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	public String getJsondata() {
		return jsondata;
	}

	public void setJsondata(String jsondata) {
		this.jsondata = jsondata;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

}
