package com.tlv8.flw.service.impl;

import com.tlv8.flw.mapper.SaFlowdrawlgMapper;
import com.tlv8.flw.pojo.SaFlowdrawlg;
import com.tlv8.flw.service.SaFlowdrawlgService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by TLv8 IDE on 2023/04/11.
 */
@Service
public class SaFlowdrawlgServiceImpl implements SaFlowdrawlgService {
	@Autowired
	private SaFlowdrawlgMapper saFlowdrawlgMapper;

	public int deleteByPrimaryKey(String id) {
		return saFlowdrawlgMapper.deleteByPrimaryKey(id);
	}

	public int insert(SaFlowdrawlg row) {
		return saFlowdrawlgMapper.insert(row);
	}

	public SaFlowdrawlg selectByPrimaryKey(String id) {
		return saFlowdrawlgMapper.selectByPrimaryKey(id);
	}

	public List<SaFlowdrawlg> selectAll() {
		return saFlowdrawlgMapper.selectAll();
	}

	public int updateByPrimaryKey(SaFlowdrawlg row) {
		return saFlowdrawlgMapper.updateByPrimaryKey(row);
	}

	public SaFlowdrawlg selectBySprocessid(String sprocessid) {
		return saFlowdrawlgMapper.selectBySprocessid(sprocessid);
	}

	public List<SaFlowdrawlg> seachProcessByPath(String path) {
		return saFlowdrawlgMapper.seachProcessByPath("%" + path + "%");
	}

}
