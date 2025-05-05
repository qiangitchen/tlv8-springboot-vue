package com.tlv8.doc.controller.data;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.doc.controller.impl.DoupDoc;
import com.tlv8.doc.controller.impl.FileDeleter;
import com.tlv8.doc.core.io.FileUploader;
import com.tlv8.doc.core.io.atr.FileAttribute;
import com.tlv8.doc.core.utils.FileExtArray;
import com.tlv8.doc.generator.pojo.DocDocPath;
import com.tlv8.doc.generator.pojo.DocDocument;
import com.tlv8.doc.generator.service.DocDocPathService;
import com.tlv8.doc.generator.service.DocDocumentService;
import com.tlv8.doc.generator.service.DocService;
import com.tlv8.doc.lucene.LuceneService;
import com.tlv8.doc.lucene.art.IndexWrite;

@Component
public class DocLoadData {
	@Autowired
	DocDocPathService docDocPathService;
	@Autowired
	DocDocumentService docDocumentService;
	@Autowired
	DocService docService;
	@Autowired
	FileDeleter fileDeleter;
	@Autowired
	DoupDoc doupDoc;

	/*
	 * 
	 */
	public void load(HttpServletRequest request) throws Exception {
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		Date start = null;
		try {
			start = new SimpleDateFormat("yyyy-MM-dd").parse(startTime);
		} catch (Exception e) {
			System.out.println("开始时间：" + startTime + "格式不正确,(yyyy-MM-dd).");
		}
		Date end = null;
		try {
			end = new SimpleDateFormat("yyyy-MM-dd").parse(endTime);
		} catch (Exception e) {
			System.out.println("开始时间：" + startTime + "格式不正确,(yyyy-MM-dd).");
		}
		String docsvurl = "";
		JSONArray json = new JSONArray();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Statement stm = null;
		ResultSet rs1 = null;
		try {
			String sql = "select SID,SFILEID,SDOCNAME,SSIZE,SKIND,SCREATETIME,SCACHENAME "
					+ " from SA_DOCNODE where SSIZE > 0 and SCREATETIME>=? and SCREATETIME<?";
			conn = getConnection(request);
			ps = conn.prepareStatement(sql);
			ps.setDate(1, new java.sql.Date(start.getTime()));
			ps.setDate(2, new java.sql.Date(end.getTime()));
			rs = ps.executeQuery();
			while (rs.next()) {
				JSONObject jon = new JSONObject();
				String SFILEID = rs.getString("SFILEID");
				if (SFILEID == null) {
					SFILEID = "";
				}
				jon.put("SFILEID", SFILEID);
				jon.put("SDOCNAME", rs.getString("SDOCNAME"));
				jon.put("SSIZE", rs.getLong("SSIZE"));
				jon.put("SKIND", rs.getString("SKIND"));
				jon.put("SCREATETIME", rs.getTimestamp("SCREATETIME").getTime());
				String SCACHENAME = rs.getString("SCACHENAME");
				if (SCACHENAME == null) {
					SCACHENAME = "";
				}
				jon.put("SCACHENAME", SCACHENAME);
				json.add(jon);
			}
			stm = conn.createStatement();
			rs1 = stm.executeQuery("select SHOST,SPORT from SA_DOCNAMESPACE");
			if (rs1.next()) {
				docsvurl = "http://" + rs1.getString(1) + ":" + rs1.getString(2) + "/DocServer";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(null, stm, rs1);
			closeConn(conn, ps, rs);
		}
		try {
			downloadFile(docsvurl, json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void downloadFile(String svrurl, JSONArray data) throws Exception {
		System.out.println("开始下载文件，文件数量:" + data.size());
		LuceneService.stop();// 先停止自动创建索引服务
		for (int i = 0; i < data.size(); i++) {
			JSONObject json = data.getJSONObject(i);
			if (!"".equals(json.getString("SFILEID"))) {
				downloadFile(svrurl, json);
			} else if (!"".equals(json.getString("SCACHENAME"))) {
				json.put("SFILEID", json.getString("SCACHENAME"));
				json.remove("SCACHENAME");
				downloadFile(svrurl, json);
			}
		}
		System.out.println("下载完成，文件数量:" + data.size());
		LuceneService.start();// 启动自动创建索引服务
	}

	private void downloadFile(String svrurl, JSONObject json) throws Exception {
		String downloadurl = svrurl + "/repository/file/download/%s/last/content";
		HttpClient client = new HttpClient();
		GetMethod httpGet = new GetMethod(String.format(downloadurl, json.getString("SFILEID")));
		System.out.println("下载文件:" + json.getString("SFILEID"));
		try {
			client.executeMethod(httpGet);
			InputStream in = httpGet.getResponseBodyAsStream();
			doupDoc.setDocID(json.getString("SFILEID"));
			try {
				// 上传之前先删除fileID相同的文件
				fileDeleter.delete(doupDoc.getDocID());
			} catch (Exception e) {
			}

			String docPath = doupDoc.getNewDocPath();
			FileUploader.upload(in, doupDoc.getDocID(), docPath);
			// 文档信息
			DocDocument doc = new DocDocument();
			doc.setFID(IDUtils.getGUID());
			doc.setFDocID(doupDoc.getDocID());
			doc.setFDocName(json.getString("SDOCNAME"));
			doc.setFExtName(FileExtArray.getExtName(json.getString("SDOCNAME")));
			doc.setFDocSize(json.getLong("SSIZE"));
			doc.setFDocType(json.getString("SKIND"));
			doc.setFAddTime(new Date(json.getLong("SCREATETIME")));
			doc.setVersion(0);
			docDocumentService.addDocument(doc);
			// 文档路径信息
			DocDocPath docpath = new DocDocPath();
			docpath.setFID(IDUtils.getGUID());
			docpath.setFFileID(doc.getFDocID());
			docpath.setFFilePath(docPath);
			docpath.setFFileSize(doc.getFDocSize());
			docpath.setFVersion(1);
			docpath.setFAddTime(doc.getFAddTime());
			docpath.setVersion(0);
			docDocPathService.addDocDocPath(docpath);
			// 索引信息
			FileAttribute fatt = new FileAttribute();
			fatt.setAddTime(doc.getFAddTime());
			fatt.setFileExt(doc.getFExtName());
			fatt.setFileID(doc.getFDocID());
			fatt.setFileName(doc.getFDocName());
			fatt.setFilePath(docpath.getFFilePath());
			fatt.setFileSize(docpath.getFFileSize());
			fatt.setVersion(docpath.getFVersion());
			IndexWrite.write(fatt);
			try {
				// 处理编辑产生的文件
				String SCACHENAME = json.getString("SCACHENAME");
				if (SCACHENAME != null && !"".equals(SCACHENAME) && !"null".equals(SCACHENAME)) {
					json.put("SFILEID", SCACHENAME);
					json.remove("SCACHENAME");
					downloadFile(svrurl, json);
				}
			} catch (Exception e) {
			}
			docService.getNewDocID();// 追加序列
			System.out.println(json.getString("SFILEID") + ",装载成功!");
		} catch (Exception e) {
			System.out.println(json.getString("SFILEID") + ",装载失败!");
		}
	}

	private Connection getConnection(HttpServletRequest request) throws Exception {
		System.out.println("初始化数据链接... ...");
		String driver = request.getParameter("driver");
		String url = request.getParameter("url");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Connection cn = null;
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException eN) {
			System.out.println("没有找到驱动：" + driver);
			throw new SQLException(eN.toString());
		}
		try {
			cn = DriverManager.getConnection(url, username, password);
		} catch (SQLException eJ) {
			System.out.println(String.format("获取连接错误。url:%s, 用户名：%s，密码：%s", url, username, password));
			throw new SQLException(eJ.toString());
		}
		System.out.println("数据库链接成功");
		return cn;
	}

	private void closeConn(Connection conn, Statement stm, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
			}
		}
		if (stm != null) {
			try {
				stm.close();
			} catch (Exception e) {
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
			}
		}

	}
}
