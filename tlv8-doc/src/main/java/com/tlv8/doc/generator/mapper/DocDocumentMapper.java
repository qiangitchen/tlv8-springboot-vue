package com.tlv8.doc.generator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tlv8.doc.generator.pojo.DocDocument;

@Mapper
public interface DocDocumentMapper {
	DocDocument getByPrimaryKey(String fID);

	DocDocument getByDocID(String fDocID);

	List<DocDocument> getList();

	int insert(DocDocument docdocument);

	int update(DocDocument docdocument);

	int deleteByPrimaryKey(String fID);

	int deleteByDocID(String fDocID);
}