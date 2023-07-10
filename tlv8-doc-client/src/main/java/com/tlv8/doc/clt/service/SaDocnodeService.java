package com.tlv8.doc.clt.service;

import com.tlv8.doc.clt.pojo.SaDocnode;

import java.util.List;

/**
 * Created by TLv8 IDE on 2023/04/19.
 */
public interface SaDocnodeService {

	int deleteByPrimaryKey(String id);
	
	int insert(SaDocnode row);
	
	SaDocnode selectByPrimaryKey(String id);
	
	List<SaDocnode> selectAll();
	
	int updateByPrimaryKey(SaDocnode row);
	
	List<SaDocnode> selectByDocpath(String docpath);
	
	List<SaDocnode> selectByDocDisplayPath(String docpath);
	
	SaDocnode selectByFileID(String fileID);
}
