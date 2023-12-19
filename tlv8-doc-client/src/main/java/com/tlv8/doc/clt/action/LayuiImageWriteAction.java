package com.tlv8.doc.clt.action;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.db.DBUtils;
import com.tlv8.doc.clt.components.DocClient;
import com.tlv8.doc.clt.obj.DocUploadRes;

@Controller
@RequestMapping("/utils")
public class LayuiImageWriteAction {
	@Autowired
	DocClient docClient;

	/**
	 * 通用图片上传接口
	 * 
	 * @param file
	 * @param dbkey
	 * @param tablename
	 * @param cellname
	 * @param rowid
	 * @return Object
	 */
	@ResponseBody
	@RequestMapping(value = "/layuiImageUploadAction", method = RequestMethod.POST)
	public Object layuiImageUploadAction(@RequestParam("file") MultipartFile file, String dbkey, String tablename,
			String cellname, String rowid) {
		synchronized (tablename + cellname + rowid) {
			JSONObject res = new JSONObject();
			try {
				String docPath = "/root/图片组件/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
				DocUploadRes docres = docClient.uploadFile(file, docPath);
				if (rowid != null && !"".equals(rowid) && !"undefined".equals(rowid)) {
					String keyfield = "fid";
					if ("system".equals(dbkey)) {
						keyfield = "sid";
					}
					SQL upsql = new SQL().UPDATE(tablename).SET(cellname + "=?").WHERE(keyfield + "=?");
					SqlSession session = DBUtils.getSqlSession();
					Connection conn = null;
					PreparedStatement ps = null;
					PreparedStatement ps1 = null;
					ResultSet rs = null;
					try {
						conn = session.getConnection();
						JSONArray jsona = new JSONArray();
						jsona.add(docres.toJson());
						ps = conn.prepareStatement(upsql.toString());
						ps.setString(1, jsona.toString());
						ps.setString(2, rowid);
						ps.executeUpdate();
						session.commit(true);
					} catch (Exception e) {
						session.rollback(true);
						e.printStackTrace();
					} finally {
						DBUtils.closeConn(null, null, ps1, rs);
						DBUtils.closeConn(session, conn, ps, null);
					}
				}
				res.put("code", 0);
				res.put("fileID", docres.getFileID());
				res.put("msg", "上传成功！");
			} catch (Exception e) {
				res.put("code", -1);
				res.put("msg", "上传失败！");
				e.printStackTrace();
			}
			return res;
		}
	}

	/**
	 * 通用图片上传接口{图片以二进制形式存储}
	 * 
	 * @param file
	 * @param dbkey
	 * @param tablename
	 * @param cellname
	 * @param rowid
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/layuiImageWriteAction", method = RequestMethod.POST)
	public synchronized Object execute(@RequestParam("file") MultipartFile file, String dbkey, String tablename,
			String cellname, String rowid) throws Exception {
		synchronized (tablename + cellname + rowid) {
			JSONObject res = new JSONObject();
			if (dbkey == null || "".equals(dbkey))
				dbkey = "system";
			SqlSession session = DBUtils.getSqlSession();
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = session.getConnection();
				InputStream fin = file.getInputStream();
				String keyfiled = ("system".equals(dbkey)) ? "sID" : "fID";
				SQL sql = new SQL();
				sql.UPDATE(tablename);
				sql.SET(cellname + "=?");
				sql.WHERE(keyfiled + "=?");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setBinaryStream(1, fin, fin.available());
				pstmt.setString(2, rowid);
				pstmt.executeUpdate();
				conn.commit();
				res.put("code", 0);
				res.put("msg", "上传成功！");
			} catch (SQLException e) {
				res.put("code", -1);
				res.put("msg", "错误:" + e.toString());
				e.printStackTrace();
			} catch (IOException e) {
				res.put("code", -1);
				res.put("msg", "错误:" + e.toString());
			} catch (Exception e) {
				res.put("code", -1);
				res.put("msg", "错误:" + e.toString());
				e.printStackTrace();
			} finally {
				DBUtils.closeConn(session, conn, pstmt, null);
			}
			return res;
		}
	}
}
