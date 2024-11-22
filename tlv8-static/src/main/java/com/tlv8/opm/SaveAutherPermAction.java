package com.tlv8.opm;

import java.net.URLDecoder;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.controller.UserController;
import com.tlv8.system.pojo.SaOpAuthorize;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.pojo.SaOpRole;
import com.tlv8.system.service.ISaOpAuthorizeService;
import com.tlv8.system.service.ISaOpOrgService;
import com.tlv8.system.service.ISaOpRoleService;

/**
 * 新增保存授权信息
 * 
 * @author ChenQain
 */
@Controller
@Scope("prototype")
public class SaveAutherPermAction extends ActionSupport {
	private String orgID;
	private String roleIDs;

	@Autowired
	ISaOpAuthorizeService saOpAuthorizeService;
	@Autowired
	ISaOpRoleService saOpRoleService;
	@Autowired
	ISaOpOrgService saOpOrgService;
	@Autowired
	UserController userController;

	@ResponseBody
	@RequestMapping("/saveAutherPermAction")
	public Object execute() throws Exception {
		Data data = new Data();
		String r = "";
		String m = "success";
		String f = "";
		try {
			String[] roles = roleIDs.split(",");
			SaOpOrg org = saOpOrgService.selectByPrimaryKey(orgID);
			if (org != null) {
				ContextBean context = userController.getContext();
				for (String roleid : roles) {
					SaOpRole role = saOpRoleService.selectByPrimaryKey(roleid);
					if (role != null) {
						SaOpAuthorize authorize = saOpAuthorizeService.selectByOrgRole(orgID, roleid);
						boolean isnew = false;
						if (authorize == null) {
							authorize = new SaOpAuthorize();
							authorize.setSid(IDUtils.getGUID());
							authorize.setScreatetime(new Date());
							authorize.setScreatorfid(context.getCurrentPersonFullID());
							authorize.setScreatorfname(context.getCurrentPersonFullName());
							authorize.setVersion(0);
							isnew = true;
						}
						authorize.setSauthorizeroleid(role.getSid());
						authorize.setSdescription(role.getSname());
						authorize.setSorgid(org.getSid());
						authorize.setSorgname(org.getSname());
						authorize.setSorgfid(org.getSfid());
						authorize.setSorgfname(org.getSfname());
						if (isnew) {
							saOpAuthorizeService.insertData(authorize);
						} else {
							saOpAuthorizeService.updateData(authorize);
						}
					}
				}
				f = "true";
				m = "授权成功";
			} else {
				f = "false";
				m = "指定的组织无效";
			}
		} catch (Exception e) {
			m = "操作失败：" + e.getMessage();
			f = "false";
			e.printStackTrace();
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		return success(data);
	}

	public String getOrgID() {
		return orgID;
	}

	public void setOrgID(String orgID) {
		try {
			this.orgID = URLDecoder.decode(orgID, "UTF-8");
		} catch (Exception e) {

		}
	}

	public String getRoleIDs() {
		return roleIDs;
	}

	public void setRoleIDs(String roleIDs) {
		try {
			this.roleIDs = URLDecoder.decode(roleIDs, "UTF-8");
		} catch (Exception e) {

		}
	}

}
