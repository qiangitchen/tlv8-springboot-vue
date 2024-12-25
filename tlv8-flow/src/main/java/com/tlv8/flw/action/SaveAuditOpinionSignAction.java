package com.tlv8.flw.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.CodeUtils;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.flw.base.FlowActivity;
import com.tlv8.flw.base.TaskData;
import com.tlv8.flw.pojo.SaTask;
import com.tlv8.flw.service.SaTaskService;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.help.SessionHelper;
import com.tlv8.system.utils.ContextUtils;

/**
 * 保存审批意见(带签名)
 * 
 * @author 陈乾
 *
 */
@Controller
@Scope("prototype")
public class SaveAuditOpinionSignAction extends ActionSupport {
	private static final Logger logger = LoggerFactory.getLogger(SaveAuditOpinionSignAction.class);
	private String dbkey;
	private String audittable;
	private String billidRe;
	private String agreettextRe;
	private String opinion;
	private String flowid;
	private String taskID;
	private String sdata1;
	private String opviewID;
	private String sign;
	private String remark;
	Data data = new Data();

	public void setData(Data data) {
		this.data = data;
	}

	public Data getData() {
		return this.data;
	}

	@Autowired
	TaskData taskData;
	@Autowired
	SaTaskService taskService;

	@ResponseBody
	@PostMapping("/SaveAuditOpinionSignAction")
	@SuppressWarnings({ "rawtypes" })
	public Object execute() throws Exception {
		Connection conn = null;
		try {
			String FNODEID = "";
			String FNODENAME = "";
			ContextBean context = ContextUtils.getContext();
			String excutorid = null;
			String excutorname = null;
			String currentpsnid = context.getCurrentPersonID();
			String currentpsnname = context.getCurrentPersonName();
			try {
				String processID = taskData.getCurrentProcessID(this.taskID);
				String Activity = taskData.getCurrentActivity(this.taskID);
				FlowActivity flwA = new FlowActivity(processID, Activity);
				FNODEID = flwA.getActivity();
				FNODENAME = flwA.getActivityname();
			} catch (Exception e) {
			}
			try {
				if (this.sign == null || "".equals(this.sign)) {
					String padid = SessionHelper.getPadId(request);
					if (padid != null && !"".equals(padid)) {
						SQL ssql = new SQL();
						ssql.SELECT("SIGN");
						ssql.FROM("oa_person_casn");
						ssql.WHERE("casn='" + padid + "'");
						List<Map<String, String>> sli = DBUtils.execQueryforList("oa", ssql.toString(), true);
						if (sli.size() > 0) {
							this.sign = sli.get(0).get("SIGN");
							this.remark = "移动版签批";
						}
					}
				}
			} catch (Exception e) {
			}
			SaTask saTask = taskService.selectByPrimaryKey(taskID);
			if (saTask != null && StringUtils.isNotEmpty(saTask.getSepersonid())) {
				excutorid = saTask.getSepersonid();
				excutorname = saTask.getSepersonname();
			}
			if ((excutorid != null) && (!"".equals(excutorid)) && (!excutorid.equals(currentpsnid))) {
				currentpsnname = excutorname + "(" + currentpsnname + "代)";
			}
			SQL query = new SQL();
			query.SELECT("FID");
			query.FROM(audittable);
			query.WHERE(billidRe + "='" + sdata1 + "'");
			query.WHERE("FCREATEPERID='" + currentpsnid + "'");
			query.WHERE("FOPVIEWID='" + opviewID + "'");
			query.WHERE("FTASKID='" + taskID + "'");
			List list = DBUtils.execQueryforList(this.dbkey, query.toString(), true);
			conn = DBUtils.getAppConn(this.dbkey);
			if (list.size() > 0) {
				Map m = (Map) list.get(0);
				SQL sql = new SQL();
				sql.UPDATE(audittable);
				sql.SET(agreettextRe + "=?");
				sql.SET("FCREATETIME=?");
				sql.SET("FOPVIEWID=?");
				sql.SET("FSIGN=?");
				sql.SET("fremark=?");
				sql.WHERE("fID=?");
				PreparedStatement ps = conn.prepareStatement(sql.toString());
				ps.setString(1, this.opinion);
				ps.setTimestamp(2, new Timestamp(new Date().getTime()));
				ps.setString(3, this.opviewID);
				ps.setString(4, this.sign);
				ps.setString(5, this.remark);
				ps.setString(6, (String) m.get("FID"));
				ps.executeUpdate();
			} else {
				String opid = IDUtils.getGUID();
				SQL add = new SQL();
				add.INSERT_INTO(audittable);
				add.VALUES("FID", "?");
				add.VALUES("FTASKID", "?");
				add.VALUES("FFLOWID", "?");
				add.VALUES(agreettextRe, "?");
				add.VALUES(billidRe, "?");
				add.VALUES("FCREATEDEPTID", "?");
				add.VALUES("FCREATEDEPTNAME", "?");
				add.VALUES("FCREATEPERID", "?");
				add.VALUES("FCREATEPERNAME", "?");
				add.VALUES("FCREATETIME", "?");
				add.VALUES("FNODEID", "?");
				add.VALUES("FNODENAME", "?");
				add.VALUES("FOPVIEWID", "?");
				add.VALUES("FSIGN", "?");
				add.VALUES("fremark", "?");
				add.VALUES("version", "?");
				PreparedStatement ps = conn.prepareStatement(add.toString());
				ps.setString(1, opid);
				ps.setString(2, this.taskID);
				ps.setString(3, this.flowid);
				ps.setString(4, this.opinion);
				ps.setString(5, this.sdata1);
				ps.setString(6, context.getCurrentDeptID());
				ps.setString(7, context.getCurrentDeptName());
				ps.setString(8, currentpsnid);
				ps.setString(9, currentpsnname);
				ps.setTimestamp(10, new Timestamp(new Date().getTime()));
				if (this.opviewID.equals("chuanyue")) {
					ps.setString(11, context.getCurrentPersonID());
					ps.setString(12, context.getCurrentPersonName());
				} else {
					ps.setString(11, FNODEID);
					ps.setString(12, FNODENAME);
				}
				ps.setString(13, this.opviewID);
				ps.setString(14, this.sign);
				ps.setString(15, this.remark);
				ps.setInt(16, 0);
				ps.executeUpdate();
			}
			this.data.setFlag("true");
		} catch (Exception e) {
			this.data.setFlag("false");
			this.data.setMessage(e.toString());
			logger.error(e.toString());
		} finally {
			DBUtils.closeConn(null, conn, null, null);
		}
		return success(data);
	}

	public String getDbkey() {
		return this.dbkey;
	}

	public void setDbkey(String dbkey) {
		this.dbkey = dbkey;
	}

	public void setAudittable(String audittable) {
		this.audittable = audittable;
	}

	public String getAudittable() {
		return this.audittable;
	}

	public void setOpinion(String opinion) {
		this.opinion = CodeUtils.decodeSpechars(opinion);
	}

	public String getOpinion() {
		return this.opinion;
	}

	public void setFlowid(String flowid) {
		this.flowid = flowid;
	}

	public String getFlowid() {
		return this.flowid;
	}

	public void setBillidRe(String billidRe) {
		this.billidRe = billidRe;
	}

	public String getBillidRe() {
		return this.billidRe;
	}

	public void setAgreettextRe(String agreettextRe) {
		this.agreettextRe = agreettextRe;
	}

	public String getAgreettextRe() {
		return this.agreettextRe;
	}

	public void setTaskID(String taskID) {
		this.taskID = taskID;
	}

	public String getTaskID() {
		return this.taskID;
	}

	public void setOpviewID(String opviewID) {
		this.opviewID = opviewID;
	}

	public String getOpviewID() {
		return this.opviewID;
	}

	public void setSdata1(String sdata1) {
		this.sdata1 = sdata1;
	}

	public String getSdata1() {
		return sdata1;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}