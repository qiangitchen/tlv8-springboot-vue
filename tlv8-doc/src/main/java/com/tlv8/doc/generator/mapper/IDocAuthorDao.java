package com.tlv8.doc.generator.mapper;

import java.util.List;

import com.tlv8.doc.generator.pojo.DocAuthor;

public interface IDocAuthorDao {
	DocAuthor getByPrimaryKey(String fID);
	DocAuthor getByUserID(String fUserID);
	List<DocAuthor> getList();
	int insert(DocAuthor docauthor);
	int update(DocAuthor docauthor);
	int deleteByPrimaryKey(String fID);
	int deleteByUserID(String fUserID);
}
