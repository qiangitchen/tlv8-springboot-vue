package com.tlv8.flw.controller;

import com.tlv8.flw.pojo.SaFlowdrawlg;
import com.tlv8.flw.service.SaFlowdrawlgService;
import com.tlv8.system.base.BaseController;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.IDUtils;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by TLv8 IDE on 2023/04/10.
 */
@Controller
@RequestMapping("/saFlowdrawlg")
public class SaFlowdrawlgController {
	@Autowired
	private SaFlowdrawlgService saFlowdrawlgService;
	@Autowired
	private BaseController baseController;

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

	/**
	 * 获取流程图
	 */
	@ResponseBody
	@RequestMapping("/getFlowDrawAction")
	public Object loadFlowDraw(String sprocessid) {
		return saFlowdrawlgService.selectByProcessId(sprocessid);
	}

	/**
	 * 保存流程图
	 */
	@ResponseBody
	@RequestMapping("/saveFlowDrawLGAction")
	public Object saveFlowDrawLG(@RequestBody Map<String, String> param, HttpServletRequest request) {
		try {
			ContextBean contextBean = baseController.getContext();
			String sprocessid = param.get("sprocessid");
			String sprocessname = param.get("sprocessname");
			String sdrawlg = param.get("sdrawlg");
			String sprocessacty = param.get("sprocessacty");
			SaFlowdrawlg saFlowdrawlg = saFlowdrawlgService.selectByProcessId(sprocessid);
			if (saFlowdrawlg != null) {
				saFlowdrawlg.setSprocessname(sprocessname);
				saFlowdrawlg.setSdrawlg(sdrawlg);
				saFlowdrawlg.setSprocessacty(sprocessacty);
				saFlowdrawlg.setSupdatorid(contextBean.getCurrentPersonID());
				saFlowdrawlg.setSupdatorname(contextBean.getCurrentPersonName());
				saFlowdrawlg.setSupdatetime(new Date());
				saFlowdrawlg.setVersion(saFlowdrawlg.getVersion() + 1);
				saFlowdrawlgService.updateByPrimaryKey(saFlowdrawlg);
			} else {
				saFlowdrawlg = new SaFlowdrawlg();
				saFlowdrawlg.setSid(IDUtils.getGUID());
				saFlowdrawlg.setSprocessid(sprocessid);
				saFlowdrawlg.setSprocessname(sprocessname);
				saFlowdrawlg.setSdrawlg(sdrawlg);
				saFlowdrawlg.setSprocessacty(sprocessacty);
				saFlowdrawlg.setScreatorid(contextBean.getCurrentPersonID());
				saFlowdrawlg.setScreatorname(contextBean.getCurrentPersonName());
				saFlowdrawlg.setScreatetime(new Date());
				saFlowdrawlg.setSupdatorid(contextBean.getCurrentPersonID());
				saFlowdrawlg.setSupdatorname(contextBean.getCurrentPersonName());
				saFlowdrawlg.setSupdatetime(new Date());
				saFlowdrawlg.setVersion(0);
				saFlowdrawlgService.insert(saFlowdrawlg);
			}
			return AjaxResult.success();
		} catch (Exception e) {
			e.printStackTrace();
			return AjaxResult.error(e.getMessage());
		}
	}

}
