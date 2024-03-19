package com.tlv8.oa.controller;

import com.tlv8.oa.pojo.OaNoticePerson;
import com.tlv8.oa.service.OaNoticePersonService;

import com.tlv8.common.domain.AjaxResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* Created by TLv8 IDE on 2024/03/19.
*/
@Controller
@RequestMapping("/oaNoticePerson")
public class OaNoticePersonController {
    @Autowired
    private OaNoticePersonService oaNoticePersonService;

	@ResponseBody
    @RequestMapping("/deleteByPrimaryKey")
	public Object deleteByPrimaryKey(String id){
		return AjaxResult.success(oaNoticePersonService.deleteByPrimaryKey(id));
	}
	
	@ResponseBody
    @RequestMapping("/insert")
	public Object insert(OaNoticePerson row){
		return AjaxResult.success(oaNoticePersonService.insert(row));
	}
	
	@ResponseBody
    @RequestMapping("/selectByPrimaryKey")
	public Object selectByPrimaryKey(String id){
		return AjaxResult.success(oaNoticePersonService.selectByPrimaryKey(id));
	}
	
	@ResponseBody
    @RequestMapping("/selectAll")
	public Object selectAll(){
		return AjaxResult.success(oaNoticePersonService.selectAll());
	}
	
	@ResponseBody
    @RequestMapping("/updateByPrimaryKey")
	public Object updateByPrimaryKey(OaNoticePerson row){
		return AjaxResult.success(oaNoticePersonService.updateByPrimaryKey(row));
	}

}
