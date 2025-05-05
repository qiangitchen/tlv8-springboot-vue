package com.tlv8.doc.clt.obj;

import com.alibaba.fastjson2.JSONObject;
import com.tlv8.doc.clt.doc.Doc;

public class DocUploadRes {
	private String fileID;
	private String filename;
	private double filesize;
	private String md5;
	private Doc doc;

	public DocUploadRes() {
	}

	public DocUploadRes(Doc doc) {
		this.setDoc(doc);
		this.fileID = doc.getSfileid();
		this.filename = doc.getSdocname();
		this.filesize = doc.getSsize();
	}

	public String getFileID() {
		return fileID;
	}

	public void setFileID(String fileID) {
		this.fileID = fileID;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public double getFilesize() {
		return filesize;
	}

	public void setFilesize(double filesize) {
		this.filesize = filesize;
	}

	public String getMd5() {
		return md5;
	}

	public void setMd5(String md5) {
		this.md5 = md5;
	}

	public Doc getDoc() {
		return doc;
	}

	public void setDoc(Doc doc) {
		this.doc = doc;
	}

	public JSONObject toJson() {
		JSONObject res = new JSONObject();
		res.put("fileID", getFileID());
		res.put("filename", getFilename());
		res.put("filesize", getFilesize());
		res.put("md5", getMd5());
		return res;
	}
}
