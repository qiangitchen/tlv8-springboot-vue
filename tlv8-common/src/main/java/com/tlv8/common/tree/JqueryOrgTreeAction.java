package com.tlv8.common.tree;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.StringUtils;

@Controller
@Scope("prototype")
public class JqueryOrgTreeAction extends ActionSupport {
	private static final Logger logger = LoggerFactory.getLogger(JqueryOrgTreeAction.class);

	private String orgKind;

	@ResponseBody
	@RequestMapping(value = "/JqueryOrgTreeAction")
	public void execute(HttpServletResponse response, String orgKind, String rootFilter) throws Exception {
		this.orgKind = getDecode(orgKind);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		SQL queySql = new SQL().SELECT("SID,SCODE,SNAME");
		queySql.FROM("SA_OPORG").WHERE("SORGKINDID=?");
		if (StringUtils.isNotEmpty(rootFilter)) {
			queySql.WHERE(rootFilter);
		}
		queySql.ORDER_BY("SSEQUENCE asc");
		SqlSession session = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		JSONArray jsonar = new JSONArray();
		try {
			conn = session.getConnection();
			ps = conn.prepareStatement(queySql.toString());
			ps.setString(1, orgKind);
			rs = ps.executeQuery();
			while (rs.next()) {
				JSONObject json = new JSONObject();
				json.put("id", rs.getString("SID"));
				json.put("code", rs.getString("SCODE"));
				json.put("text", rs.getString("SNAME"));
				getChildren(conn, json, rs.getString("SID"));
				jsonar.add(json);
			}
		} catch (Exception e) {
			logger.error(e.toString());
		} finally {
			DBUtils.closeConn(session, conn, ps, rs);
		}
		PrintWriter writer = response.getWriter();
		writer.write(jsonar.toString());
		writer.close();
	}

	private void getChildren(Connection conn, JSONObject pjob, String pId) {
		SQL queySql = new SQL().SELECT("SID,SCODE,SNAME").FROM("SA_OPORG");
		queySql.WHERE("SORGKINDID=? and SPARENT=?");
		queySql.ORDER_BY("SSEQUENCE asc");
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(queySql.toString());
			ps.setString(1, orgKind);
			ps.setString(2, pId);
			rs = ps.executeQuery();
			JSONArray jsonar = new JSONArray();
			while (rs.next()) {
				JSONObject json = new JSONObject();
				json.put("id", rs.getString("SID"));
				json.put("code", rs.getString("SCODE"));
				json.put("text", rs.getString("SNAME"));
				jsonar.add(json);
			}
			pjob.put("children", jsonar);
		} catch (Exception e) {
			logger.error(e.toString());
		} finally {
			try {
				DBUtils.closeConn(null, ps, rs);
			} catch (SQLException e) {
			}
		}
	}

}
