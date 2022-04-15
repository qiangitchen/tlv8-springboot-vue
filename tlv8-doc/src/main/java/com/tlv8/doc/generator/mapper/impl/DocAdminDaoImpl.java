package com.tlv8.doc.generator.mapper.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tlv8.doc.generator.mapper.IDocAdminDao;
import com.tlv8.doc.generator.pojo.DocAdmin;

public class DocAdminDaoImpl extends SqlSessionDaoSupport implements
		IDocAdminDao {

	@Override
	public DocAdmin getByPrimaryKey(String fID) {
		return this
				.getSqlSession()
				.selectOne(
						"com.tlv8.doc.svr.generator.dao.IDocAdminDao.getByPrimaryKey",
						fID);
	}

	@Override
	public List<DocAdmin> getList() {
		return this.getSqlSession().selectList(
				"com.tlv8.doc.svr.generator.dao.IDocAdminDao.getList");
	}

	@Override
	public int insert(DocAdmin docadmin) {
		return this.getSqlSession().insert(
				"com.tlv8.doc.svr.generator.dao.IDocAdminDao.insert",
				docadmin);
	}

	@Override
	public int update(DocAdmin docadmin) {
		return this.getSqlSession().update(
				"com.tlv8.doc.svr.generator.dao.IDocAdminDao.update",
				docadmin);
	}

	@Override
	public int deleteByPrimaryKey(String fID) {
		return this
				.getSqlSession()
				.delete("com.tlv8.doc.svr.generator.dao.IDocAdminDao.deleteByPrimaryKey",
						fID);
	}

}
