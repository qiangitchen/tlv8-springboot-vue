package com.tlv8.doc.generator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tlv8.doc.generator.pojo.DocDocPath;

@Mapper
public interface DocDocPathMapper {
	DocDocPath getByPrimaryKey(String fID);
	DocDocPath getByFileID(String fFileID);
	List<DocDocPath> getList();
	List<DocDocPath> getListByFileID(String fFileID);
	int insert(DocDocPath DocDocPath);
	int update(DocDocPath DocDocPath);
	int deleteByPrimaryKey(String fID);
	int deleteByFileID(String fFileID);
}
