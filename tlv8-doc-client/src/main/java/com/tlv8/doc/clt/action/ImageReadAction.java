package com.tlv8.doc.clt.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.doc.DocSvrUtils;
import com.tlv8.system.utils.ContextUtils;

@Controller
@RequestMapping("/comon/picCompant")
public class ImageReadAction {

	@ResponseBody
	@RequestMapping("/docPicRead")
	public void docPicRead(HttpServletRequest request, HttpServletResponse response) {
		String dbkey = request.getParameter("dbkey");
		String keyCell = ("system".equals(dbkey)) ? "sID" : "fID";
		String cellname = request.getParameter("cellname");
		String tablename = request.getParameter("tablename");
		String fID = request.getParameter("fID").trim();
		SQL sql = new SQL();
		sql.SELECT(cellname);
		sql.FROM(tablename);
		sql.WHERE(keyCell + "=?");
		SqlSession sqlsession = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = sqlsession.getConnection();
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, fID);
			rs = ps.executeQuery();
			if (rs.next()) {
				String fileinfo = rs.getString(1);
				JSONArray jsona = DocSvrUtils.transeInfo(fileinfo);
				if (jsona != null && !jsona.isEmpty()) {
					String fileID = jsona.getJSONObject(0).getString("fileID");
					response.setContentType("image/jpeg");
					OutputStream outs = response.getOutputStream();
					DocSvrUtils.downloadFile(fileID, outs);
					outs.flush();
				}
			}
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DBUtils.closeConn(sqlsession, conn, ps, rs);
		}
	}

	/**
	 * 读取图片{图片字段读取}
	 * 
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/Pic-read")
	public void picRead(HttpServletRequest request, HttpServletResponse response) {
		String dbkey = request.getParameter("dbkey");
		String keyCell = ("system".equals(dbkey)) ? "sID" : "fID";
		String cellname = request.getParameter("cellname");
		String tablename = request.getParameter("tablename");
		String fid = request.getParameter("fID").trim();
		SQL sql = new SQL();
		sql.SELECT(cellname);
		sql.FROM(tablename);
		sql.WHERE(keyCell + "=?");
		SqlSession sqlsession = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = sqlsession.getConnection();
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, fid);
			rs = ps.executeQuery();
			if (rs.next()) {
				Blob blob = (Blob) rs.getBlob(1);
				long size = blob.length();
				byte[] bs = blob.getBytes(1, (int) size);
				response.setContentType("image/jpeg");
				OutputStream outs = response.getOutputStream();
				outs.write(bs);
				outs.flush();
			}
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DBUtils.closeConn(sqlsession, conn, ps, rs);
		}
	}

	/**
	 * 读取系统人员头像
	 * 
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/personhead")
	public void personhead(HttpServletRequest request, HttpServletResponse response) {
		String psmid = request.getParameter("id");
		if (psmid == null) {
			psmid = ContextUtils.getContext().getCurrentPersonID();
		} else {
			psmid = psmid.trim();
		}
		SQL sql = new SQL();
		sql.SELECT("SPHOTO");
		sql.FROM("SA_OPPERSON");
		sql.WHERE("SID=?");
		SqlSession sqlsession = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		response.setContentType("image/jpeg");
		boolean havimg = false;
		try {
			conn = sqlsession.getConnection();
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, psmid);
			rs = ps.executeQuery();
			if (rs.next()) {
				Blob blob = (Blob) rs.getBlob(1);
				long size = blob.length();
				if (size > 0) {
					byte[] bs = blob.getBytes(1, (int) size);
					OutputStream outs = response.getOutputStream();
					outs.write(bs);
					outs.flush();
					havimg = true;
				}
			}
		} catch (Exception e) {
			// e.printStackTrace();
		} finally {
			DBUtils.closeConn(sqlsession, conn, ps, rs);
		}
		if (!havimg) {
			try {
				OutputStream outs = response.getOutputStream();
				File file = new File(request.getServletContext().getRealPath("comon/picCompant/image/shead.jpg"));
				downloadFile(file, outs);
				outs.flush();
			} catch (Exception e) {
			}
		}
	}

	void downloadFile(File file, OutputStream os) throws Exception {
		InputStream is = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		is = new FileInputStream(file);
		bis = new BufferedInputStream(is);
		bos = new BufferedOutputStream(os);
		byte[] b = new byte[1024];
		int len = 0;
		while ((len = bis.read(b)) != -1) {
			bos.write(b, 0, len);
		}
		bis.close();
		is.close();
		bos.close();
	}
}
