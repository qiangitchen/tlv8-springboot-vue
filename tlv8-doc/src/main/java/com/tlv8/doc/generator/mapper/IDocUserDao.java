package com.tlv8.doc.generator.mapper;

import java.util.List;

import com.tlv8.doc.generator.pojo.DocUser;

public interface IDocUserDao {
	DocUser getByPrimaryKey(String fID);
	DocUser getByLoginID(String fLoginID);
	List<DocUser> getList();
	int insert(DocUser docuser);
	int update(DocUser docuser);
	int deleteByPrimaryKey(String fID);
	int deleteByLoginID(String fLoginID);
}
