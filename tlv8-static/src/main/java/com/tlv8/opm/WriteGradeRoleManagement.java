package com.tlv8.opm;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.pojo.SaOprolemanagement;
import com.tlv8.system.service.ISaOpOrgService;
import com.tlv8.system.service.SaOprolemanagementService;
import com.tlv8.system.utils.ContextUtils;

/**
 * 分级管理分配角色
 * 
 * @author chenqian
 */
@Controller
@Scope("prototype")
public class WriteGradeRoleManagement extends ActionSupport {
	private String orgid;
	private String roleids;

	@Autowired
	SaOprolemanagementService saOprolemanagementService;
	@Autowired
	ISaOpOrgService saOpOrgService;

	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping("/writeGradeRoleManagement")
	public Object execute() throws Exception {
		Data data = new Data();
		ContextBean context = ContextUtils.getContext();
		if (context.getPersonID() == null || "".equals(context.getPersonID())) {
			data.setFlag("false");
			data.setMessage("未登录或登录已超时，不允许操作!");
			return SUCCESS;
		}
		SqlSession session = DBUtils.getSession("system");
		Connection conn = null;
		try {
			SaOpOrg saorg = saOpOrgService.selectByPrimaryKey(orgid);
			if (saorg != null) {
				String[] role = roleids.split(",");
				for (int i = 0; i < role.length; i++) {
					String roleid = role[i];
					List<SaOprolemanagement> rlist = saOprolemanagementService.selectByOrgIdRoleId(orgid, roleid);
					SaOprolemanagement rolem = new SaOprolemanagement();
					boolean isnew = false;
					if (rlist.size() > 0) {
						rolem = rlist.get(0);
					} else {
						rolem.setSid(IDUtils.getGUID());
						rolem.setVersion(0);
						isnew = true;
					}
					rolem.setSroleid(roleid);
					rolem.setSorgid(saorg.getSid());
					rolem.setSorgname(saorg.getSname());
					rolem.setSorgfid(saorg.getSfid());
					rolem.setSorgfname(saorg.getSfname());
					rolem.setScreatorfid(context.getCurrentPersonFullID());
					rolem.setScreatorfname(context.getCurrentPersonFullName());
					rolem.setScreatetime(new Date());
					if (isnew) {
						saOprolemanagementService.insert(rolem);
					} else {
						saOprolemanagementService.updateByPrimaryKey(rolem);
					}
				}
				data.setFlag("true");
			} else {
				data.setFlag("false");
				data.setMessage("指定的组织id无效~");
			}
		} catch (Exception e) {
			session.rollback(true);
			data.setFlag("false");
			data.setMessage(e.getMessage());
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(session, conn, null, null);
		}
		return success(data);
	}

	public void setOrgid(String orgid) {
		try {
			this.orgid = URLDecoder.decode(orgid, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getOrgid() {
		return orgid;
	}

	public void setRoleids(String roleids) {
		try {
			this.roleids = URLDecoder.decode(roleids, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getRoleids() {
		return roleids;
	}

}
