package com.tlv8.oa.utils;

import java.net.URLDecoder;
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
public class InsertNoticePerson {
	@Autowired
	OaNoticePersonService oaNoticePersonService;

	@RequestMapping("/insertNoticePersonAction")
	public Object execute(String fids, String names, String sdata1) throws Exception {
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
