package com.tlv8.doc.clt.doc;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnodeService;

/**
 * 文件操作基础入口-使用时自动注入
 * 
 * @author 陈乾
 *
 */
@Component
public class Docs {
	@Autowired
	SaDocnodeService saDocnodeService;
	@Autowired
	DocDBHelper docDBHelper;

	/**
	 * 根据文档id查询文档对象
	 * 
	 * @param docID
	 * @return com.tlv8.doc.clt.doc.Doc
	 */
	public Doc queryDocById(String docID) {
		SaDocnode docnode = saDocnodeService.selectByPrimaryKey(docID);
		Doc doc = new Doc(docDBHelper);
		BeanUtils.copyProperties(docnode, doc);
		return doc;
	}
}
