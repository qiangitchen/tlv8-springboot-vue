package com.tlv8.system.pojo;

import java.util.Date;

/**
 * 人员信息
 * 
 * @author chenqian
 *
 */
public class SaOpPerson {
	private String sid;// 主键
	private String sname;// 名称
	private String scode;// 编号
	private String sidcard;// 身份证号
	private int snumb;// 年龄
	private String sloginname;// 登录名
	private String spassword;// 密码（MD5）
	private int spasswordtimelimit;// 密码超时天数
	private Date spasswordmodifytime;// 密码修改时间
	private Date smainorgid;// 组织id
	private Date ssafelevelid;// 安全级别id
	private int ssequence;// 排序
	private int svalidstate;// 使用状态{1,0,-1}
	private String sdescription;// 描述
	private String ssex;// 性别
	private Date sbirthday;// 生日
	private Date sjoindate;// 参加工作的时间
	private String shomeplace;// 住址
	private String sdegree;// 学历
	private String sgraduateschool;// 毕业学校
	private String sspeciality;// 专业
	private String sschoollength;// 学制
	private String stitle;// 标题
	private String smarriage;// 婚姻
	private String scardno;// 工牌卡号
	private String scardkind;// 卡片类型
	private String sfamilyaddress;// 家庭住址
	private String szip;// 邮编
	private String smsn;// MSN
	private String sqq;// QQ
	private String smail;// 邮箱
	private String smobilephone;// 手机号
	private String sfamilyphone;// 家庭电话
	private String sofficephone;// 办公电话
	private int version;// 版本号
	private byte[] sphoto;// 照片
	private String scountry;// 国籍
	private String sprovince;// 省
	private String scity;// 市
	private String spositions;// 位置
	private String sschool;// 中学
	private String sstudy;// 学习
	private String senglishname;// 英文名
	private String fcasn;// 签名
	private String fsignm;// 签名编号

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

	public String getSidcard() {
		return sidcard;
	}

	public void setSidcard(String sidcard) {
		this.sidcard = sidcard;
	}

	public int getSnumb() {
		return snumb;
	}

	public void setSnumb(int snumb) {
		this.snumb = snumb;
	}

	public String getSloginname() {
		return sloginname;
	}

	public void setSloginname(String sloginname) {
		this.sloginname = sloginname;
	}

	public String getSpassword() {
		return spassword;
	}

	public void setSpassword(String spassword) {
		this.spassword = spassword;
	}

	public int getSpasswordtimelimit() {
		return spasswordtimelimit;
	}

	public void setSpasswordtimelimit(int spasswordtimelimit) {
		this.spasswordtimelimit = spasswordtimelimit;
	}

	public Date getSpasswordmodifytime() {
		return spasswordmodifytime;
	}

	public void setSpasswordmodifytime(Date spasswordmodifytime) {
		this.spasswordmodifytime = spasswordmodifytime;
	}

	public Date getSmainorgid() {
		return smainorgid;
	}

	public void setSmainorgid(Date smainorgid) {
		this.smainorgid = smainorgid;
	}

	public Date getSsafelevelid() {
		return ssafelevelid;
	}

	public void setSsafelevelid(Date ssafelevelid) {
		this.ssafelevelid = ssafelevelid;
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

	public String getSdescription() {
		return sdescription;
	}

	public void setSdescription(String sdescription) {
		this.sdescription = sdescription;
	}

	public String getSsex() {
		return ssex;
	}

	public void setSsex(String ssex) {
		this.ssex = ssex;
	}

	public Date getSbirthday() {
		return sbirthday;
	}

	public void setSbirthday(Date sbirthday) {
		this.sbirthday = sbirthday;
	}

	public Date getSjoindate() {
		return sjoindate;
	}

	public void setSjoindate(Date sjoindate) {
		this.sjoindate = sjoindate;
	}

	public String getShomeplace() {
		return shomeplace;
	}

	public void setShomeplace(String shomeplace) {
		this.shomeplace = shomeplace;
	}

	public String getSdegree() {
		return sdegree;
	}

	public void setSdegree(String sdegree) {
		this.sdegree = sdegree;
	}

	public String getSgraduateschool() {
		return sgraduateschool;
	}

	public void setSgraduateschool(String sgraduateschool) {
		this.sgraduateschool = sgraduateschool;
	}

	public String getSspeciality() {
		return sspeciality;
	}

	public void setSspeciality(String sspeciality) {
		this.sspeciality = sspeciality;
	}

	public String getSschoollength() {
		return sschoollength;
	}

	public void setSschoollength(String sschoollength) {
		this.sschoollength = sschoollength;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getSmarriage() {
		return smarriage;
	}

	public void setSmarriage(String smarriage) {
		this.smarriage = smarriage;
	}

	public String getScardno() {
		return scardno;
	}

	public void setScardno(String scardno) {
		this.scardno = scardno;
	}

	public String getScardkind() {
		return scardkind;
	}

	public void setScardkind(String scardkind) {
		this.scardkind = scardkind;
	}

	public String getSfamilyaddress() {
		return sfamilyaddress;
	}

	public void setSfamilyaddress(String sfamilyaddress) {
		this.sfamilyaddress = sfamilyaddress;
	}

	public String getSzip() {
		return szip;
	}

	public void setSzip(String szip) {
		this.szip = szip;
	}

	public String getSmsn() {
		return smsn;
	}

	public void setSmsn(String smsn) {
		this.smsn = smsn;
	}

	public String getSqq() {
		return sqq;
	}

	public void setSqq(String sqq) {
		this.sqq = sqq;
	}

	public String getSmail() {
		return smail;
	}

	public void setSmail(String smail) {
		this.smail = smail;
	}

	public String getSmobilephone() {
		return smobilephone;
	}

	public void setSmobilephone(String smobilephone) {
		this.smobilephone = smobilephone;
	}

	public String getSfamilyphone() {
		return sfamilyphone;
	}

	public void setSfamilyphone(String sfamilyphone) {
		this.sfamilyphone = sfamilyphone;
	}

	public String getSofficephone() {
		return sofficephone;
	}

	public void setSofficephone(String sofficephone) {
		this.sofficephone = sofficephone;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public byte[] getSphoto() {
		return sphoto;
	}

	public void setSphoto(byte[] sphoto) {
		this.sphoto = sphoto;
	}

	public String getScountry() {
		return scountry;
	}

	public void setScountry(String scountry) {
		this.scountry = scountry;
	}

	public String getSprovince() {
		return sprovince;
	}

	public void setSprovince(String sprovince) {
		this.sprovince = sprovince;
	}

	public String getScity() {
		return scity;
	}

	public void setScity(String scity) {
		this.scity = scity;
	}

	public String getSpositions() {
		return spositions;
	}

	public void setSpositions(String spositions) {
		this.spositions = spositions;
	}

	public String getSschool() {
		return sschool;
	}

	public void setSschool(String sschool) {
		this.sschool = sschool;
	}

	public String getSstudy() {
		return sstudy;
	}

	public void setSstudy(String sstudy) {
		this.sstudy = sstudy;
	}

	public String getSenglishname() {
		return senglishname;
	}

	public void setSenglishname(String senglishname) {
		this.senglishname = senglishname;
	}

	public String getFcasn() {
		return fcasn;
	}

	public void setFcasn(String fcasn) {
		this.fcasn = fcasn;
	}

	public String getFsignm() {
		return fsignm;
	}

	public void setFsignm(String fsignm) {
		this.fsignm = fsignm;
	}

}
