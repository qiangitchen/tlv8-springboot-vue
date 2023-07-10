package com.tlv8.doc.clt.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.db.DBUtils;
import com.tlv8.doc.clt.doc.Doc;
import com.tlv8.doc.clt.doc.Docs;
import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnodeService;

@Controller
@RequestMapping("/utils")
public class DeleteFileAction {
	@Autowired
	private SaDocnodeService saDocnodeService;
	@Autowired
	Docs docs;

	@ResponseBody
	@RequestMapping(value = "/deleteFileAction", method = RequestMethod.POST)
	public Object execute(String fileID, String dbkey, String tablename, String cellname, String rowid)
			throws Exception {
		Map<String, Object> res = new HashMap<String, Object>();
		String keyfield = "fid";
		if ("system".equals(dbkey)) {
			keyfield = "sid";
		}
		SaDocnode saDocnode = saDocnodeService.selectByFileID(fileID);
		if (saDocnode != null) {
			try {
				Doc doc = docs.queryDocById(rowid);
				doc.deleteFile();// 删除文件
				saDocnodeService.deleteByPrimaryKey(doc.getSid());// 删除文档数据
			} catch (Exception localException1) {
			}
		}
		SQL query = new SQL().SELECT(cellname).FROM(tablename).WHERE(keyfield + "=?");
		SQL upsql = new SQL().UPDATE(tablename).SET(cellname + "=?").WHERE(keyfield + "=?");
		SqlSession session = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		ResultSet rs = null;
		try {
			conn = session.getConnection();
			JSONArray jsona = new JSONArray();
			ps1 = conn.prepareStatement(query.toString());
			ps1.setString(1, rowid);
			rs = ps1.executeQuery();
			if (rs.next()) {
				String fileinfo = rs.getString(1);
				try {
					jsona = JSON.parseArray(fileinfo);
				} catch (Exception e) {
					try {
						jsona = JSON.parseArray(transeJson(fileinfo));
					} catch (Exception er) {
					}
				}
				JSONArray jsonb = new JSONArray();
				if (jsona != null) {
					for (int i = 0; i < jsona.size(); i++) {
						JSONObject jsono = jsona.getJSONObject(i);
						if (!jsono.getString("fileID").equals(fileID)) {
							jsonb.add(jsono);
						}
					}
				}
				// 更新附件记录
				ps = conn.prepareStatement(upsql.toString());
				ps.setString(1, jsonb.toString());
				ps.setString(2, rowid);
				ps.executeUpdate();
				session.commit(true);
			}
			res.put("state", true);
		} catch (Exception e) {
			res.put("state", false);
			res.put("msg", e.getMessage());
			session.rollback(true);
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(null, null, ps1, rs);
			DBUtils.closeConn(session, conn, ps, null);
		}
		return res;
	}

	public static String transeJson(String str) {
		str = str.replace(":", ":\"");
		str = str.replace(",", "\",");
		str = str.replace("}", "\"}");
		str = str.replace("}{", "},{");
		str = str.replace(";", "\",");
		return str;
	};

}
