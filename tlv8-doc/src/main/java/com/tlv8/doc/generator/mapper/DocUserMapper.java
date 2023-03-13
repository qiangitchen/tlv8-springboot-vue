package com.tlv8.doc.generator.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tlv8.doc.generator.pojo.DocUser;

@Mapper
public interface DocUserMapper {
	DocUser getByPrimaryKey(String fID);

	DocUser getByLoginID(String fLoginID);

	List<DocUser> getList();

	int insert(DocUser docuser);

	int update(DocUser docuser);

	int deleteByPrimaryKey(String fID);

	int deleteByLoginID(String fLoginID);
}
