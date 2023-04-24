package com.tlv8.doc.clt.service;

import com.tlv8.doc.clt.pojo.SaDocnamespace;

import java.util.List;

/**
 * Created by TLv8 IDE on 2023/04/19.
 */
public interface SaDocnamespaceService {

	int deleteByPrimaryKey(String id);
	
	int insert(SaDocnamespace row);
	
	SaDocnamespace selectByPrimaryKey(String id);
	
	List<SaDocnamespace> selectAll();
	
	int updateByPrimaryKey(SaDocnamespace row);
}
