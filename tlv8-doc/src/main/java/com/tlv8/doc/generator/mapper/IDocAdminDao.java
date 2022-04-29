package com.tlv8.doc.generator.mapper;

import java.util.List;

import com.tlv8.doc.generator.pojo.DocAdmin;

public interface IDocAdminDao {
	DocAdmin getByPrimaryKey(String fID);
	List<DocAdmin> getList();
	int insert(DocAdmin docadmin);
	int update(DocAdmin docadmin);
	int deleteByPrimaryKey(String fID);
}
