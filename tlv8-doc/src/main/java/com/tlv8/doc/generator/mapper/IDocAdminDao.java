package com.tlv8.doc.generator.mapper;

import java.util.List;

import com.tlv8.doc.generator.pojo.DocAdmin;

public interface IDocAdminDao {
	public DocAdmin getByPrimaryKey(String fID);
	public List<DocAdmin> getList();
	public int insert(DocAdmin docadmin);
	public int update(DocAdmin docadmin);
	public int deleteByPrimaryKey(String fID);
}
