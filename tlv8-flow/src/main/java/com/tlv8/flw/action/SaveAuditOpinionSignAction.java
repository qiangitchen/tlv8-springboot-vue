package com.tlv8.flw.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.flw.base.FlowActivity;
import com.tlv8.flw.base.TaskData;
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

	@ResponseBody
	@RequestMapping("/SaveAuditOpinionSignAction")
	@SuppressWarnings({ "rawtypes", "deprecation" })
	public Object execute() throws Exception {
		SqlSession session = DBUtils.getSession(this.dbkey);
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
						List<Map<String, String>> sli = DBUtils.execQueryforList("oa",
								"select SIGN from oa_person_casn where casn='" + padid + "'");
						if (sli.size() > 0) {
							this.sign = sli.get(0).get("SIGN");
							this.remark = "移动版签批";
						}
					}
				}
			} catch (Exception e) {
			}
			String tsSql = "select SEPERSONID,SEPERSONNAME from SA_TASK where SID = '" + this.taskID
					+ "' and SEPERSONID is not null";
			List tslist = DBUtils.execQueryforList("system", tsSql);
			if (tslist.size() > 0) {
				excutorid = (String) ((Map) tslist.get(0)).get("SEPERSONID");
				excutorname = (String) ((Map) tslist.get(0)).get("SEPERSONNAME");
			}
			if ((excutorid != null) && (!"".equals(excutorid)) && (!excutorid.equals(currentpsnid))) {
				currentpsnname = excutorname + "(" + currentpsnname + "代)";
			}
			String sql = "select FID from " + this.audittable + " where " + this.billidRe + " = " + "'" + this.sdata1
					+ "' and FCREATEPERID='" + currentpsnid + "' and FOPVIEWID='" + this.opviewID + "' and FTASKID = '"
					+ this.taskID + "'";
			List list = DBUtils.execQueryforList(this.dbkey, sql);
			conn = session.getConnection();
			if (list.size() > 0) {
				Map m = (Map) list.get(0);
				sql = "update " + this.audittable + " set " + this.agreettextRe
						+ "=?, FCREATETIME = ?,FOPVIEWID=?,FSIGN=?,fremark=? where fID=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, this.opinion);
				ps.setTimestamp(2, new Timestamp(new Date().getTime()));
				ps.setString(3, this.opviewID);
				ps.setString(4, this.sign);
				ps.setString(5, this.remark);
				ps.setString(6, (String) m.get("FID"));
				ps.executeUpdate();
			} else {
				String opid = IDUtils.getGUID();
				if (this.opviewID.equals("chuanyue")) {
					sql = "insert into " + this.audittable + "(FID,FTASKID,FFLOWID," + this.agreettextRe + ","
							+ this.billidRe + ",FCREATEDEPTID,FCREATEDEPTNAME,FCREATEPERID,FCREATEPERNAME,FCREATETIME"
							+ ",FNODEID,FNODENAME,FOPVIEWID,FSIGN,fremark,version)values('" + opid + "','" + this.taskID
							+ "','" + this.flowid + "',?,'" + this.sdata1 + "','" + context.getCurrentDeptID() + "','"
							+ context.getCurrentDeptName() + "','" + context.getCurrentPersonID() + "','"
							+ context.getCurrentPersonName() + "',?,'" + FNODEID + "','" + FNODENAME + "',?,?,?,0)";
				} else {
					sql = "insert into " + this.audittable + "(FID,FTASKID,FFLOWID," + this.agreettextRe + ","
							+ this.billidRe + ",FCREATEDEPTID,FCREATEDEPTNAME,FCREATEPERID,FCREATEPERNAME,FCREATETIME"
							+ ",FNODEID,FNODENAME,FOPVIEWID,FSIGN,fremark,version)values('" + opid + "','" + this.taskID
							+ "','" + this.flowid + "',?,'" + this.sdata1 + "','" + context.getCurrentDeptID() + "','"
							+ context.getCurrentDeptName() + "','" + currentpsnid + "','" + currentpsnname + "',?,'"
							+ FNODEID + "','" + FNODENAME + "',?,?,?,0)";
				}
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, this.opinion);
				ps.setTimestamp(2, new Timestamp(new Date().getTime()));
				ps.setString(3, this.opviewID);
				ps.setString(4, this.sign);
				ps.setString(5, this.remark);
				ps.executeUpdate();
			}
			session.commit(true);
			this.data.setFlag("true");
		} catch (Exception e) {
			this.data.setFlag("false");
			this.data.setMessage(e.toString());
			session.rollback(true);
			logger.error(e.toString());
		} finally {
			DBUtils.closeConn(session, conn, null, null);
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
		try {
			this.opinion = URLDecoder.decode(opinion, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
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
		try {
			this.opviewID = URLDecoder.decode(opviewID, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
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
		try {
			this.sign = URLDecoder.decode(sign, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			this.sign = sign;
		}
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		try {
			this.remark = URLDecoder.decode(remark, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			this.remark = remark;
		}
	}
}