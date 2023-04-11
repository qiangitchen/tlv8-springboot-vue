package com.tlv8.flw.base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.system.bean.ContextBean;

/**
 * 流程图存取类
 * 
 * @author 陈乾
 *
 */
public class FlowFile {
	public static final String folder_table = "SA_FLOWFOLDER";// 流程目录信息
	public static final String drawlg_table = "SA_FLOWDRAWLG";// 流程图信息
	public static final String get_drawlg_sql = "select SDRAWLG,SPROCESSACTY,SPROCESSNAME,SPROCESSID from SA_FLOWDRAWLG where SPROCESSID = ?";

	/**
	 * 获取流程图信息方法
	 * 
	 * @param processID
	 * @return
	 */
	public static Map<String, String> getFlowDraw(String processID) {
		Map<String, String> result = new HashMap<>();
		SqlSession session = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = session.getConnection();
			ps = conn.prepareStatement(get_drawlg_sql);
			ps.setString(1, processID);
			rs = ps.executeQuery();
			if (rs.next()) {
				result.put("SDRAWLG", rs.getString("SDRAWLG"));
				result.put("SPROCESSACTY", rs.getString("SPROCESSACTY"));
				result.put("SPROCESSNAME", rs.getString("SPROCESSNAME"));
				result.put("SPROCESSID", rs.getString("SPROCESSID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 保存流程图信息方法
	 * 
	 * @param processID
	 * @param sprocessname
	 * @param sdranwlg
	 * @param sprocessacty
	 * @param context
	 */
	public static void saveFlowDraw(String processID, String sprocessname, String sdranwlg, String sprocessacty,
			ContextBean context) {
		SqlSession session = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		ResultSet rs = null;
		String userID = context.getCurrentPersonID();
		String userName = context.getCurrentPersonName();
		try {
			conn = session.getConnection();
			ps1 = conn.prepareStatement(get_drawlg_sql);
			ps1.setString(1, processID);
			rs = ps1.executeQuery();
			String acSql = "";
			if (rs.next()) {
				acSql = "update " + drawlg_table
						+ " set SPROCESSNAME=?,SDRAWLG=?,SPROCESSACTY=?,SUPDATORID=?,SUPDATORNAME=?,SUPDATETIME=? where SPROCESSID=?";
			} else {
				String id = IDUtils.getGUID();
				acSql = "insert into " + drawlg_table
						+ "(SID,SPROCESSNAME,SDRAWLG,SPROCESSACTY,SCREATORID,SCREATORNAME,SCREATETIME,VERSION,SPROCESSID)values('"
						+ id + "',?,?,?,?,?,?,0,?)";
			}
			ps = conn.prepareStatement(acSql);
			ps.setString(1, sprocessname);
			ps.setString(2, sdranwlg);
			ps.setString(3, sprocessacty);
			ps.setString(4, userID);
			ps.setString(5, userName);
			ps.setTimestamp(6, new Timestamp(new Date().getTime()));
			ps.setString(7, processID);
			ps.executeUpdate();
			session.commit(true);
		} catch (SQLException e) {
			session.rollback(true);
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(null, null, ps1, null);
			DBUtils.closeConn(session, conn, ps, rs);
		}
	}

	/**
	 * 删除流程图信息方法
	 * 
	 * @param processID
	 */
	public static void deleteFlowDraw(String processID) {
		SqlSession session = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = session.getConnection();
			SQL sql = new SQL().DELETE_FROM(drawlg_table).WHERE("SPROCESSID=?");
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, processID);
			ps.executeUpdate();
			session.commit(true);
		} catch (SQLException e) {
			session.rollback(true);
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(session, conn, ps, null);
		}
	}
}
