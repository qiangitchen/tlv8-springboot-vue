package com.tlv8.doc.clt.action;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
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
import com.tlv8.doc.clt.doc.AbstractDoc;
import com.tlv8.doc.clt.doc.Doc;
import com.tlv8.doc.clt.doc.DocDBHelper;
import com.tlv8.doc.clt.doc.DocUtils;
import com.tlv8.doc.clt.doc.Docs;
import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnodeService;

@Controller
@RequestMapping("/utils")
public class LayuiImageWriteAction {
	@Autowired
	SaDocnodeService saDocnodeService;
	@Autowired
	DocDBHelper docDBHelper;
	@Autowired
	Docs docs;

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
		JSONObject res = new JSONObject();
		try {
			String docPath = "/root/图片组件/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
			String fileName = file.getOriginalFilename();
			Map<String, String> m = upLoadFiletoDaisy("/", fileName, file.getInputStream());
			String docID = docDBHelper.addDocData(docPath, fileName, file.getContentType(),
					String.valueOf(m.get("Size")), m.get("cacheName"));
			String fileID = m.get("cacheName");
			Doc doc = docs.queryDocById(docID);
			doc.commitFile();
			DocUtils.saveDocFlag(docDBHelper.getHost(), docPath, doc.getSkind(), doc.getScachename(),
					doc.getScachename(), false);
			fileID = doc.getSfileid();
			SaDocnode docnode = saDocnodeService.selectByPrimaryKey(docID);
			docnode.setSfileid(fileID);
			saDocnodeService.updateByPrimaryKey(docnode);
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
					JSONObject jsono = new JSONObject();
					jsono.put("fileID", fileID);
					jsono.put("filename", doc.getSdocname());
					jsono.put("filesize", doc.getSsize());
					jsono.put("md5", DigestUtils.md5Hex(file.getBytes()));
					jsona.add(jsono);
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
			res.put("fileID", fileID);
			res.put("msg", "上传成功！");
		} catch (Exception e) {
			res.put("code", -1);
			res.put("msg", "上传失败！");
			e.printStackTrace();
		}
		return res;
	}

	private Map<String, String> upLoadFiletoDaisy(String DocPath, String DocName, InputStream file) throws Exception {
		AbstractDoc doca = new AbstractDoc(docDBHelper);
		doca.setSdocpath(DocPath);
		doca.setSdocname(DocName);
		doca.upload(false, file);
		DocUtils.saveDocFlag(docDBHelper.getHost(), DocPath, doca.getSkind(), doca.getScachename(),
				doca.getScachename(), false);
		Map<String, String> rem = new HashMap<>();
		rem.put("Kind", doca.getSkind());
		rem.put("cacheName", doca.getScachename());
		rem.put("Size", String.valueOf(doca.getSsize()));
		rem.put("sDocName", DocName);
		return rem;
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
