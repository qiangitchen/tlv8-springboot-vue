package com.tlv8.doc.clt.action;

import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.doc.DocSvrUtils;
import com.tlv8.doc.clt.components.DocClient;
import com.tlv8.doc.clt.obj.DocUploadRes;

/**
 * layui 文件上传 通用接口
 *
 * @author 陈乾
 *
 */
@Controller
@RequestMapping("/utils")
public class LayuiFileUploadAction {
	@Autowired
	DocClient docClient;

	@ResponseBody
	@RequestMapping(value = "/layuiFileUploadAction", method = RequestMethod.POST)
	public Object execute(@RequestParam("file") MultipartFile file, String docPath, String dbkey, String rowid,
			String tablename, String cellname) throws Exception {
		synchronized (tablename + cellname + rowid) {
			JSONObject res = new JSONObject();
			if (docPath == null || "".equals(docPath)) {
				docPath = "/root";
			} else {
				try {
					docPath = URLDecoder.decode(docPath, "UTF-8");
				} catch (Exception e) {
				}
			}
			try {
				DocUploadRes docres = docClient.uploadFile(file, docPath);
				if (rowid != null && !"".equals(rowid) && !"undefined".equals(rowid)) {
					String keyfield = "fid";
					if ("system".equals(dbkey)) {
						keyfield = "sid";
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
							jsona = DocSvrUtils.transeInfo(fileinfo);
						}
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

}
