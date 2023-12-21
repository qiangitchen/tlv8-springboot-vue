package com.tlv8.flw.controller;

import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;

/**
 * @author ChenQian
 * @date 2012-6-8
 * @see 获取流程执行人机构树
 */
@Controller
@Scope("prototype")
@SuppressWarnings({ "unchecked", "rawtypes" })
public class ExecutorTreeControler extends ActionSupport {
	private Data data = new Data();
	private String filter = null;

	public void setData(Data data) {
		this.data = data;
	}

	public Data getData() {
		return data;
	}

	@ResponseBody
	@RequestMapping("/getExecutorTree")
	@Override
	public Object execute() throws Exception {
		try {
			data.setData(findOrgInfo());
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	public String findOrgInfo() throws SQLException {
		String result = "";
		ContextBean context = ContextUtils.getContext();
		String ognfid = context.getCurrentOgnFullID();
		SQL sql = new SQL();
		sql.SELECT("distinct a.SPARENT,a.SID,a.SCODE,a.SNAME,a.SFID,a.SORGKINDID,a.sSequence");
		sql.FROM("SA_OPORG a");
		String jsons = "(select SFID from SA_OPORG where SVALIDSTATE=1";
		if (!"".equals(filter) && filter != null) {
			jsons += " and(" + filter + ")";
		}
		if (DBUtils.IsMSSQLDB()) {
			jsons += ")b on b.SFID like a.SFID + '%'";
		} else {
			jsons += ")b on b.SFID like concat(a.SFID,'%')";
		}
		sql.INNER_JOIN(jsons);
		sql.WHERE("a.SVALIDSTATE=1");
		sql.ORDER_BY("a.sSequence asc");
		SqlSession session = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List orgLi = new ArrayList();
		try {
			conn = session.getConnection();
			ps = conn.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			while (rs.next()) {
				Map<String, String> m = new HashMap<>();
				String sfid = rs.getString("SFID");
				m.put("SFID", sfid);
				String ssfid = sfid.replace(ognfid, "");
				if (ssfid.indexOf(".ogn") > 0 || ssfid.indexOf(".org") > 0) {// 忽略子(下属)单位
					continue;
				}
				m.put("id", rs.getString("SID"));
				m.put("SID", rs.getString("SID"));
				m.put("name", rs.getString("SNAME"));
				m.put("SNAME", rs.getString("SNAME"));
				m.put("pId", rs.getString("SPARENT"));
				m.put("SPARENT", rs.getString("SPARENT"));
				m.put("type", rs.getString("SORGKINDID"));
				m.put("SORGKINDID", rs.getString("SORGKINDID"));
				m.put("sSequence", rs.getString("sSequence"));
				setICON(m);
				orgLi.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(session, conn, ps, rs);
		}
		if (orgLi.size() > 0) {
			result = JSON.toJSONString(orgLi);
		}
		return result;
	}

	public void setICON(Map inM) {
		String cpath = request.getContextPath();
		if ("psm".equals(inM.get("type"))) {
			inM.put("icon", cpath + "/comon/image/toolbar/org/person.gif");
		} else if ("pos".equals(inM.get("type"))) {
			inM.put("icon", cpath + "/comon/image/toolbar/org/pos.gif");
			inM.put("open", "true");
		} else if ("dept".equals(inM.get("type"))) {
			inM.put("icon", cpath + "/comon/image/toolbar/org/dept.gif");
			inM.put("open", "true");
		} else {
			inM.put("icon", cpath + "/comon/image/toolbar/org/org.gif");
			inM.put("open", "true");
		}
	}

	public void setFilter(String filter) {
		try {
			this.filter = URLDecoder.decode(filter, "UTF-8");
		} catch (Exception e) {
		}
	}

	public String getFilter() {
		return filter;
	}

}
