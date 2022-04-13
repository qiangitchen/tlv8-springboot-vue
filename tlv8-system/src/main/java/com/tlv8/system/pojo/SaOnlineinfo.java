package com.tlv8.system.pojo;

import java.util.Date;

/**
 * 在线用户信息
 * 
 * @author chenqian
 *
 */
public class SaOnlineinfo {
	private String sid;// 主键
	private String suserid;// 用户id
	private String susername;// 用户名
	private String suserfid;// 用户全id
	private String suserfname;// 用户全名称
	private String sloginip;// 登录ip
	private Date slogindate;// 登录时间
	private String ssessionid;//
	private String sserviceip;// 服务器ip
	private String smachinecode;// 机器编号
	private int version; // 版本号

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSuserid() {
		return suserid;
	}

	public void setSuserid(String suserid) {
		this.suserid = suserid;
	}

	public String getSusername() {
		return susername;
	}

	public void setSusername(String susername) {
		this.susername = susername;
	}

	public String getSuserfid() {
		return suserfid;
	}

	public void setSuserfid(String suserfid) {
		this.suserfid = suserfid;
	}

	public String getSuserfname() {
		return suserfname;
	}

	public void setSuserfname(String suserfname) {
		this.suserfname = suserfname;
	}

	public String getSloginip() {
		return sloginip;
	}

	public void setSloginip(String sloginip) {
		this.sloginip = sloginip;
	}

	public Date getSlogindate() {
		return slogindate;
	}

	public void setSlogindate(Date slogindate) {
		this.slogindate = slogindate;
	}

	public String getSsessionid() {
		return ssessionid;
	}

	public void setSsessionid(String ssessionid) {
		this.ssessionid = ssessionid;
	}

	public String getSserviceip() {
		return sserviceip;
	}

	public void setSserviceip(String sserviceip) {
		this.sserviceip = sserviceip;
	}

	public String getSmachinecode() {
		return smachinecode;
	}

	public void setSmachinecode(String smachinecode) {
		this.smachinecode = smachinecode;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

}
