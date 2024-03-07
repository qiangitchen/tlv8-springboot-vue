package com.tlv8.doc.clt.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.db.DBUtils;

/**
 * 加载附件信息
 * 
 * @author chenqian
 */
@Controller
@Scope("prototype")
public class LoadAttachmentInformation extends ActionSupport {
	private String cellname;
	private String tablename;
	private String keyfield;
	private String rowid;

	@ResponseBody
	@RequestMapping("/loadAttachmentInformation")
	public Object execute() throws Exception {
		Map<String, Object> res = new HashMap<>();
		SQL sql = new SQL();
		sql.SELECT(cellname);
		sql.FROM(tablename);
		sql.WHERE(keyfield + "=?");
		SqlSession session = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = session.getConnection();
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, rowid);
			rs = ps.executeQuery();
			if (rs.next()) {
				res.put("data", rs.getString(cellname));
				res.put("flag", true);
				res.put("message", "查询成功");
			} else {
				res.put("flag", false);
				res.put("data", "[]");
				res.put("message", "查询失败");
			}
		} catch (Exception e) {
			res.put("flag", false);
			res.put("data", "[]");
			res.put("message", "查询异常：" + e.getMessage());
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(session, conn, ps, rs);
		}
		return success(res);
	}

	public String getCellname() {
		return cellname;
	}

	public void setCellname(String cellname) {
		this.cellname = cellname;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public String getKeyfield() {
		return keyfield;
	}

	public void setKeyfield(String keyfield) {
		this.keyfield = keyfield;
	}

	public String getRowid() {
		return rowid;
	}

	public void setRowid(String rowid) {
		this.rowid = rowid;
	}

}
