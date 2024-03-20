package com.tlv8.oa.controller;

import com.tlv8.oa.pojo.OaNoticePerson;
import com.tlv8.oa.service.OaNoticePersonService;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;
import com.alibaba.fastjson.JSONArray;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.IDUtils;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by TLv8 IDE on 2024/03/19.
 */
@RestController
public class OaNoticePersonController {
	@Autowired
	private OaNoticePersonService oaNoticePersonService;

	@RequestMapping("/getNoticePersonAction")
	public Object getNoticePersonAction(String fid) throws Exception {
		Data data = new Data();
		try {
			SQL sql = new SQL();
			sql.SELECT("*");
			sql.FROM("OA_NOTICE_PERSON");
			sql.WHERE("FMAINID=?");
			List<Object> param = new ArrayList<>();
			param.add(fid);
			List<Map<String, String>> list = DBUtils.selectStringList("oa", sql.toString(), param, true);
			data.setData(JSONArray.toJSONString(list));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	@RequestMapping("/updateNoticeBrowseAction")
	public Object updateNoticeBrowseAction(String rowid, String isnew) throws Exception {
		Data data = new Data();
		try {
			ContextBean context = ContextUtils.getContext();
			String fpersonid = context.getCurrentPersonID();
			if (isnew.equals("true")) {
				List<OaNoticePerson> list = oaNoticePersonService.selectByMainidPersonID(rowid, fpersonid);
				if (list.size() < 1) {
					OaNoticePerson oaNoticePerson = new OaNoticePerson();
					oaNoticePerson.setFid(IDUtils.getGUID());
					oaNoticePerson.setFognid(context.getCurrentOgnID());
					oaNoticePerson.setFognname(context.getCurrentOgnName());
					oaNoticePerson.setForgid(context.getCurrentOrgID());
					oaNoticePerson.setForgname(context.getCurrentOrgName());
					oaNoticePerson.setFdeptid(context.getCurrentDeptID());
					oaNoticePerson.setFdeptname(context.getCurrentDeptName());
					oaNoticePerson.setFcreateid(context.getCurrentPersonID());
					oaNoticePerson.setFcreatename(context.getCurrentPersonName());
					oaNoticePerson.setFcreatedatetime(new Date());
					oaNoticePerson.setFmainid(rowid);
					oaNoticePerson.setFpersonid(fpersonid);
					oaNoticePerson.setFpersonname(context.getCurrentPersonName());
					oaNoticePerson.setFpersonfname(context.getCurrentPersonFullName());
					oaNoticePerson.setFbrowse("是");
					oaNoticePerson.setFreaddate(new Date());
					oaNoticePersonService.insert(oaNoticePerson);
				} else {
					for (OaNoticePerson oaNoticePerson : list) {
						oaNoticePerson.setFbrowse("是");
						oaNoticePerson.setFreaddate(new Date());
						oaNoticePersonService.updateByPrimaryKey(oaNoticePerson);
					}
				}
			} else {
				List<OaNoticePerson> list = oaNoticePersonService.selectByMainidPersonID(rowid, fpersonid);
				for (OaNoticePerson oaNoticePerson : list) {
					oaNoticePerson.setFbrowse("是");
					oaNoticePerson.setFreaddate(new Date());
					oaNoticePersonService.updateByPrimaryKey(oaNoticePerson);
				}
			}
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	@RequestMapping("/deleteNoticePersonAction")
	public Object deleteNoticePersonAction(String fid) throws Exception {
		Data data = new Data();
		try {
			oaNoticePersonService.deleteByPrimaryKey(fid);
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	@RequestMapping("/insertNoticePersonAction")
	public Object insertNoticePersonAction(String fids, String names, String sdata1) throws Exception {
		Data data = new Data();
		try {
			String[] idlist = deCode(fids).split(",");
			String[] namellist = deCode(names).split(",");
			sdata1 = deCode(sdata1);
			ContextBean context = ContextUtils.getContext();
			for (int i = 0; i < idlist.length; i++) {
				String pid = idlist[i];
				String pname = namellist[i];
				List<OaNoticePerson> list = oaNoticePersonService.selectByMainidPersonID(sdata1, pid);
				if (list.size() < 1) {
					OaNoticePerson oaNoticePerson = new OaNoticePerson();
					oaNoticePerson.setFid(IDUtils.getGUID());
					oaNoticePerson.setFognid(context.getCurrentOgnID());
					oaNoticePerson.setFognname(context.getCurrentOgnName());
					oaNoticePerson.setForgid(context.getCurrentOrgID());
					oaNoticePerson.setForgname(context.getCurrentOrgName());
					oaNoticePerson.setFdeptid(context.getCurrentDeptID());
					oaNoticePerson.setFdeptname(context.getCurrentDeptName());
					oaNoticePerson.setFcreateid(context.getCurrentPersonID());
					oaNoticePerson.setFcreatename(context.getCurrentPersonName());
					oaNoticePerson.setFcreatedatetime(new Date());
					oaNoticePerson.setFmainid(sdata1);
					oaNoticePerson.setFpersonid(pid);
					oaNoticePerson.setFpersonname(pname);
					oaNoticePerson.setFbrowse("否");
					oaNoticePersonService.insert(oaNoticePerson);
				}
			}
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	private String deCode(String value) {
		try {
			value = URLDecoder.decode(value, "UTF-8");
		} catch (Exception e) {
		}
		return value;
	}

}
