package com.tlv8.doc.generator.mapper;

import java.util.List;

import com.tlv8.doc.generator.pojo.DocUser;

public interface IDocUserDao {
	public DocUser getByPrimaryKey(String fID);
	public DocUser getByLoginID(String fLoginID);
	public List<DocUser> getList();
	public int insert(DocUser docuser);
	public int update(DocUser docuser);
	public int deleteByPrimaryKey(String fID);
	public int deleteByLoginID(String fLoginID);
}
