package com.tlv8.doc.generator.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.doc.generator.mapper.DocDocPathMapper;
import com.tlv8.doc.generator.pojo.DocDocPath;

@Service
public class DocDocPathService {
	@Autowired
	private DocDocPathMapper docdocpathMapper;

	public String addDocDocPath(String fFileID, String fFilePath, float fFileSize, int fVersion) {
		String ndpid = IDUtils.getGUID();
		DocDocPath docpath = new DocDocPath();
		docpath.setFID(ndpid);
		docpath.setFFileID(fFileID);
		docpath.setFFilePath(fFilePath);
		docpath.setFFileSize(fFileSize);
		docpath.setFVersion(fVersion);
		docpath.setFAddTime(new Date());
		docpath.setVersion(0);
		docdocpathMapper.insert(docpath);
		return ndpid;
	}

	public void addDocDocPath(DocDocPath docpath) {
		docdocpathMapper.insert(docpath);
	}

	public void updateDocDocPath(String fID, String fFileID, String fFilePath, float fFileSize, int fVersion) {
		DocDocPath docpath = docdocpathMapper.getByPrimaryKey(fID);
		docpath.setFFileID(fFileID);
		docpath.setFFilePath(fFilePath);
		docpath.setFFileSize(fFileSize);
		docpath.setFVersion(fVersion);
		docpath.setFAddTime(new Date());
		docpath.setVersion(docpath.getVersion() + 1);
		docdocpathMapper.update(docpath);
	}

	public void updateDocDocPath(DocDocPath docpath) {
		docdocpathMapper.update(docpath);
	}

	public int deleteDocDocPath(String fID) {
		return docdocpathMapper.deleteByPrimaryKey(fID);
	}

	public int deleteDocDocPathByFileID(String fFileID) {
		return docdocpathMapper.deleteByFileID(fFileID);
	}

	public DocDocPath getDocDocPath(String fID) {
		return docdocpathMapper.getByPrimaryKey(fID);
	}

	public DocDocPath getDocDocPathByFileID(String fFileID) {
		return docdocpathMapper.getByFileID(fFileID);
	}

	public List<DocDocPath> getDocDocPathList() {
		return docdocpathMapper.getList();
	}

	public List<DocDocPath> getDocDocPathListByFileID(String fFileID) {
		return docdocpathMapper.getListByFileID(fFileID);
	}

	public DocDocPath getDocDocPathByFileIDVersion(String fFileID, long fVersion) {
		List<DocDocPath> flist = getDocDocPathListByFileID(fFileID);
		long maxversion = 1;
		DocDocPath rdpath = flist.get(0);
		for (int i = 0; i < flist.size(); i++) {
			if (flist.get(i).getFVersion() > maxversion) {
				maxversion = flist.get(i).getFVersion();
				rdpath = flist.get(i);
			}
			if (flist.get(i).getFVersion() == fVersion) {
				return flist.get(i);
			}
		}
		return rdpath;
	}

}
