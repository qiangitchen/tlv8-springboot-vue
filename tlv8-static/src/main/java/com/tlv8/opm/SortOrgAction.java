package com.tlv8.opm;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.db.DBUtils;

/**
 * 组织排序
 * 
 * @author 陈乾
 */
@Controller
@Scope("prototype")
public class SortOrgAction extends ActionSupport {
	private String idlist;
	private String orgkind;

	@ResponseBody
	@PostMapping(value = "/sortOrgAction", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		SqlSession session = null;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			session = DBUtils.getSqlSession();
			conn = session.getConnection();
			SQL sqls = new SQL();
			sqls.UPDATE(orgkind);
			sqls.SET("SSEQUENCE=?");
			sqls.WHERE("SID=?");
			String sql = sqls.toString();
			String[] array = idlist.split(",");
			for (int i = 0; i < array.length; i++) {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, i + 1);
				ps.setString(2, array[i]);
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(session, conn, ps, null);
		}
		return this;
	}

	public void setIdlist(String idlist) {
		try {
			this.idlist = URLDecoder.decode(idlist, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getIdlist() {
		return idlist;
	}

	public void setOrgkind(String orgkind) {
		try {
			this.orgkind = URLDecoder.decode(orgkind, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getOrgkind() {
		return orgkind;
	}

}
