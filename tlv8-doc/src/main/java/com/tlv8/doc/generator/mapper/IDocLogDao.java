package com.tlv8.doc.generator.mapper;

import java.util.List;

import com.tlv8.doc.generator.pojo.DocLog;

public interface IDocLogDao {
	DocLog getByPrimaryKey(String fID);
	DocLog getByUserID(String fUserID);
	List<DocLog> getList();
	int insert(DocLog doclog);
	int update(DocLog doclog);
	int deleteByPrimaryKey(String fID);
	int deleteByUserID(String fUserID);
	void clearData();
}
