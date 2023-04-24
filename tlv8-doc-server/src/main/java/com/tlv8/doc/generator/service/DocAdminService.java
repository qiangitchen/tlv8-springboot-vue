package com.tlv8.doc.generator.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.doc.generator.mapper.DocAdminMapper;
import com.tlv8.doc.generator.pojo.DocAdmin;

@Service
public class DocAdminService {
	
	@Autowired
	private DocAdminMapper docadminMapper;

	/*
	 * 添加
	 */
	public String addDocAdmin(int fLeve, String fName) {
		String naid = IDUtils.getGUID();
		DocAdmin docadmin = new DocAdmin();
		docadmin.setFID(naid);
		docadmin.setFLeve(fLeve);
		docadmin.setFName(fName);
		docadmin.setVersion(0);
		docadminMapper.insert(docadmin);
		return naid;
	}

	/*
	 * 添加
	 */
	public void addDocAdmin(DocAdmin docadmin) {
		docadminMapper.insert(docadmin);
	}

	/*
	 * 更新
	 */
	public void updateDocAdmin(String fID, int fLeve, String fName) {
		DocAdmin docadmin = docadminMapper.getByPrimaryKey(fID);
		docadmin.setFID(fID);
		docadmin.setFLeve(fLeve);
		docadmin.setFName(fName);
		docadmin.setVersion(docadmin.getVersion() + 1);
		docadminMapper.update(docadmin);
	}

	/*
	 * 更新
	 */
	public void updateDocAdmin(DocAdmin docadmin) {
		docadminMapper.update(docadmin);
	}

	/*
	 * 删除
	 */
	public int deleteDocAdmin(String fID) {
		return docadminMapper.deleteByPrimaryKey(fID);
	}

	/*
	 * 获取指定ID的数据
	 */
	public DocAdmin getDocAdminByFID(String fID) {
		return docadminMapper.getByPrimaryKey(fID);
	}

	/*
	 * 获取所有数据
	 */
	public List<DocAdmin> getDocAdminList() {
		return docadminMapper.getList();
	}
}
