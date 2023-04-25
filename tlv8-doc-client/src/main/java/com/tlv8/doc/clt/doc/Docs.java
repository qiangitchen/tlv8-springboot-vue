package com.tlv8.doc.clt.doc;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnodeService;

@Component
public class Docs {
	@Autowired
	SaDocnodeService saDocnodeService;
	@Autowired
	DocDBHelper docDBHelper;

	public Doc queryDocById(String docID) {
		SaDocnode docnode = saDocnodeService.selectByPrimaryKey(docID);
		Doc doc = new Doc(docDBHelper);
		BeanUtils.copyProperties(docnode, doc);
		return doc;
	}
}
