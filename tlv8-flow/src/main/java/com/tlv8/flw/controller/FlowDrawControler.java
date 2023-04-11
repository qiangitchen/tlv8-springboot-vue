package com.tlv8.flw.controller;

import java.net.URLDecoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.flw.base.FlowFile;
import com.tlv8.system.base.BaseController;
import com.tlv8.system.bean.ContextBean;

/**
 * @author ChenQian
 */
@Controller
@Scope("prototype")
@SuppressWarnings({ "rawtypes" })
public class FlowDrawControler extends ActionSupport {
	private String sprocessid;// SPROCESSID
	private String sprocessname;// SPROCESSNAME
	private String sdrawlg;// SDRAWLG
	private String sprocessacty;// SPROCESSACTY

	@Autowired
	private BaseController baseController;

	/*
	 * @获取流程图
	 */
	@ResponseBody
	@RequestMapping("/getFlowDrawAction")
	public Object loadFlowDraw() {
		try {
			Map m = FlowFile.getFlowDraw(getSprocessid());// 获取流程图
			sdrawlg = (String) m.get("SDRAWLG");
			sprocessacty = (String) m.get("SPROCESSACTY");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this;
	}

	/*
	 * @保存流程图
	 */
	@ResponseBody
	@RequestMapping("/saveFlowDrawLGAction")
	public Object saveFlowDrawLG() {
		try {
			ContextBean context = baseController.getContext();
			FlowFile.saveFlowDraw(getSprocessid(), getSprocessname(), getSdrawlg(), getSprocessacty(), context);// 保存流程图
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this;
	}

	public void setSprocessid(String sprocessid) {
		try {
			this.sprocessid = URLDecoder.decode(sprocessid, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getSprocessid() {
		return sprocessid;
	}

	public void setSprocessname(String sprocessname) {
		try {
			this.sprocessname = URLDecoder.decode(sprocessname, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getSprocessname() {
		return sprocessname == null ? "" : sprocessname;
	}

	public void setSdrawlg(String sdrawlg) {
		try {
			this.sdrawlg = URLDecoder.decode(sdrawlg, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getSdrawlg() {
		return sdrawlg;
	}

	public String getSprocessacty() {
		return sprocessacty == null ? "" : sprocessacty;
	}

	public void setSprocessacty(String sprocessacty) {
		try {
			this.sprocessacty = URLDecoder.decode(sprocessacty, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
