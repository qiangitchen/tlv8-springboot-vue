package com.tlv8.system.pojo;

import java.util.Date;

/**
 * 组织管理权限
 * 
 * @author chenqian
 *
 */
public class SaOpManagement {
	private String sid;// 主键
	private String sorgid;// 组织id
	private String sorgname;// 组织名称
	private String sorgfid;// 组织全id
	private String sorgfname;// 组织全名称
	private String smanageorgid;// 管理的组织id
	private String smanageorgname;// 管理的组织名称
	private String smanageorgfid;// 管理的组织全id
	private String smanageorgfname;// 管理的组织全名称
	private String smanagetypeid;// 管理类型id
	private String screatorfid;// 创建人全id
	private String screatorfname;// 创建人全名称
	private Date screatetime;// 创建时间
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

	public String getSmanageorgid() {
		return smanageorgid;
	}

	public void setSmanageorgid(String smanageorgid) {
		this.smanageorgid = smanageorgid;
	}

	public String getSmanageorgname() {
		return smanageorgname;
	}

	public void setSmanageorgname(String smanageorgname) {
		this.smanageorgname = smanageorgname;
	}

	public String getSmanageorgfid() {
		return smanageorgfid;
	}

	public void setSmanageorgfid(String smanageorgfid) {
		this.smanageorgfid = smanageorgfid;
	}

	public String getSmanageorgfname() {
		return smanageorgfname;
	}

	public void setSmanageorgfname(String smanageorgfname) {
		this.smanageorgfname = smanageorgfname;
	}

	public String getSmanagetypeid() {
		return smanagetypeid;
	}

	public void setSmanagetypeid(String smanagetypeid) {
		this.smanagetypeid = smanagetypeid;
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

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

}
