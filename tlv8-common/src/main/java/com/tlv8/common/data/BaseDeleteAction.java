package com.tlv8.common.data;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;

/**
 * 
 */
public class BaseDeleteAction extends ActionSupport {
	protected Data data = new Data();
	protected String dbkay = "system"; // 默认值system
	protected String table = "";
	protected String cascade = "";// 级联删除配置{表名：外键,表名：外键...}
	protected String rowid;

	public Data getData() {
		return this.data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	public String deleteData() throws SQLException, NamingException, Exception {
		String result = "";
		if (table == null || "".equals(table)) {
			throw new Exception("操作的表名不能为空！");
		}
		String sql = "delete from " + table + " where fID = '" + getRowid() + "'";
		if ("system".equals(dbkay))
			sql = sql.replace("fID", "sID");
		Connection conn = null;
		boolean autocommit = true;
		try {
			conn = DBUtils.getAppConn(dbkay);
			autocommit = conn.getAutoCommit();
			conn.setAutoCommit(false);
			DBUtils.excuteDelete(conn, sql);
			String billTable = "";
			String BillID = "";
			if (!"".equals(cascade) && cascade != null) {
				String[] cas = cascade.split(",");
				for (int n = 0; n < cas.length; n++) {
					billTable = cas[n].split(":")[0];
					BillID = cas[n].split(":")[1];
					String dsql = "delete from " + billTable + " where " + BillID + " = '" + getRowid() + "'";
					DBUtils.excuteDelete(conn, dsql);// 级联删除
				}
			}
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			throw new SQLException(e);
		} finally {
			conn.setAutoCommit(autocommit);
			DBUtils.closeConn(conn, null, null);
		}
		return result;
	}

	public void setRowid(String rowid) {
		this.rowid = rowid;
	}

	public String getRowid() {
		return rowid;
	}

	public void setDbkay(String dbkay) {
		this.dbkay = dbkay;
	}

	public String getDbkay() {
		return dbkay;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public String getTable() {
		return table;
	}

	public void setCascade(String cascade) {
		this.cascade = cascade;
	}

	public String getCascade() {
		return cascade;
	}

}
