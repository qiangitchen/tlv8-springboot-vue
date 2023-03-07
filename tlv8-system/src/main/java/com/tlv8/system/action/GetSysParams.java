package com.tlv8.system.action;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.system.pojo.SysLogin;
import com.tlv8.system.pojo.SysParams;
import com.tlv8.system.service.ISysParamsService;

public class GetSysParams {

	@Autowired
	ISysParamsService iSysParamsService;

	public HashMap<String, String> getSysParamsFunc(SysLogin sysLogin) throws Exception {
		HashMap<String, String> params = new HashMap<String, String>();
		try {
			params.put("username", sysLogin.getUsername());
			getOrgInfo(sysLogin, params);
			getOgnInfo(sysLogin, params);
			getUserInfo(sysLogin, params);
			getPersonInfo(sysLogin, params);
			getDeptInfo(sysLogin, params);
			getPositionInfo(sysLogin, params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return params;
	}

	private void getOrgInfo(SysLogin sysLogin, HashMap<String, String> params) throws Exception {
		try {
			SysParams sysParams = iSysParamsService.getOrgInfo(sysLogin.getOrgid());
			if (sysParams != null) {
				params.put("currentOrgID", sysParams.getSid());
				params.put("currentOrgName", sysParams.getSname());
				params.put("currentOrgCode", sysParams.getScode());
				params.put("currentOrgFullID", sysParams.getSfid());
				params.put("currentOrgFullName", sysParams.getSfname());
				params.put("currentOrgFullCode", sysParams.getSfcode());
			} else {
				params.put("currentOrgID", "");
				params.put("currentOrgName", "");
				params.put("currentOrgCode", "");
				params.put("currentOrgFullID", "");
				params.put("currentOrgFullName", "");
				params.put("currentOrgFullCode", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getOgnInfo(SysLogin sysLogin, HashMap<String, String> params) throws Exception {
		try {
			SysParams sysParams = iSysParamsService.getOgnInfo(sysLogin.getOrgpath());
			if (sysParams != null) {
				params.put("currentOgnID", sysParams.getSid());
				params.put("currentOgnName", sysParams.getSname());
				params.put("currentOgnCode", sysParams.getScode());
				params.put("currentOgnFullID", sysParams.getSfid());
				params.put("currentOgnFullName", sysParams.getSfname());
				params.put("currentOgnFullCode", sysParams.getSfcode());
			} else {
				params.put("currentOgnID", params.get("currentOrgID"));
				params.put("currentOgnName", params.get("currentOrgName"));
				params.put("currentOgnCode", params.get("currentOrgCode"));
				params.put("currentOgnFullID", params.get("currentOrgFullID"));
				params.put("currentOgnFullName", params.get("currentOrgFullName"));
				params.put("currentOgnFullCode", params.get("currentOrgFullCode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getUserInfo(SysLogin sysLogin, HashMap<String, String> params) throws Exception {
		try {
			SysParams sysParams = iSysParamsService.getUserInfo(sysLogin.getOrgid(), sysLogin.getPersonid());
			if (sysParams != null) {
				params.put("currentUserID", sysParams.getSid());
				params.put("currentUserName", sysParams.getSname());
				params.put("currentUserCode", sysParams.getScode());
				params.put("currentUserFullID", sysParams.getSfid());
				params.put("currentUserFullName", sysParams.getSfname());
				params.put("currentUserFullCode", sysParams.getSfcode());
			} else {
				params.put("currentUserID", "");
				params.put("currentUserName", "");
				params.put("currentUserCode", "");
				params.put("currentUserFullID", "");
				params.put("currentUserFullName", "");
				params.put("currentUserFullCode", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getPersonInfo(SysLogin sysLogin, HashMap<String, String> params) throws Exception {
		try {
			SysParams sysParams = iSysParamsService.getPersonInfo(sysLogin.getPersonid());
			if (sysParams != null) {
				params.put("currentPersonID", sysParams.getSid());
				params.put("personID", sysParams.getSid());
				params.put("currentPersonName", sysParams.getSname());
				params.put("personName", sysParams.getSname());
				params.put("currentPersonCode", sysParams.getScode());
				params.put("personCode", sysParams.getScode());
				params.put("currentPersonFullID", sysParams.getSfid());
				params.put("allMemberOfOrgFullID", sysParams.getSfid());
				params.put("currentPersonFullName", sysParams.getSfname());
				params.put("currentPersonFullCode", sysParams.getSfcode());
				params.put("currentProcessLabel", "系统调用");
				params.put("currentActivityLabel", "系统调用活动");
			} else {
				params.put("currentPersonID", "");
				params.put("currentPersonName", "");
				params.put("currentPersonCode", "");
				params.put("currentPersonFullID", "");
				params.put("allMemberOfOrgFullID", "");
				params.put("currentPersonFullName", "");
				params.put("currentPersonFullCode", "");
				params.put("currentProcessLabel", "系统调用");
				params.put("currentActivityLabel", "系统调用活动");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getDeptInfo(SysLogin sysLogin, HashMap<String, String> params) throws Exception {
		try {
			SysParams sysParams = iSysParamsService.getDeptInfo(sysLogin.getOrgpath());
			if (sysParams != null) {
				params.put("currentDeptID", sysParams.getSid());
				params.put("currentDeptName", sysParams.getSname());
				params.put("currentDeptCode", sysParams.getScode());
				params.put("currentDeptFullID", sysParams.getSfid());
				params.put("currentDeptFullName", sysParams.getSfname());
				params.put("currentDeptFullCode", sysParams.getSfcode());
			} else {
				params.put("currentDeptID", "");
				params.put("currentDeptName", "");
				params.put("currentDeptCode", "");
				params.put("currentDeptFullID", "");
				params.put("currentDeptFullName", "");
				params.put("currentDeptFullCode", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getPositionInfo(SysLogin sysLogin, HashMap<String, String> params) throws Exception {
		try {
			SysParams sysParams = iSysParamsService.getPositionInfo(sysLogin.getOrgpath());
			if (sysParams != null) {
				params.put("currentPositionID", sysParams.getSid());
				params.put("currentPositionName", sysParams.getSname());
				params.put("currentPositionCode", sysParams.getScode());
				params.put("currentPositionFullID", sysParams.getSfid());
				params.put("currentPositionFullName", sysParams.getSfname());
				params.put("currentPositionFullCode", sysParams.getSfcode());
			} else {
				params.put("currentPositionID", "");
				params.put("currentPositionName", "");
				params.put("currentPositionCode", "");
				params.put("currentPositionFullID", "");
				params.put("currentPositionFullName", "");
				params.put("currentPositionFullCode", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
