package com.tlv8.doc.generator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tlv8.doc.generator.pojo.DocAdmin;

@Mapper
public interface DocAdminMapper {
	DocAdmin getByPrimaryKey(String fID);

	List<DocAdmin> getList();

	int insert(DocAdmin docadmin);

	int update(DocAdmin docadmin);

	int deleteByPrimaryKey(String fID);
}
