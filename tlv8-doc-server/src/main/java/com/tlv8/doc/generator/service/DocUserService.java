package com.tlv8.doc.generator.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.doc.generator.mapper.DocUserMapper;
import com.tlv8.doc.generator.pojo.DocUser;

@Service
public class DocUserService {
	@Autowired
	private DocUserMapper docuserMapper;

	public String addDocUser(String fLoginID, String fUserName, int fEnable) {
		String nusid = IDUtils.getGUID();
		DocUser docuser = new DocUser();
		docuser.setFID(nusid);
		docuser.setFLoginID(fLoginID);
		docuser.setFUserName(fUserName);
		docuser.setFEnable(fEnable);
		docuser.setVersion(0);
		docuserMapper.insert(docuser);
		return nusid;
	}

	public void addDocUser(DocUser docuser) {
		docuserMapper.insert(docuser);
	}

	public void updateDocUser(String fID, String fLoginID, String fUserName, int fEnable) {
		DocUser docuser = docuserMapper.getByPrimaryKey(fID);
		docuser.setFLoginID(fLoginID);
		docuser.setFUserName(fUserName);
		docuser.setFEnable(fEnable);
		docuser.setVersion(docuser.getVersion() + 1);
		docuserMapper.update(docuser);
	}

	public int deleteDocUser(String fID) {
		return docuserMapper.deleteByPrimaryKey(fID);
	}

	public int deleteDocUserByLoginID(String fLoginID) {
		return docuserMapper.deleteByLoginID(fLoginID);
	}

	public DocUser getDocUser(String fID) {
		return docuserMapper.getByPrimaryKey(fID);
	}

	public DocUser getDocUserByLoginID(String fLoginID) {
		return docuserMapper.getByLoginID(fLoginID);
	}

	public List<DocUser> getDocUserList() {
		return docuserMapper.getList();
	}
}
