package com.tlv8.oa.mail;

import java.net.URLDecoder;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.oa.pojo.OaEmReceiveemail;
import com.tlv8.oa.pojo.OaEmSendemail;
import com.tlv8.oa.service.OaEmReceiveemailService;
import com.tlv8.oa.service.OaEmSendemailService;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;

/**
 * 保存 发送 邮件
 */
@Controller
@Scope("prototype")
public class SendMailAction extends ActionSupport {
	private String fconsigneeid;
	private String fconsigneecode;
	private String fconsignee;
	private String femailname;
	private String fjinfo;
	private String ftext;
	private String actype;
	private String rowid;

	@Autowired
	OaEmSendemailService oaEmSendemailService;

	@Autowired
	OaEmReceiveemailService oaEmReceiveemailService;

	@ResponseBody
	@RequestMapping("/sendMailAction")
	public Object execute() throws Exception {
		Data data = new Data();
		String newid = IDUtils.getGUID();
		String cuID = newid;
		ContextBean context = ContextUtils.getContext();
		String personid = context.getPersonID();
		String personcode = context.getPersonCode();
		String personname = context.getPersonName();
		String ognname = context.getCurrentOgnName();
		String deptname = context.getCurrentDeptName();
		try {
			boolean ishave = false;
			if (rowid != null && !"".equals(rowid)) {
				ishave = true;
				cuID = rowid;
			}
			setRowid(cuID);
			if (ishave) {
				OaEmSendemail oaEmSendemail = oaEmSendemailService.getById(rowid);
				oaEmSendemail.setFemailname(femailname);
				oaEmSendemail.setFconsigneeid(fconsigneeid);
				oaEmSendemail.setFconsigneecode(fconsigneecode);
				oaEmSendemail.setFconsignee(fconsignee);
				oaEmSendemail.setFtext(ftext);
				oaEmSendemailService.updateById(oaEmSendemail);
			} else {
				OaEmSendemail oaEmSendemail = new OaEmSendemail();
				oaEmSendemail.setFid(newid);
				oaEmSendemail.setFcreattime(new Date());
				oaEmSendemail.setFemailname(femailname);
				oaEmSendemail.setFconsigneeid(fconsigneeid);
				oaEmSendemail.setFconsigneecode(fconsigneecode);
				oaEmSendemail.setFconsignee(fconsignee);
				oaEmSendemail.setFtext(ftext);
				oaEmSendemail.setFsendperid(personid);
				oaEmSendemail.setFsendpercode(personcode);
				oaEmSendemail.setFsendpername(personname);
				oaEmSendemail.setFsendogn(ognname);
				oaEmSendemail.setFsenddept(deptname);
				oaEmSendemail.setFfjid(fjinfo);
				oaEmSendemail.setFstate("已保存");
				oaEmSendemail.setVersion(0);
				oaEmSendemailService.save(oaEmSendemail);
			}
			if ("send".equals(actype)) {
				String[] revicePerID = fconsigneeid.split(",");
				String[] revicePerName = fconsignee.split(",");
				int sendCount = revicePerID.length;
				Date sendDate = new Date();
				for (int i = 0; i < sendCount; i++) {
					OaEmReceiveemail oaEmReceiveemail = new OaEmReceiveemail();
					oaEmReceiveemail.setFid(IDUtils.getGUID());
					oaEmReceiveemail.setFsendtime(sendDate);
					oaEmReceiveemail.setFemailname(femailname);
					oaEmReceiveemail.setFconsigneeid(revicePerID[i]);
					oaEmReceiveemail.setFconsigneecode("");
					oaEmReceiveemail.setFconsignee(revicePerName[i]);
					oaEmReceiveemail.setFtext(ftext);
					oaEmReceiveemail.setFreplystate("未回复");
					oaEmReceiveemail.setFqurey("未查看");
					oaEmReceiveemail.setFsendperid(personid);
					oaEmReceiveemail.setFsendpercode(personcode);
					oaEmReceiveemail.setFsendpername(personname);
					oaEmReceiveemail.setFsendogn(ognname);
					oaEmReceiveemail.setFsenddept(deptname);
					oaEmReceiveemail.setFfjid(fjinfo);
					oaEmReceiveemailService.save(oaEmReceiveemail);
				}
				LambdaUpdateWrapper<OaEmSendemail> wrapper = Wrappers.lambdaUpdate(OaEmSendemail.class);
				wrapper.set(OaEmSendemail::getFsendtime, sendDate);
				wrapper.set(OaEmSendemail::getFstate, "已发送");
				wrapper.eq(OaEmSendemail::getFid, cuID);
				oaEmSendemailService.update(wrapper);
			}
			data.setRowid(cuID);
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return success(data);
	}

	public String getFconsigneeid() {
		return fconsigneeid;
	}

	public void setFconsigneeid(String fconsigneeid) {
		try {
			this.fconsigneeid = URLDecoder.decode(fconsigneeid, "UTF-8");
		} catch (Exception e) {
			this.fconsigneeid = fconsigneeid;
		}
	}

	public String getFconsigneecode() {
		return fconsigneecode;
	}

	public void setFconsigneecode(String fconsigneecode) {
		try {
			this.fconsigneecode = URLDecoder.decode(fconsigneecode, "UTF-8");
		} catch (Exception e) {
			this.fconsigneecode = fconsigneecode;
		}
	}

	public String getFconsignee() {
		return fconsignee;
	}

	public void setFconsignee(String fconsignee) {
		try {
			this.fconsignee = URLDecoder.decode(fconsignee, "UTF-8");
		} catch (Exception e) {
			this.fconsignee = fconsignee;
		}
	}

	public String getFemailname() {
		return femailname;
	}

	public void setFemailname(String femailname) {
		try {
			this.femailname = URLDecoder.decode(femailname, "UTF-8");
		} catch (Exception e) {
			this.femailname = femailname;
		}
	}

	public String getFtext() {
		return ftext;
	}

	public void setFtext(String ftext) {
		try {
			this.ftext = URLDecoder.decode(ftext, "UTF-8");
		} catch (Exception e) {
			this.ftext = ftext;
		}
	}

	public String getActype() {
		return actype;
	}

	public void setActype(String actype) {
		this.actype = actype;
	}

	public void setRowid(String rowid) {
		this.rowid = rowid;
	}

	public String getRowid() {
		return rowid;
	}

	public void setFjinfo(String fjinfo) {
		try {
			this.fjinfo = URLDecoder.decode(fjinfo, "UTF-8");
		} catch (Exception e) {
			this.fjinfo = fjinfo;
		}
	}

	public String getFjinfo() {
		return fjinfo;
	}

}
