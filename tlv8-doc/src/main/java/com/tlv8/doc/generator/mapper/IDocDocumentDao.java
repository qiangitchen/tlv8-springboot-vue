package com.tlv8.doc.generator.mapper;

import java.util.List;

import com.tlv8.doc.generator.pojo.DocDocument;

public interface IDocDocumentDao {
	public DocDocument getByPrimaryKey(String fID);
	public DocDocument getByDocID(String fDocID);
	public List<DocDocument> getList();
	public int insert(DocDocument docdocument);
	public int update(DocDocument docdocument);
	public int deleteByPrimaryKey(String fID);
	public int deleteByDocID(String fDocID);
}