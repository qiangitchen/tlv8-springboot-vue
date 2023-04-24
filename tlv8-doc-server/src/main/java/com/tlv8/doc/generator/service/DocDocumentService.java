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
import com.tlv8.doc.generator.mapper.DocDocumentMapper;
import com.tlv8.doc.generator.pojo.DocDocument;
import com.tlv8.doc.generator.pojo.SqlParams;

@Service
public class DocDocumentService {
	@Autowired
	private IConnectionDao connectiondao;

	@Autowired
	private DocDocumentMapper documentMapper;

	/*
	 * 添加文档信息
	 */
	public String addDocument(String fDocID, String fDocName, String fExtName, float fDocSize, String fDocType) {
		String ndid = IDUtils.getGUID();
		DocDocument doc = new DocDocument();
		doc.setFID(ndid);
		doc.setFDocID(fDocID);
		doc.setFDocName(fDocName);
		doc.setFExtName(fExtName);
		doc.setFDocSize(fDocSize);
		doc.setFDocType(fDocType);
		doc.setFAddTime(new Date());
		doc.setVersion(0);
		documentMapper.insert(doc);
		return ndid;
	}

	/*
	 * 添加文档信息
	 */
	public void addDocument(DocDocument document) {
		documentMapper.insert(document);
	}

	/*
	 * 数据更新
	 */
	public void updateDocument(String fID, String fDocID, String fDocName, String fExtName, float fDocSize,
			String fDocType) {
		DocDocument doc = documentMapper.getByPrimaryKey(fID);
		if (doc != null) {
			doc.setFDocID(fDocID);
			doc.setFDocName(fDocName);
			doc.setFExtName(fExtName);
			doc.setFDocSize(fDocSize);
			doc.setFDocType(fDocType);
			doc.setFUpdateTime(new Date());
			doc.setVersion(doc.getVersion() + 1);
			documentMapper.update(doc);
		}
	}

	/*
	 * 数据更新
	 */
	public void updateDocument(DocDocument document) {
		documentMapper.update(document);
	}

	/*
	 * 根据fID获取文档信息
	 */
	public DocDocument getDocumentByFID(String fID) {
		return documentMapper.getByPrimaryKey(fID);
	}

	/*
	 * 根据fDocID获取文档信息
	 */
	public DocDocument getDocumentByDocID(String fDocID) {
		return documentMapper.getByDocID(fDocID);
	}

	/*
	 * 根据FID删除数据
	 */
	public int deleteDocumentByFID(String fID) {
		return documentMapper.deleteByPrimaryKey(fID);
	}

	/*
	 * 根据文档ID删除数据
	 */
	public int deleteDocumentByDocID(String fDocID) {
		return documentMapper.deleteByDocID(fDocID);
	}

	/*
	 * 获取所有文档信息
	 */
	public List<DocDocument> getDocumentList() {
		return documentMapper.getList();
	}

	public List<DocDocument> getDocumentListByParam(String where) {
		List<DocDocument> rlist = new ArrayList<DocDocument>();
		SqlParams param = new SqlParams();
		param.setParam(where);
		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;
		try {
			conn = connectiondao.getConnection();
			stm = conn.createStatement();
			rs = stm.executeQuery("select * from Doc_Document " + param.getParam());
			while (rs.next()) {
				DocDocument doc = new DocDocument();
				doc.setFID(rs.getString("fID"));
				doc.setFDocID(rs.getString("fDocID"));
				doc.setFDocName(rs.getString("fDocName"));
				doc.setFExtName(rs.getString("fExtName"));
				doc.setFDocSize(rs.getFloat("fDocSize"));
				doc.setFDocType(rs.getString("fDocType"));
				doc.setFAddTime(rs.getTimestamp("fAddTime"));
				doc.setFUpdateTime(rs.getTimestamp("fUpdateTime"));
				doc.setVersion(rs.getInt("version"));
				rlist.add(doc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connectiondao.CloseConnection(conn, stm, rs);
		}
		return rlist;
	}
}
