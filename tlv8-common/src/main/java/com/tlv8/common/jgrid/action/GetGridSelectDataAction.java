package com.tlv8.common.jgrid.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.naming.NamingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson2.JSON;
import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.StringArray;

/**
 * 
 */
@Controller
@Scope("prototype")
public class GetGridSelectDataAction extends ActionSupport {
	private static final Logger logger = LoggerFactory.getLogger(GetGridSelectDataAction.class);

	private Data data = new Data();
	private String dbkey = null;
	private String sql = null;

	@ResponseBody
	@PostMapping(value = "/getGridSelectDataAction", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		data = new Data();
		String r = "true";
		String m = "success";
		String f = "";
		try {
			r = exeQueryAction();
			f = "true";
		} catch (Exception e) {
			m = "操作失败：" + e.getMessage();
			f = "false";
			logger.error("操作失败", e);
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		return success(data);
	}

	private String exeQueryAction() throws SQLException, NamingException {
		String result = "";
		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd;
		String db = getDbkey();
		String sql = getSql();
		if (DBUtils.IsOracleDB(db)) {
			if (sql.indexOf("limit ") > 0) {
				String le = sql.substring(sql.indexOf("limit ") + 5).trim();
				sql = sql.substring(0, sql.indexOf("limit "));
				if (sql.indexOf(" where ") > 0) {
					try {
						sql = sql.replace(" where ", " where rownum <= " + le.split(",")[1] + " and ");
					} catch (Exception e) {
					}
				}
			}
		} else if (!DBUtils.IsMySQLDB(db)) {
			if (sql.indexOf("limit ") > 0) {
				String le = sql.substring(sql.indexOf("limit ") + 5).trim();
				sql = sql.substring(0, sql.indexOf("limit "));
				if (sql.indexOf(" where ") > 0) {
					try {
						sql = sql.replace("select", "select top " + le.split(",")[1] + " ");
					} catch (Exception e) {

					}
				}
			}
			// SQLServer将concat转为+号连接
			try {
				Pattern pat = Pattern.compile("concat\\((.*?)\\)");
				Matcher mat = pat.matcher(sql);
				while (mat.find()) {
					sql = sql.replace(mat.group(0), mat.group(1).replace(",", "+"));
				}
			} catch (Exception e) {
			}
		}
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			conn = DBUtils.getAppConn(db);
			stm = conn.createStatement();
			rs = stm.executeQuery(sql);
			rsmd = rs.getMetaData();
			int size = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, String> m = new HashMap<String, String>();
				m.put("value", (rs.getString(1) == null) ? "" : rs.getString(1));
				StringArray arr = new StringArray();
				for (int i = 2; i <= size; i++) {
					String value = (rs.getString(i) == null) ? "" : rs.getString(i);
					arr.push(value);
				}
				if (arr.getLength() < 1) {
					m.put("text", m.get("value"));
				} else {
					m.put("text", arr.join(" "));
				}
				list.add(m);
			}
		} catch (SQLException e) {
			throw new SQLException(e + "dbkey:" + dbkey + ",sql:" + sql);
		} finally {
			try {
				DBUtils.closeConn(conn, stm, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		result = JSON.toJSONString(list);
		return result;
	}

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	public String getDbkey() {
		return dbkey;
	}

	public void setDbkey(String dbkey) {
		this.dbkey = dbkey;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

}
