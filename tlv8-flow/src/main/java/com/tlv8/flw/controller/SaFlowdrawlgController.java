package com.tlv8.flw.controller;

import com.tlv8.flw.pojo.SaFlowdrawlg;
import com.tlv8.flw.service.SaFlowdrawlgService;

import com.tlv8.common.domain.AjaxResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by TLv8 IDE on 2023/04/11.
 */
@Controller
@RequestMapping("/saFlowdrawlg")
public class SaFlowdrawlgController {
	@Autowired
	private SaFlowdrawlgService saFlowdrawlgService;

	@ResponseBody
	@RequestMapping("/deleteByPrimaryKey")
	public Object deleteByPrimaryKey(String id) {
		return AjaxResult.success(saFlowdrawlgService.deleteByPrimaryKey(id));
	}

	@ResponseBody
	@RequestMapping("/insert")
	public Object insert(SaFlowdrawlg row) {
		return AjaxResult.success(saFlowdrawlgService.insert(row));
	}

	@ResponseBody
	@RequestMapping("/selectByPrimaryKey")
	public Object selectByPrimaryKey(String id) {
		return AjaxResult.success(saFlowdrawlgService.selectByPrimaryKey(id));
	}

	@ResponseBody
	@RequestMapping("/selectAll")
	public Object selectAll() {
		return AjaxResult.success(saFlowdrawlgService.selectAll());
	}

	@ResponseBody
	@RequestMapping("/updateByPrimaryKey")
	public Object updateByPrimaryKey(SaFlowdrawlg row) {
		return AjaxResult.success(saFlowdrawlgService.updateByPrimaryKey(row));
	}

}
