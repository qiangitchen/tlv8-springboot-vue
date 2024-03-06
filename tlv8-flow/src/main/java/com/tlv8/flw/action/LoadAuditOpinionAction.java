package com.tlv8.flw.action;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.alibaba.fastjson.JSON;

/**
 * 加载审批意见
 * 
 * @author 陈乾
 *
 */
@Controller
@Scope("prototype")
public class LoadAuditOpinionAction extends ActionSupport {
	private static final Logger logger = LoggerFactory.getLogger(LoadAuditOpinionAction.class);
	private String fbillID;
	private String fopviewID;

	private Data data = new Data();

	@ResponseBody
	@RequestMapping("/LoadAuditOpinionAction")
	public Object execute() throws Exception {
		String sql = "select t.FAGREETEXT,FCREATETIME,FCREATEPERID,FCREATEPERNAME,FSIGN from OA_FLOWRECORD t where  FBILLID=? and t.FOPVIEWID = ? order by FCREATETIME asc";
		try {
			List<Object> params = new ArrayList<Object>();
			params.add(fbillID);
			params.add(fopviewID);
			List<Map<String, String>> res = DBUtils.selectStringList("oa", sql, params, true);
			for (Map<String, String> map : res) {
				map.put("SID", getSignID(map.get("FCREATEPERID")));
			}
			data.setData(JSON.toJSONString(res));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			logger.error(e.toString());
		}
		return success(data);
	}

	@SuppressWarnings("deprecation")
	private String getSignID(String personid) {
		SqlSession session = DBUtils.getSession("system");
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sid = "";
		try {
			conn = session.getConnection();
			ps = conn.prepareStatement("select SHSPIC from SA_HANDWR_SIGNATURE where sID=?");
			ps.setString(1, personid);
			rs = ps.executeQuery();
			if (rs.next()) {
				InputStream ins = rs.getBinaryStream(1);
				long size = ins.available();
				if (size > 10) {
					sid = personid;
				}
			}
		} catch (Exception e) {
			logger.error(e.toString());
		} finally {
			DBUtils.closeConn(session, conn, ps, rs);
		}
		return sid;
	}

	public void setFbillID(String fbillID) {
		this.fbillID = fbillID;
	}

	public String getFbillID() {
		return fbillID;
	}

	public void setFopviewID(String fopviewID) {
		this.fopviewID = fopviewID;
	}

	public String getFopviewID() {
		return fopviewID;
	}

	public void setData(Data data) {
		this.data = data;
	}

	public Data getData() {
		return data;
	}

}
