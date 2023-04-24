package com.tlv8.doc.generator.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.doc.generator.mapper.DocAuthorMapper;
import com.tlv8.doc.generator.pojo.DocAuthor;

@Service
public class DocAuthorService {
	
	@Autowired
	private  DocAuthorMapper docauthorMapper;

	public  String addDocAuthor(String fUserID, int fAmLeve) {
		String nauid = IDUtils.getGUID();
		DocAuthor docauthor = new DocAuthor();
		docauthor.setFID(nauid);
		docauthor.setFUserID(fUserID);
		docauthor.setFAmLeve(fAmLeve);
		docauthor.setVersion(0);
		docauthorMapper.insert(docauthor);
		return nauid;
	}

	public  void addDocAuthor(DocAuthor docauthor) {
		docauthorMapper.insert(docauthor);
	}

	public  void updateDocAuthor(String fID, String fUserID, int fAmLeve) {
		DocAuthor docauthor = docauthorMapper.getByPrimaryKey(fID);
		docauthor.setFUserID(fUserID);
		docauthor.setFAmLeve(fAmLeve);
		docauthor.setVersion(docauthor.getVersion() + 1);
		docauthorMapper.update(docauthor);
	}

	public  void updateDocAuthor(DocAuthor docauthor) {
		docauthorMapper.update(docauthor);
	}

	public  int deleteDocAuthor(String fID) {
		return docauthorMapper.deleteByPrimaryKey(fID);
	}

	public  int deleteDocAuthorByUserID(String fUserID) {
		return docauthorMapper.deleteByUserID(fUserID);
	}

	public  DocAuthor getDocAuthor(String fID) {
		return docauthorMapper.getByPrimaryKey(fID);
	}

	public  DocAuthor getDocAuthorByUserID(String fUserID) {
		return docauthorMapper.getByUserID(fUserID);
	}

	public  List<DocAuthor> getDocAuthorList() {
		return docauthorMapper.getList();
	}
}
