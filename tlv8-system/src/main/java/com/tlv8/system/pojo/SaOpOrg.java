package com.tlv8.system.pojo;

/**
 * 组织机构
 * 
 * @author chenqian
 *
 */
public class SaOpOrg {
	private String sid;// 主键
	private String sname;// 名称
	private String scode;// 编号
	private String slongname;// 全名
	private String sfname;// 名称路径“1/2/3”
	private String sfcode;// 编号路径
	private String sfid;// 主键路径
	private String sorgkindid; // 组织类型{ogn,dpt,pos,psm}
	private int svalidstate;// 使用状态{1,0,-1}
	private String sparent;// 父id
	private int slevel;// 层级
	private String sphone;// 电话
	private String sfax;// 传真
	private String saddress;// 地址
	private String szip;// 邮编
	private String sdescription;// 描述
	private String spersonid; // 人员id-类型为psm时有值
	private String snodekind;// 节点类型
	private int version; // 版本号
	private String sshowname; // 展示名称（一般为空）
	private int ssequence; // 排序

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

	public String getSlongname() {
		return slongname;
	}

	public void setSlongname(String slongname) {
		this.slongname = slongname;
	}

	public String getSfname() {
		return sfname;
	}

	public void setSfname(String sfname) {
		this.sfname = sfname;
	}

	public String getSfcode() {
		return sfcode;
	}

	public void setSfcode(String sfcode) {
		this.sfcode = sfcode;
	}

	public String getSfid() {
		return sfid;
	}

	public void setSfid(String sfid) {
		this.sfid = sfid;
	}

	public String getSorgkindid() {
		return sorgkindid;
	}

	public void setSorgkindid(String sorgkindid) {
		this.sorgkindid = sorgkindid;
	}

	public int getSvalidstate() {
		return svalidstate;
	}

	public void setSvalidstate(int svalidstate) {
		this.svalidstate = svalidstate;
	}

	public String getSparent() {
		return sparent;
	}

	public void setSparent(String sparent) {
		this.sparent = sparent;
	}

	public int getSlevel() {
		return slevel;
	}

	public void setSlevel(int slevel) {
		this.slevel = slevel;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSfax() {
		return sfax;
	}

	public void setSfax(String sfax) {
		this.sfax = sfax;
	}

	public String getSaddress() {
		return saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}

	public String getSzip() {
		return szip;
	}

	public void setSzip(String szip) {
		this.szip = szip;
	}

	public String getSdescription() {
		return sdescription;
	}

	public void setSdescription(String sdescription) {
		this.sdescription = sdescription;
	}

	public String getSpersonid() {
		return spersonid;
	}

	public void setSpersonid(String spersonid) {
		this.spersonid = spersonid;
	}

	public String getSnodekind() {
		return snodekind;
	}

	public void setSnodekind(String snodekind) {
		this.snodekind = snodekind;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getSshowname() {
		return sshowname;
	}

	public void setSshowname(String sshowname) {
		this.sshowname = sshowname;
	}

	public int getSsequence() {
		return ssequence;
	}

	public void setSsequence(int ssequence) {
		this.ssequence = ssequence;
	}

}
