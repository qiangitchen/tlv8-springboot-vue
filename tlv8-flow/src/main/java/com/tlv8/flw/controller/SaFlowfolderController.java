package com.tlv8.flw.controller;

import com.tlv8.flw.pojo.SaFlowfolder;
import com.tlv8.flw.service.SaFlowfolderService;

import com.tlv8.common.domain.AjaxResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* Created by TLv8 IDE on 2023/04/10.
*/
@Controller
@RequestMapping("/saFlowfolder")
public class SaFlowfolderController {
    @Autowired
    private SaFlowfolderService saFlowfolderService;

	@ResponseBody
    @RequestMapping("/deleteByPrimaryKey")
	public Object deleteByPrimaryKey(String id){
		return AjaxResult.success(saFlowfolderService.deleteByPrimaryKey(id));
	}
	
	@ResponseBody
    @RequestMapping("/insert")
	public Object insert(SaFlowfolder row){
		return AjaxResult.success(saFlowfolderService.insert(row));
	}
	
	@ResponseBody
    @RequestMapping("/selectByPrimaryKey")
	public Object selectByPrimaryKey(String id){
		return AjaxResult.success(saFlowfolderService.selectByPrimaryKey(id));
	}
	
	@ResponseBody
    @RequestMapping("/selectAll")
	public Object selectAll(){
		return AjaxResult.success(saFlowfolderService.selectAll());
	}
	
	@ResponseBody
    @RequestMapping("/updateByPrimaryKey")
	public Object updateByPrimaryKey(SaFlowfolder row){
		return AjaxResult.success(saFlowfolderService.updateByPrimaryKey(row));
	}

}
