package com.tlv8.system.pojo;

import java.util.Date;

/**
 * 组织-角色分配
 * 
 * @author chenqian
 *
 */
public class SaOpAuthorize {
	private String sid;// 主键
	private String sorgid;// 组织id
	private String sorgname;// 组织名称
	private String sorgfid;// 组织全id
	private String sorgfname;// 组织全名称
	private String sauthorizeroleid;// 权限类型id
	private String sdescription;// 描述
	private String screatorfid;// 创建人全id
	private String screatorfname;// 创建人全名称
	private Date screatetime;// 创建时间
	private String srolelevel;// 角色级别
	private int version; // 版本号

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSorgid() {
		return sorgid;
	}

	public void setSorgid(String sorgid) {
		this.sorgid = sorgid;
	}

	public String getSorgname() {
		return sorgname;
	}

	public void setSorgname(String sorgname) {
		this.sorgname = sorgname;
	}

	public String getSorgfid() {
		return sorgfid;
	}

	public void setSorgfid(String sorgfid) {
		this.sorgfid = sorgfid;
	}

	public String getSorgfname() {
		return sorgfname;
	}

	public void setSorgfname(String sorgfname) {
		this.sorgfname = sorgfname;
	}

	public String getSauthorizeroleid() {
		return sauthorizeroleid;
	}

	public void setSauthorizeroleid(String sauthorizeroleid) {
		this.sauthorizeroleid = sauthorizeroleid;
	}

	public String getSdescription() {
		return sdescription;
	}

	public void setSdescription(String sdescription) {
		this.sdescription = sdescription;
	}

	public String getScreatorfid() {
		return screatorfid;
	}

	public void setScreatorfid(String screatorfid) {
		this.screatorfid = screatorfid;
	}

	public String getScreatorfname() {
		return screatorfname;
	}

	public void setScreatorfname(String screatorfname) {
		this.screatorfname = screatorfname;
	}

	public Date getScreatetime() {
		return screatetime;
	}

	public void setScreatetime(Date screatetime) {
		this.screatetime = screatetime;
	}

	public String getSrolelevel() {
		return srolelevel;
	}

	public void setSrolelevel(String srolelevel) {
		this.srolelevel = srolelevel;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

}
