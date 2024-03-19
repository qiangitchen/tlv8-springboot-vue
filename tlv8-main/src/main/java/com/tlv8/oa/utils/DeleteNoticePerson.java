package com.tlv8.oa.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tlv8.common.base.Data;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.oa.service.OaNoticePersonService;

@RestController
public class DeleteNoticePerson {
	@Autowired
	OaNoticePersonService oaNoticePersonService;

	@RequestMapping("/deleteNoticePersonAction")
	public Object execute(String fid) throws Exception {
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
	
}
