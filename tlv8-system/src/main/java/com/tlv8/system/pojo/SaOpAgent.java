package com.tlv8.system.pojo;

import java.util.Date;

/**
 * 用户代理
 * 
 * @author chenqian
 *
 */
public class SaOpAgent {
	private String sid;// 主键
	private String sorgfid;// 机构路径id
	private String sorgfname;// 机构路径名称
	private String sagentid;// 授权代理人id
	private int svalidstate;// 使用状态{1,0,-1}
	private Date sstarttime;// 开始时间
	private Date sfinishtime;// 结束时间
	private String sprocess;// 代理模块
	private String screatorid;// 创建人id
	private String screatorname;// 创建人名称
	private Date SCREATETIME;// 创建时间
	private String scantranagent;//
	private int version; // 版本号

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
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

	public String getSagentid() {
		return sagentid;
	}

	public void setSagentid(String sagentid) {
		this.sagentid = sagentid;
	}

	public int getSvalidstate() {
		return svalidstate;
	}

	public void setSvalidstate(int svalidstate) {
		this.svalidstate = svalidstate;
	}

	public Date getSstarttime() {
		return sstarttime;
	}

	public void setSstarttime(Date sstarttime) {
		this.sstarttime = sstarttime;
	}

	public Date getSfinishtime() {
		return sfinishtime;
	}

	public void setSfinishtime(Date sfinishtime) {
		this.sfinishtime = sfinishtime;
	}

	public String getSprocess() {
		return sprocess;
	}

	public void setSprocess(String sprocess) {
		this.sprocess = sprocess;
	}

	public String getScreatorid() {
		return screatorid;
	}

	public void setScreatorid(String screatorid) {
		this.screatorid = screatorid;
	}

	public String getScreatorname() {
		return screatorname;
	}

	public void setScreatorname(String screatorname) {
		this.screatorname = screatorname;
	}

	public Date getSCREATETIME() {
		return SCREATETIME;
	}

	public void setSCREATETIME(Date sCREATETIME) {
		SCREATETIME = sCREATETIME;
	}

	public String getScantranagent() {
		return scantranagent;
	}

	public void setScantranagent(String scantranagent) {
		this.scantranagent = scantranagent;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

}
