package com.tlv8.system.pojo;

import java.util.Date;

/**
 * 系统日志
 * 
 * @author chenqian
 *
 */
public class SaLog {
	private String sid;// 主键
	private String stypename;// 类型名称
	private String sdescription;// 描述
	private String sprocess;// Process
	private String sprocessname;// 模块名称
	private String sactivity;// 功能
	private String sactivityname;// 功能名称
	private String saction;// 动作
	private String sactionname;// 动作名称
	private String sstatusname;// 状态名称
	private Date screatetime;// 创建时间
	private String screatorfid;// 创建人全id
	private String screatorfname;// 创建人全名称
	private String screatorpersonid;// 创建人id
	private String screatorpersonname;// 创建人名称
	private String screatorposid;// 创建人岗位id
	private String screatorposname;// 创建人岗位
	private String screatordeptid;// 创建人部门id
	private String screatordeptname;// 创建人部门
	private String screatorognid;// 创建人机构id
	private String screatorognname;// 创建人机构
	private String sip;// 客户端IP
	private String sdevicetype;// 终端类型
	private String soperatingsystem;// 操作系统
	private int version; // 版本号

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getStypename() {
		return stypename;
	}

	public void setStypename(String stypename) {
		this.stypename = stypename;
	}

	public String getSdescription() {
		return sdescription;
	}

	public void setSdescription(String sdescription) {
		this.sdescription = sdescription;
	}

	public String getSprocess() {
		return sprocess;
	}

	public void setSprocess(String sprocess) {
		this.sprocess = sprocess;
	}

	public String getSprocessname() {
		return sprocessname;
	}

	public void setSprocessname(String sprocessname) {
		this.sprocessname = sprocessname;
	}

	public String getSactivity() {
		return sactivity;
	}

	public void setSactivity(String sactivity) {
		this.sactivity = sactivity;
	}

	public String getSactivityname() {
		return sactivityname;
	}

	public void setSactivityname(String sactivityname) {
		this.sactivityname = sactivityname;
	}

	public String getSaction() {
		return saction;
	}

	public void setSaction(String saction) {
		this.saction = saction;
	}

	public String getSactionname() {
		return sactionname;
	}

	public void setSactionname(String sactionname) {
		this.sactionname = sactionname;
	}

	public String getSstatusname() {
		return sstatusname;
	}

	public void setSstatusname(String sstatusname) {
		this.sstatusname = sstatusname;
	}

	public Date getScreatetime() {
		return screatetime;
	}

	public void setScreatetime(Date screatetime) {
		this.screatetime = screatetime;
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

	public String getScreatorpersonid() {
		return screatorpersonid;
	}

	public void setScreatorpersonid(String screatorpersonid) {
		this.screatorpersonid = screatorpersonid;
	}

	public String getScreatorpersonname() {
		return screatorpersonname;
	}

	public void setScreatorpersonname(String screatorpersonname) {
		this.screatorpersonname = screatorpersonname;
	}

	public String getScreatorposid() {
		return screatorposid;
	}

	public void setScreatorposid(String screatorposid) {
		this.screatorposid = screatorposid;
	}

	public String getScreatorposname() {
		return screatorposname;
	}

	public void setScreatorposname(String screatorposname) {
		this.screatorposname = screatorposname;
	}

	public String getScreatordeptid() {
		return screatordeptid;
	}

	public void setScreatordeptid(String screatordeptid) {
		this.screatordeptid = screatordeptid;
	}

	public String getScreatordeptname() {
		return screatordeptname;
	}

	public void setScreatordeptname(String screatordeptname) {
		this.screatordeptname = screatordeptname;
	}

	public String getScreatorognid() {
		return screatorognid;
	}

	public void setScreatorognid(String screatorognid) {
		this.screatorognid = screatorognid;
	}

	public String getScreatorognname() {
		return screatorognname;
	}

	public void setScreatorognname(String screatorognname) {
		this.screatorognname = screatorognname;
	}

	public String getSip() {
		return sip;
	}

	public void setSip(String sip) {
		this.sip = sip;
	}

	public String getSdevicetype() {
		return sdevicetype;
	}

	public void setSdevicetype(String sdevicetype) {
		this.sdevicetype = sdevicetype;
	}

	public String getSoperatingsystem() {
		return soperatingsystem;
	}

	public void setSoperatingsystem(String soperatingsystem) {
		this.soperatingsystem = soperatingsystem;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

}
