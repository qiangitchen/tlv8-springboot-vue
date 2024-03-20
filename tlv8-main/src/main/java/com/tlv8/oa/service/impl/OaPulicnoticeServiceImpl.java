package com.tlv8.oa.service.impl;

import com.tlv8.oa.mapper.OaPulicnoticeMapper;
import com.tlv8.oa.pojo.OaPulicnotice;
import com.tlv8.oa.service.OaPulicnoticeService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

/**
 * Created by TLv8 IDE on 2024/03/20.
 */
@Service
public class OaPulicnoticeServiceImpl implements OaPulicnoticeService {
	@Autowired
	private OaPulicnoticeMapper oaPulicnoticeMapper;

	public int deleteByPrimaryKey(String id) {
		return oaPulicnoticeMapper.deleteByPrimaryKey(id);
	}

	public int insert(OaPulicnotice row) {
		return oaPulicnoticeMapper.insert(row);
	}

	public OaPulicnotice selectByPrimaryKey(String id) {
		return oaPulicnoticeMapper.selectByPrimaryKey(id);
	}

	public List<OaPulicnotice> selectAll() {
		return oaPulicnoticeMapper.selectAll();
	}

	public int updateByPrimaryKey(OaPulicnotice row) {
		return oaPulicnoticeMapper.updateByPrimaryKey(row);
	}

	@Override
	public Map<String, Object> selectPortalNotesCount(String fpersonid) {
		return oaPulicnoticeMapper.selectPortalNotesCount(fpersonid);
	}

}
