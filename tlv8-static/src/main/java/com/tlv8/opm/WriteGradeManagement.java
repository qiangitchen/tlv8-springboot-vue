package com.tlv8.opm;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.pojo.SaOpManagement;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.service.ISaOpManagementService;
import com.tlv8.system.service.ISaOpOrgService;
import com.tlv8.system.utils.ContextUtils;

/**
 * 分级管理分配权限
 * 
 * @author chenqian
 */
@Controller
@Scope("prototype")
public class WriteGradeManagement extends ActionSupport {
	private String orgid;
	private String orgids;

	@Autowired
	ISaOpManagementService saOpManagementService;
	@Autowired
	ISaOpOrgService saOpOrgService;

	@ResponseBody
	@RequestMapping("/writeGradeManagement")
	public Object execute() throws Exception {
		Data data = new Data();
		ContextBean context = ContextUtils.getContext();
		if (context.getPersonID() == null || "".equals(context.getPersonID())) {
			data.setFlag("false");
			data.setMessage("未登录或登录已超时，不允许操作!");
			return SUCCESS;
		}
		try {
			SaOpOrg saorg = saOpOrgService.selectByPrimaryKey(orgid);
			if (saorg != null) {
				String[] selorg = orgids.split(",");
				for (int i = 0; i < selorg.length; i++) {
					String sorgid = selorg[i];
					SaOpOrg morg = saOpOrgService.selectByPrimaryKey(sorgid);
					if (morg != null) {
						List<SaOpManagement> mlist = saOpManagementService.selectByOrgIdManageorgId(orgid, sorgid);
						SaOpManagement saOpManagement = new SaOpManagement();
						boolean isnew = false;
						if (mlist.size() > 0 && "systemManagement".equals(mlist.get(0).getSmanagetypeid())) {
							saOpManagement = mlist.get(0);
						} else {
							saOpManagement.setSid(IDUtils.getGUID());
							saOpManagement.setVersion(0);
							isnew = true;
						}
						saOpManagement.setSorgid(saorg.getSid());
						saOpManagement.setSorgname(saorg.getSname());
						saOpManagement.setSorgfid(saorg.getSfid());
						saOpManagement.setSorgfname(saorg.getSfname());
						saOpManagement.setSmanageorgid(morg.getSid());
						saOpManagement.setSmanageorgname(morg.getSname());
						saOpManagement.setSmanageorgfid(morg.getSfid());
						saOpManagement.setSmanageorgfname(morg.getSfname());
						saOpManagement.setSmanagetypeid("systemManagement");
						saOpManagement.setScreatorfid(context.getCurrentPersonFullID());
						saOpManagement.setScreatorfname(context.getCurrentPersonFullName());
						saOpManagement.setScreatetime(new Date());
						if (isnew) {
							saOpManagementService.insertData(saOpManagement);
						} else {
							saOpManagementService.updateData(saOpManagement);
						}
					}
				}
				data.setFlag("true");
			} else {
				data.setFlag("false");
				data.setMessage("需要授权的机构id无效~");
			}
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.getMessage());
			e.printStackTrace();
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

	public String getOrgids() {
		return orgids;
	}

	public void setOrgids(String orgids) {
		try {
			this.orgids = URLDecoder.decode(orgids, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}
