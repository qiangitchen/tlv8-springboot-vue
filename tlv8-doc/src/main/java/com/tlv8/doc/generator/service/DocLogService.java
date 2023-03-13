package com.tlv8.doc.generator.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.doc.generator.dao.IConnectionDao;
import com.tlv8.doc.generator.mapper.DocLogMapper;
import com.tlv8.doc.generator.pojo.DocLog;
import com.tlv8.doc.generator.pojo.SqlParams;

@Service
public class DocLogService {
	@Autowired
	private IConnectionDao connectiondao;

	@Autowired
	private DocLogMapper doclogMapper;

	/*
	 * 写操作日志
	 * 
	 * @param {fUserID:用户ID,fAction:执行的操作,fMessage 操作的信息}
	 * 
	 * @throws Exception
	 */
	public String AddLog(String fUserID, String fAction, String fMessage) throws Exception {
		String nnid = IDUtils.getGUID();
		DocLog doclog = new DocLog();
		doclog.setFID(nnid);
		doclog.setFUserID(fUserID);
		doclog.setFAddTime(new Date());
		doclog.setFAction(fAction);
		doclog.setFMessage(fMessage);
		doclog.setVersion(0);
		doclogMapper.insert(doclog);
		return nnid;
	}

	/*
	 * 获取指定的日志记录
	 */
	public DocLog getDocLog(String fID) {
		return doclogMapper.getByPrimaryKey(fID);
	}

	/*
	 * 获取所有日志记录
	 */
	public List<DocLog> getDocLogList() {
		return doclogMapper.getList();
	}

	/*
	 * 获取指定条件的日志记录
	 */
	public List<DocLog> getDocLogListByParam(String where) {
		List<DocLog> rlist = new ArrayList<DocLog>();
		where = where.trim();
		if (!where.startsWith("where")) {
			where = " where " + where;
		}
		SqlParams param = new SqlParams();
		param.setParam(where);
		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;
		try {
			conn = connectiondao.getConnection();
			stm = conn.createStatement();
			rs = stm.executeQuery("select * from Doc_Log " + param.getParam());
			while (rs.next()) {
				DocLog doclog = new DocLog();
				doclog.setFID(rs.getString("fID"));
				doclog.setFUserID(rs.getString("fUserID"));
				doclog.setFAddTime(rs.getTimestamp("fAddTime"));
				doclog.setFAction(rs.getString("fAction"));
				doclog.setFMessage(rs.getString("fMessage"));
				doclog.setVersion(rs.getInt("version"));
				rlist.add(doclog);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectiondao.CloseConnection(conn, stm, rs);
		}
		return rlist;
	}

	/*
	 * 清除所有日志
	 */
	public void ClearLog() throws Exception {
		doclogMapper.clearData();
	}

}
