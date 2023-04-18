package com.tlv8.flw.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.tlv8.common.base.Data;
import com.tlv8.flw.base.TaskData;
import com.tlv8.flw.bean.FlowBotBean;
import com.tlv8.flw.bean.FlowBotXBean;
import com.tlv8.flw.bean.FlowDataBean;
import com.tlv8.flw.helper.FlowBaseHelper;
import com.tlv8.flw.pojo.SaFlowdrawlg;
import com.tlv8.flw.service.SaFlowdrawlgService;

/**
 * @author ChenQian @category
 */
@Controller
@Scope("prototype")
public class FlowBotControler extends FlowDataBean {
	Data data = new Data();
	
	@Autowired
	FlowBaseHelper flowBaseHelper;
	@Autowired
	TaskData taskData;

	@Autowired
	private SaFlowdrawlgService saFlowdrawlgService;

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	/**
	 * 加载波特图
	 */
	@ResponseBody
	@RequestMapping("/flowloadbotAction")
	public Object loadbot() {
		try {
			FlowBotBean bean = new FlowBotBean(flowID);
			data.setData(bean.toJsonStr());
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			System.out.println(e.toString());
		}
		return this;
	}

	/**
	 * 加载波特图X
	 */
	@ResponseBody
	@RequestMapping("/flowloadbotXAction")
	public Object loadbotX() {
		try {
			FlowBotXBean bean = new FlowBotXBean(flowID);
			data.setData(bean.toJSONStr());
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			System.out.println(e.toString());
		}
		return this;
	}

	/**
	 * 加载流程图
	 */
	@ResponseBody
	@RequestMapping("/flowloadIocusAction")
	public Object loadIocus() {
		try {
			processID = taskData.getProcessID(flowID);
			if (processID == null || "".equals(processID)) {
				processID = flowBaseHelper.seachProcessID(currentUrl, request);
			}
			SaFlowdrawlg flowdraw = saFlowdrawlgService.selectBySprocessid(processID);
			Map<String, String> reD = new HashMap<String, String>();
			reD.put("id", flowdraw.getSprocessid());
			reD.put("name", flowdraw.getSprocessname());
			reD.put("jsonStr", flowdraw.getSprocessacty());
			data.setData(JSON.toJSONString(reD));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return this;
	}

	/**
	 * 加载流程图
	 */
	@ResponseBody
	@RequestMapping("/flowloadIocusXAction")
	public Object loadIocusX() {
		try {
			SaFlowdrawlg flowdraw = saFlowdrawlgService.selectBySprocessid(processID);
			Map<String, String> reD = new HashMap<String, String>();
			reD.put("id", flowdraw.getSprocessid());
			reD.put("name", flowdraw.getSprocessname());
			reD.put("jsonStr", flowdraw.getSprocessacty());
			data.setData(JSON.toJSONString(reD));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return this;
	}

	/**
	 * 检测流程是否已经结束
	 */
	@ResponseBody
	@RequestMapping("/flowcheckfinishAction")
	public Object checkfinish() {
		try {
			boolean isfinish = taskData.checkisfinished(flowID);
			data.setData(String.valueOf(isfinish));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return this;
	}

}
