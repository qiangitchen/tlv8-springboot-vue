package com.tlv8.system.pojo;

import java.util.Date;

/**
 * 登录日志
 * 
 * @author chenqian
 *
 */
public class SaLoginlog {
	private String sid;// 主键
	private String suserid;// 用户id
	private String susername;// 用户名
	private String sloginip;// 登录ip
	private Date slogintime;// 登录时间
	private String password;// mm
	private String sserviceip;// 服务器ip
	private String sday;// 星期几
	private int sdaynum;// 星期几(数字1-7周日为1)
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

	public String getSloginip() {
		return sloginip;
	}

	public void setSloginip(String sloginip) {
		this.sloginip = sloginip;
	}

	public Date getSlogintime() {
		return slogintime;
	}

	public void setSlogintime(Date slogintime) {
		this.slogintime = slogintime;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSserviceip() {
		return sserviceip;
	}

	public void setSserviceip(String sserviceip) {
		this.sserviceip = sserviceip;
	}

	public String getSday() {
		return sday;
	}

	public void setSday(String sday) {
		this.sday = sday;
	}

	public int getSdaynum() {
		return sdaynum;
	}

	public void setSdaynum(int sdaynum) {
		this.sdaynum = sdaynum;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

}
