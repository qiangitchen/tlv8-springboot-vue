package com.tlv8.system.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.system.service.ISysParamsService;

public class GetSysParams {

	@Autowired
	ISysParamsService iSysParamsService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public HashMap<String, String> getSysParamsFunc(HashMap<String, String> params) throws Exception {
		String loginDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		try {
			params.put("loginDate", loginDate);
			getOrgInfo(params);
			getOgnInfo(params);
			getUserInfo(params);
			getPersonInfo(params);
			getDeptInfo(params);
			getPositionInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		HashMap m = params;
		return m;
	}

	private void getOrgInfo(HashMap<String, String> params) throws Exception {
		try {
			Map<String, String> orgmap = iSysParamsService.getOrgInfo(params.get("orgID"));
			if (!orgmap.isEmpty()) {
				params.put("currentOrgID", orgmap.get("SID"));
				params.put("currentOrgName", orgmap.get("SNAME"));
				params.put("currentOrgCode", orgmap.get("SCODE"));
				params.put("currentOrgFullID", orgmap.get("SFID"));
				params.put("currentOrgFullName", orgmap.get("SFNAME"));
				params.put("currentOrgFullCode", orgmap.get("SFCODE"));
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

	private void getOgnInfo(HashMap<String, String> params) throws Exception {
		try {
			Map<String, String> map = iSysParamsService.getOgnInfo(params.get("currentOrgFullID"));
			if (!map.isEmpty()) {
				params.put("currentOgnID", map.get("SID"));
				params.put("currentOgnName", map.get("SNAME"));
				params.put("currentOgnCode", map.get("SCODE"));
				params.put("currentOgnFullID", map.get("SFID"));
				params.put("currentOgnFullName", map.get("SFNAME"));
				params.put("currentOgnFullCode", map.get("SFCODE"));
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

	private void getUserInfo(HashMap<String, String> params) throws Exception {
		try {
			Map<String, String> map = iSysParamsService.getUserInfo(params.get("orgID"), params.get("personID"));
			if (!map.isEmpty()) {
				params.put("currentUserID", map.get("SID"));
				params.put("currentUserName", map.get("SNAME"));
				params.put("currentUserCode", map.get("SCODE"));
				params.put("currentUserFullID", map.get("SFID"));
				params.put("currentUserFullName", map.get("SFNAME"));
				params.put("currentUserFullCode", map.get("SFCODE"));
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

	private void getPersonInfo(HashMap<String, String> params) throws Exception {
		try {
			Map<String, String> map = iSysParamsService.getPersonInfo(params.get("personID"));
			if (!map.isEmpty()) {
				params.put("currentPersonID", map.get("SID"));
				params.put("currentPersonName", map.get("SNAME"));
				params.put("currentPersonCode", map.get("SCODE"));
				params.put("currentPersonFullID", map.get("SFID"));
				params.put("allMemberOfOrgFullID", map.get("SFID"));
				params.put("currentPersonFullName", map.get("SFNAME"));
				params.put("currentPersonFullCode", map.get("SCODEID"));
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

	private void getDeptInfo(HashMap<String, String> params) throws Exception {
		try {
			Map<String, String> map = iSysParamsService.getDeptInfo(params.get("currentOrgFullID"));
			if (!map.isEmpty()) {
				params.put("currentDeptID", map.get("SID"));
				params.put("currentDeptName", map.get("SNAME"));
				params.put("currentDeptCode", map.get("SCODE"));
				params.put("currentDeptFullID", map.get("SFID"));
				params.put("currentDeptFullName", map.get("SFNAME"));
				params.put("currentDeptFullCode", map.get("SFCODE"));
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

	private void getPositionInfo(HashMap<String, String> params) throws Exception {
		try {
			Map<String, String> map = iSysParamsService.getPositionInfo(params.get("currentOrgFullID"));
			if (!map.isEmpty()) {
				params.put("currentPositionID", map.get("SID"));
				params.put("currentPositionName", map.get("SNAME"));
				params.put("currentPositionCode", map.get("SCODE"));
				params.put("currentPositionFullID", map.get("SFID"));
				params.put("currentPositionFullName", map.get("SNAME"));
				params.put("currentPositionFullCode", map.get("SFCODE"));
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
