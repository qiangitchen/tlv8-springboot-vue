package com.tlv8.doc.generator.dao;

import java.util.List;

import com.tlv8.doc.generator.beans.DocAuthor;

public interface IDocAuthorDao {
	public DocAuthor getByPrimaryKey(String fID);
	public DocAuthor getByUserID(String fUserID);
	public List<DocAuthor> getList();
	public int insert(DocAuthor docauthor);
	public int update(DocAuthor docauthor);
	public int deleteByPrimaryKey(String fID);
	public int deleteByUserID(String fUserID);
}
