package com.tlv8.system.pojo;

/**
 * 角色权限
 * 
 * @author chenqian
 *
 */
public class SaOpPermission {
	private String sid;// 主键
	private String spermissionroleid;// 角色id
	private String sprocess;// Process
	private String sactivityfname;// 功能路径名称
	private String sactivity;// 功能
	private String sactionsnames;// 动作名称
	private String sactions;// 动作
	private String ssemanticdp;// 语义
	private String spermissionkind;// 语义类别
	private String sdescription;// 描述
	private int ssequence;// 排序
	private int svalidstate;// 使用状态{1,0,-1}
	private int version; // 版本号

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSpermissionroleid() {
		return spermissionroleid;
	}

	public void setSpermissionroleid(String spermissionroleid) {
		this.spermissionroleid = spermissionroleid;
	}

	public String getSprocess() {
		return sprocess;
	}

	public void setSprocess(String sprocess) {
		this.sprocess = sprocess;
	}

	public String getSactivityfname() {
		return sactivityfname;
	}

	public void setSactivityfname(String sactivityfname) {
		this.sactivityfname = sactivityfname;
	}

	public String getSactivity() {
		return sactivity;
	}

	public void setSactivity(String sactivity) {
		this.sactivity = sactivity;
	}

	public String getSactionsnames() {
		return sactionsnames;
	}

	public void setSactionsnames(String sactionsnames) {
		this.sactionsnames = sactionsnames;
	}

	public String getSactions() {
		return sactions;
	}

	public void setSactions(String sactions) {
		this.sactions = sactions;
	}

	public String getSsemanticdp() {
		return ssemanticdp;
	}

	public void setSsemanticdp(String ssemanticdp) {
		this.ssemanticdp = ssemanticdp;
	}

	public String getSpermissionkind() {
		return spermissionkind;
	}

	public void setSpermissionkind(String spermissionkind) {
		this.spermissionkind = spermissionkind;
	}

	public String getSdescription() {
		return sdescription;
	}

	public void setSdescription(String sdescription) {
		this.sdescription = sdescription;
	}

	public int getSsequence() {
		return ssequence;
	}

	public void setSsequence(int ssequence) {
		this.ssequence = ssequence;
	}

	public int getSvalidstate() {
		return svalidstate;
	}

	public void setSvalidstate(int svalidstate) {
		this.svalidstate = svalidstate;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

}
