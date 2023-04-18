package com.tlv8.flw.controller;

import com.tlv8.flw.pojo.SaTask;
import com.tlv8.flw.service.SaTaskService;

import com.tlv8.common.domain.AjaxResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* Created by TLv8 IDE on 2023/04/13.
*/
@Controller
@RequestMapping("/saTask")
public class SaTaskController {
    @Autowired
    private SaTaskService saTaskService;

	@ResponseBody
    @RequestMapping("/deleteByPrimaryKey")
	public Object deleteByPrimaryKey(String id){
		return AjaxResult.success(saTaskService.deleteByPrimaryKey(id));
	}
	
	@ResponseBody
    @RequestMapping("/insert")
	public Object insert(SaTask row){
		return AjaxResult.success(saTaskService.insert(row));
	}
	
	@ResponseBody
    @RequestMapping("/selectByPrimaryKey")
	public Object selectByPrimaryKey(String id){
		return AjaxResult.success(saTaskService.selectByPrimaryKey(id));
	}
	
	@ResponseBody
    @RequestMapping("/selectAll")
	public Object selectAll(){
		return AjaxResult.success(saTaskService.selectAll());
	}
	
	@ResponseBody
    @RequestMapping("/updateByPrimaryKey")
	public Object updateByPrimaryKey(SaTask row){
		return AjaxResult.success(saTaskService.updateByPrimaryKey(row));
	}

}
