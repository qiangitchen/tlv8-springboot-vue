package com.tlv8.common.data;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.AesEncryptUtil;
import com.tlv8.common.utils.CodeUtils;

/**
 * 
 */
public class BaseQueryAction extends ActionSupport {
	protected Data data = new Data();
	protected String dbkay = null;
	protected String table = null;
	protected String relation = null;
	protected String gridID = null;
	protected String sql = null;
	protected String where = null;
	protected String orderby = null;

	public Data getData() {
		return this.data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	@SuppressWarnings({ "rawtypes", "deprecation" })
	public String getInfo(String sql) throws Exception {
		if (relation == null || "".equals(relation)) {
			throw new Exception("查询的列不能为空!");
		}
		StringBuilder strb = new StringBuilder();
		List rs = null;
		String crelation[] = relation.split(",");
		dbkay = ("undefined".equals(dbkay) || "".equals(dbkay) || dbkay == null) ? "system" : dbkay;
		String csql = "";
		String filter = getWhere();
		String param = (filter != null && !("").equals(filter)) ? " and (" + filter + ")" : "";
		if (sql != null && !"".equals(sql)) {
			csql = sql;
		} else {
			StringBuilder str1 = new StringBuilder();
			str1.append("select ");
			str1.append(relation);
			str1.append(" from " + table);
			str1.append(" where 1=1 ");
			str1.append(param);
			csql = str1.toString();
		}
		try {
			rs = DBUtils.execQueryforList(dbkay, csql);
			for (int i = 0; i < rs.size(); i++) {
				HashMap m = (HashMap) rs.get(i);
				for (int j = 0; j < crelation.length; j++) {
					String cel = crelation[j];
					if (DBUtils.IsOracleDB(dbkay)) {
						cel = cel.toUpperCase();
					} else if (DBUtils.IsPostgreSQL(dbkay)) {
						cel = cel.toLowerCase();
					}
					String celValue = String.valueOf(m.get(cel));
					String covalue = (celValue == null || "".equals(celValue.replaceAll("null", ""))) ? "" : celValue;
					covalue = CodeUtils.encodeSpechars(covalue);
					strb.append("<" + crelation[j] + "><![CDATA[" + covalue + "]]></" + crelation[j] + ">");
				}
			}
		} catch (SQLException e) {
			System.err.println("SQL:" + csql);
			throw new SQLException(e.getMessage());
		}
		return strb.toString();
	}

	public void setWhere(String where) {
		this.where = CodeUtils.getDecode(where);
		this.where = AesEncryptUtil.desEncrypt(this.where);
		this.where = CodeUtils.getDoubleDecode(this.where);
	}

	public String getWhere() {
		return where;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public String getSql() {
		return sql;
	}

	public void setDbkay(String dbkay) {
		this.dbkay = dbkay;
	}

	public String getDbkay() {
		return dbkay;
	}

	public void setGridID(String gridID) {
		this.gridID = gridID;
	}

	public String getGridID() {
		return gridID;
	}

	public void setTable(String table) {
		this.table = table;
	}

	public String getTable() {
		return table;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getRelation() {
		return relation;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public String getOrderby() {
		return orderby;
	}

}
