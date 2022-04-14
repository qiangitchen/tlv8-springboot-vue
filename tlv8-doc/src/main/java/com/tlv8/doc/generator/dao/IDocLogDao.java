package com.tlv8.doc.generator.dao;

import java.util.List;

import com.tlv8.doc.generator.beans.DocLog;

public interface IDocLogDao {
	public DocLog getByPrimaryKey(String fID);
	public DocLog getByUserID(String fUserID);
	public List<DocLog> getList();
	public int insert(DocLog doclog);
	public int update(DocLog doclog);
	public int deleteByPrimaryKey(String fID);
	public int deleteByUserID(String fUserID);
	public void clearData();
}
