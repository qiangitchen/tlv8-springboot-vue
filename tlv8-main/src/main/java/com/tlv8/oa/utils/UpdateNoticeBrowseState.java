package com.tlv8.oa.utils;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tlv8.common.base.Data;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.oa.pojo.OaNoticePerson;
import com.tlv8.oa.service.OaNoticePersonService;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;

@RestController
public class UpdateNoticeBrowseState {
	@Autowired
	OaNoticePersonService oaNoticePersonService;

	@RequestMapping("/updateNoticeBrowseAction")
	public Object execute(String rowid, String isnew) throws Exception {
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

}
