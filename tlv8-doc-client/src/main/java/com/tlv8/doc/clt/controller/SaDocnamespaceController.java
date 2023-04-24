package com.tlv8.doc.clt.controller;

import com.tlv8.doc.clt.pojo.SaDocnamespace;
import com.tlv8.doc.clt.service.SaDocnamespaceService;

import com.tlv8.common.domain.AjaxResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
* Created by TLv8 IDE on 2023/04/19.
*/
@Controller
@RequestMapping("/saDocnamespace")
public class SaDocnamespaceController {
    @Autowired
    private SaDocnamespaceService saDocnamespaceService;

	@ResponseBody
    @RequestMapping("/deleteByPrimaryKey")
	public Object deleteByPrimaryKey(String id){
		return AjaxResult.success(saDocnamespaceService.deleteByPrimaryKey(id));
	}
	
	@ResponseBody
    @RequestMapping("/insert")
	public Object insert(SaDocnamespace row){
		return AjaxResult.success(saDocnamespaceService.insert(row));
	}
	
	@ResponseBody
    @RequestMapping("/selectByPrimaryKey")
	public Object selectByPrimaryKey(String id){
		return AjaxResult.success(saDocnamespaceService.selectByPrimaryKey(id));
	}
	
	@ResponseBody
    @RequestMapping("/selectAll")
	public Object selectAll(){
		return AjaxResult.success(saDocnamespaceService.selectAll());
	}
	
	@ResponseBody
    @RequestMapping("/updateByPrimaryKey")
	public Object updateByPrimaryKey(SaDocnamespace row){
		return AjaxResult.success(saDocnamespaceService.updateByPrimaryKey(row));
	}

}
