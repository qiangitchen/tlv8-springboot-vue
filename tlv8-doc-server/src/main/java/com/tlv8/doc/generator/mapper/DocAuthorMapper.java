package com.tlv8.doc.generator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tlv8.doc.generator.pojo.DocAuthor;

@Mapper
public interface DocAuthorMapper {
	DocAuthor getByPrimaryKey(String fID);

	DocAuthor getByUserID(String fUserID);

	List<DocAuthor> getList();

	int insert(DocAuthor docauthor);

	int update(DocAuthor docauthor);

	int deleteByPrimaryKey(String fID);

	int deleteByUserID(String fUserID);
}
