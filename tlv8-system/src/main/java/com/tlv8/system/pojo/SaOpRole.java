package com.tlv8.system.pojo;

/**
 * 角色
 * 
 * @author chenqian
 *
 */
public class SaOpRole {
	private String sid;// 主键
	private String sname;// 名称
	private String scode;// 编号
	private String scatalog;// 目录
	private String srolekind;// 角色类型id
	private String sparentrolesnames;// 父角色名称
	private String sdescription;// 描述
	private int ssequence;// 排序
	private int svalidstate;// 使用状态{1,0,-1}
	private int version;// 版本号

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getScode() {
		return scode;
	}

	public void setScode(String scode) {
		this.scode = scode;
	}

	public String getScatalog() {
		return scatalog;
	}

	public void setScatalog(String scatalog) {
		this.scatalog = scatalog;
	}

	public String getSrolekind() {
		return srolekind;
	}

	public void setSrolekind(String srolekind) {
		this.srolekind = srolekind;
	}

	public String getSparentrolesnames() {
		return sparentrolesnames;
	}

	public void setSparentrolesnames(String sparentrolesnames) {
		this.sparentrolesnames = sparentrolesnames;
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
