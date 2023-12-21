package com.tlv8.flw.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.base.Data;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.flw.base.FlowActivity;
import com.tlv8.flw.base.TaskData;
import com.tlv8.flw.bean.FlowDataBean;
import com.tlv8.flw.helper.FlowBaseHelper;
import com.tlv8.flw.pojo.SaTask;
import com.tlv8.system.base.BaseController;
import com.tlv8.system.utils.OrgUtils;

/**
 * @author ChenQian
 * @see 流程通用操作接口
 */
@Controller
@Scope("prototype")
public class FlowControler extends FlowDataBean {
	private Data data = new Data();
	private String srcPath;
	private String afterActivity;

	@Autowired
	FlowBaseHelper flowBaseHelper;
	@Autowired
	protected BaseController baseController;
	@Autowired
	TaskData taskData;

	public Data getData() {
		return this.data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	/**
	 * 启动流程
	 */
	@ResponseBody
	@RequestMapping("/flowstartAction")
	public Object start() {
		try {
			if (processID == null || "".equals(processID) || "undefined".equals(flowID)) {
				processID = flowBaseHelper.seachProcessID(srcPath, request);
			}
			if (processID == null) {
				data.setFlag("false");
				data.setMessage("启动流程失败！找不到" + srcPath + "对应的流程图。");
				return AjaxResult.success(data);
			}
			SaTask task = flowBaseHelper.start(processID, sdata1);
			flowID = task.getSflowid();
			taskID = task.getSid();
			data.setFlag("true");
			data.setData(toJSONString());
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	/**
	 * 流转流程
	 */
	@ResponseBody
	@RequestMapping("/flowoutAction")
	public Object out() {
		try {
			if ("".equals(flowID) || flowID == null || "undefined".equals(flowID)) {
				start();
			}
			if ("".equals(taskID) || taskID == null || "undefined".equals(taskID)) {
				return AjaxResult.success(data);
			}
			// 如果前端已经指定执行环节 并且 已经选择执行人
			if (!"".equals(afterActivity) && afterActivity != null && epersonids != null && !"".equals(epersonids)) {
				List<FlowActivity> aftAList = new ArrayList<FlowActivity>();
				aftAList.add(new FlowActivity(processID, afterActivity));
				List<OrgUtils> ePersonList = new ArrayList<OrgUtils>();
				String[] excutors = epersonids.split(",");
				for (int i = 0; i < excutors.length; i++) {
					OrgUtils OrgU = new OrgUtils(excutors[i]);
					ePersonList.add(OrgU);
				}
				taskID = flowBaseHelper.flowout(flowID, taskID, sdata1, ePersonList, aftAList);
				data.setFlag("true");
				data.setData(toJSONString());
			} else {
				System.out.println("taskID:" + taskID);
				data = flowBaseHelper.flowout(taskID);
				System.out.println(data.getFlag());
				if (!"select".equals(data.getFlag())) {
					taskID = data.getData();
					data.setData(toJSONString());
				}
				System.out.println(data.getData());
			}
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	/**
	 * 回退流程
	 */
	@ResponseBody
	@RequestMapping("/flowbackAction")
	public Object back() {
		try {
			setTaskID(flowBaseHelper.flowback(flowID, taskID));
			data.setFlag("true");
			data.setData(toJSONString());
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	/**
	 * 转发流程
	 */
	@ResponseBody
	@RequestMapping("/flowtransmitAction")
	public Object transmit() {
		try {
			List<OrgUtils> ePersonList = new ArrayList<OrgUtils>();
			if (epersonids != null && !"".equals(epersonids)) {
				if ((epersonids.indexOf(",") > 0)) {
					String[] excutors = epersonids.split(",");
					for (int i = 0; i < excutors.length; i++) {
						OrgUtils OrgU = new OrgUtils(excutors[i]);
						ePersonList.add(OrgU);
					}
				} else {
					OrgUtils OrgU = new OrgUtils(epersonids);
					ePersonList.add(OrgU);
				}
				setTaskID(flowBaseHelper.flowforward(flowID, taskID, ePersonList));
			} else {
				data = flowBaseHelper.flowforward(taskID);
				setTaskID(data.getData());
			}
			data.setFlag("true");
			data.setData(toJSONString());
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	/**
	 * 取消流程
	 */
	@ResponseBody
	@RequestMapping("/flowcancelAction")
	public Object cancel() {
		try {
			flowBaseHelper.flowcancel(flowID, taskID);
			data.setFlag("true");
			data.setData(toJSONString());
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	/**
	 * 终止流程
	 */
	@ResponseBody
	@RequestMapping("/flowstopAction")
	public Object stop() {
		try {
			flowBaseHelper.flowstop(flowID, taskID);
			data.setFlag("true");
			data.setData(toJSONString());
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	/**
	 * 暂停流程
	 */
	@ResponseBody
	@RequestMapping("/flowpauseAction")
	public Object pause() {
		try {
			flowBaseHelper.flowpause(flowID, taskID);
			data.setFlag("true");
			data.setData(toJSONString());
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	/**
	 * 激活流程
	 */
	@ResponseBody
	@RequestMapping("/flowrestartAction")
	public Object restart() {
		try {
			flowBaseHelper.flowrestart(flowID, taskID);
			data.setFlag("true");
			data.setData(toJSONString());
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.toString());
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

	public void setSrcPath(String srcPath) {
		try {
			this.srcPath = URLDecoder.decode(srcPath, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getSrcPath() {
		return srcPath;
	}

	public void setAfterActivity(String afterActivity) {
		try {
			this.afterActivity = URLDecoder.decode(afterActivity, "UTF-8");
		} catch (Exception e) {
		}
	}

	public String getAfterActivity() {
		return afterActivity;
	}

}
