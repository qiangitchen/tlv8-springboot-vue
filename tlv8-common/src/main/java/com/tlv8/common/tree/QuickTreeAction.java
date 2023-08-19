package com.tlv8.common.tree;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.StringArray;

/**
 * jtree关键字搜索
 * 
 * @author 陈乾
 *
 */
@Controller
@Scope("prototype")
public class QuickTreeAction extends ActionSupport {
	private static final Logger logger = Logger.getLogger(QuickTreeAction.class);
	private String quicktext;
	private String cloums;
	private String quickCells;
	private String jsonResult;

	@ResponseBody
	@RequestMapping(value = "/QuickTreeAction", produces = "application/json;charset=UTF-8")
	public Object execute(String quicktext, String cloums, String quickCells) throws Exception {
		this.quicktext = getDecode(quicktext);
		this.cloums = getDecode(cloums);
		this.quickCells = getDecode(quickCells);
		exeQuickAction();
		JSONObject json = new JSONObject();
		json.put("jsonResult", jsonResult);
		return json;
	}

	@SuppressWarnings({ "unchecked", "rawtypes", "deprecation" })
	public String exeQuickAction() {
		String[] pamms = this.quicktext.split(",");
		String id = pamms[0].toString();
		String name = pamms[1].toString();
		String tableName = pamms[2].toString();
		String databaseName = pamms[3].toString();
		String parent = pamms[4].toString();
		String text = pamms[5].toString();
		String path = pamms[6].toString();
		String rootFilter = pamms[7].toString();
		String filter = pamms[8].toString();
		String rootpath = "";
		SqlSession session = DBUtils.getSession(databaseName);
		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;
		try {
			conn = session.getConnection();
			SQL queryRootSql = new SQL();
			queryRootSql.SELECT(path);
			queryRootSql.FROM(tableName);
			queryRootSql.WHERE(rootFilter);
			if (filter != null && !"".equals(filter.trim())) {
				queryRootSql.WHERE(filter);
			}
			stm = conn.createStatement();
			rs = stm.executeQuery(queryRootSql.toString());
			int i = 0;
			while (rs.next()) {
				if (i > 0) {
					rootpath += " or ";
				}
				rootpath += " " + path + " like '" + rs.getString(path) + "%' ";
				i++;
			}
		} catch (Exception e) {
			logger.error(e);
		} finally {
			DBUtils.closeConn(null, null, stm, rs);
		}
		SQL sql = new SQL();
		sql.SELECT(id);
		sql.SELECT(parent);
		sql.SELECT(name);
		sql.SELECT(cloums);
		if (path != null && !"".endsWith(path) && cloums.indexOf(path) < 0) {
			sql.SELECT(path);
		}
		sql.FROM(tableName);
		StringArray owhere = new StringArray();
		owhere.push("upper(" + name + ") like upper('%" + text + "%')");
		owhere.push(id + " = '" + text + "'");
		if (quickCells != null && !"".equals(quickCells)) {
			String[] filcell = quickCells.split(",");
			for (int i = 0; i < filcell.length; i++) {
				if (!filcell[i].toUpperCase().equals(id.toUpperCase())) {
					owhere.push("upper(" + filcell[i] + ") like upper('%" + text + "%')");
				}
			}
		}
		sql.WHERE("(" + owhere.join(" or ") + ")");
		if (!"".equals(rootpath)) {
			sql.WHERE(rootpath);
		}
		if (filter != null && !"".equals(filter.trim())) {
			sql.WHERE(filter);
		}
		logger.debug(sql);
		try {
			JSONArray jsonArray = new JSONArray();
			stm = conn.createStatement();
			rs = stm.executeQuery(sql.toString());
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {
				Map item = new HashMap();
				item.put("id", rs.getString(id));
				item.put("name", rs.getString(name));
				item.put("parent", rs.getString(parent));
				item.put("fid", rs.getString(path));
				int size = rsmd.getColumnCount();
				for (int i = 1; i <= size; i++) {
					String keytext = rsmd.getColumnLabel(i);
					item.put(keytext, rs.getString(keytext));
				}
				item.put(path, rs.getString(path));
				jsonArray.add(item);
			}
			this.jsonResult = jsonArray.toString();
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(session, conn, stm, rs);
		}
		return this.jsonResult;
	}
}