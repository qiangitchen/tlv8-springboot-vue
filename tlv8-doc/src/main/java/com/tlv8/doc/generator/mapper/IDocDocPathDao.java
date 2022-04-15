package com.tlv8.doc.generator.mapper;

import java.util.List;

import com.tlv8.doc.generator.pojo.DocDocPath;

public interface IDocDocPathDao {
	public DocDocPath getByPrimaryKey(String fID);
	public DocDocPath getByFileID(String fFileID);
	public List<DocDocPath> getList();
	public List<DocDocPath> getListByFileID(String fFileID);
	public int insert(DocDocPath DocDocPath);
	public int update(DocDocPath DocDocPath);
	public int deleteByPrimaryKey(String fID);
	public int deleteByFileID(String fFileID);
}
