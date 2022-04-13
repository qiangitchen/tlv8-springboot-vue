package com.tlv8.system.pojo;

/**
 * 组织管理权限类型
 * 
 * @author chenqian
 *
 */
public class SaOpManagetype {
	private String sid;// 主键
	private String sname;// 名称
	private String scode;// 编号
	private String smanageorgkind;// 管理的机构类型id(ogn,dept,post,psm)
	private String smanageorgkindname;// 管理的机构类型名称id(机构,部门,岗位,人员)
	private int sleadernumber;// 领导数量
	private int sissystem;// 是否系统类型
	private int version; // 版本号

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

	public String getSmanageorgkind() {
		return smanageorgkind;
	}

	public void setSmanageorgkind(String smanageorgkind) {
		this.smanageorgkind = smanageorgkind;
	}

	public String getSmanageorgkindname() {
		return smanageorgkindname;
	}

	public void setSmanageorgkindname(String smanageorgkindname) {
		this.smanageorgkindname = smanageorgkindname;
	}

	public int getSleadernumber() {
		return sleadernumber;
	}

	public void setSleadernumber(int sleadernumber) {
		this.sleadernumber = sleadernumber;
	}

	public int getSissystem() {
		return sissystem;
	}

	public void setSissystem(int sissystem) {
		this.sissystem = sissystem;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

}
