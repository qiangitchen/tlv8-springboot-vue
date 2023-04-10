package com.tlv8.flw.service;

import com.tlv8.flw.pojo.SaFlowdrawlg;

import java.util.List;

/**
 * Created by TLv8 IDE on 2023/04/10.
 */
public interface SaFlowdrawlgService {

	int deleteByPrimaryKey(String id);
	
	int insert(SaFlowdrawlg row);
	
	SaFlowdrawlg selectByPrimaryKey(String id);
	
	List<SaFlowdrawlg> selectAll();
	
	int updateByPrimaryKey(SaFlowdrawlg row);
	
	SaFlowdrawlg selectByProcessId(String sprocessid);
}
