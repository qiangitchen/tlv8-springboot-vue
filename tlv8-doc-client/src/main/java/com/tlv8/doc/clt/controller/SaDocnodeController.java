package com.tlv8.doc.clt.controller;

import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnodeService;

import com.tlv8.common.domain.AjaxResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* Created by TLv8 IDE on 2023/04/19.
*/
@Controller
@RequestMapping("/saDocnode")
public class SaDocnodeController {
    @Autowired
    private SaDocnodeService saDocnodeService;

	@ResponseBody
    @RequestMapping("/deleteByPrimaryKey")
	public Object deleteByPrimaryKey(String id){
		return AjaxResult.success(saDocnodeService.deleteByPrimaryKey(id));
	}
	
	@ResponseBody
    @RequestMapping("/insert")
	public Object insert(SaDocnode row){
		return AjaxResult.success(saDocnodeService.insert(row));
	}
	
	@ResponseBody
    @RequestMapping("/selectByPrimaryKey")
	public Object selectByPrimaryKey(String id){
		return AjaxResult.success(saDocnodeService.selectByPrimaryKey(id));
	}
	
	@ResponseBody
    @RequestMapping("/selectAll")
	public Object selectAll(){
		return AjaxResult.success(saDocnodeService.selectAll());
	}
	
	@ResponseBody
    @RequestMapping("/updateByPrimaryKey")
	public Object updateByPrimaryKey(SaDocnode row){
		return AjaxResult.success(saDocnodeService.updateByPrimaryKey(row));
	}

}
