package com.tlv8.flw.helper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.flw.base.FlowActivity;
import com.tlv8.flw.base.TaskData;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.OrgUtils;

/**
 * @author ChenQain
 * @流程基本操作
 */
public class FlowBaseHelper extends ActionSupport {

	/**
	 * 启动流程
	 * 
	 * @param processID
	 * @param sData1
	 * @param context
	 * @return
	 * @throws Exception
	 */
	public String startflow(String processID, String sData1, ContextBean context) throws Exception {
		String result = "";
		try {
			String processName = new FlowActivity(processID, "start").getProcessName();
			result = TaskData.startFlow(processID, processName, sData1, context);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 流转流程
	 * 
	 * @param flowID
	 * @param taskID
	 * @param sData1
	 * @param ePersonList
	 * @param afterActivityList
	 * @param context
	 * @return
	 * @throws Exception
	 */
	public String flowout(String flowID, String taskID, String sData1, List<OrgUtils> ePersonList,
			List<FlowActivity> afterActivityList, ContextBean context) throws Exception {
		String result = "";
		if (ePersonList.size() == 0)
			throw new Exception("未指定执行人，流转失败！");
		try {
			String processID = TaskData.getCurrentProcessID(taskID);
			String Activity = TaskData.getCurrentActivity(taskID);
			if (processID != null) {
				if (Activity == null || "".equals(Activity))
					Activity = "start";
				FlowActivity flwA = new FlowActivity(processID, Activity);
				String processName = flwA.getProcessName();
				for (int i = 0; i < afterActivityList.size(); i++) {
					result = TaskData.FlowOut(processID, processName, (String) afterActivityList.get(i).getId(), flowID,
							taskID, sData1, ePersonList, request, context);
				}
			}
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 回退流程
	 * 
	 * @param flowID
	 * @param taskID
	 * @param context
	 * @return
	 * @throws Exception
	 */
	public String flowback(String flowID, String taskID, ContextBean context) throws Exception {
		String result = "";
		try {
			String processID = TaskData.getCurrentProcessID(taskID);
			String curActivity = TaskData.getCurrentActivity(taskID);
			FlowActivity flwA = new FlowActivity(processID, curActivity);
			List<FlowActivity> ActivityList = flwA.getBeforeActivity();
			String backActivity = flwA.getBackActivity();
			String Activity = TaskData.getBeforeActivity(taskID);
			boolean isUnBefore = true;
			if (backActivity != null && !"".equals(backActivity) && !"undefiend".equals(backActivity)
					&& !"null".equals(backActivity)) {
				System.out.println("指定环节：" + backActivity);
				Activity = backActivity;
				isUnBefore = false;
			} else {
				for (int i = 0; i < ActivityList.size(); i++) {
					String activy = ActivityList.get(i).getActivity();
					if (activy != null && activy.equals(Activity)) {
						System.out.println("before >>" + activy);
						isUnBefore = false;
						break;
					}
				}
			}
			List<OrgUtils> bfepsmlist = new ArrayList<OrgUtils>();
			if (isUnBefore) {
				Map<String, String> HistoryActivity = TaskData.getHistoryActivity(flowID);
				for (int i = 0; i < ActivityList.size(); i++) {
					String activy = ActivityList.get(i).getActivity();
					if (activy != null) {
						if (HistoryActivity.containsKey(activy)) {
							bfepsmlist = TaskData.getActivityExecutor(flowID, activy);
							if (bfepsmlist.size() > 0) {
								System.out.println("un_before >>" + activy);
								Activity = activy;
								break;
							}
						} else {
							Activity = "";
						}
					} else {
						Activity = "";
					}
				}
			} else {
				bfepsmlist = TaskData.getActivityExecutor(flowID, Activity);
			}
			if (Activity == null || "".equals(Activity))
				throw new Exception("没有前序环节!");
			if (bfepsmlist.size() < 1)
				throw new Exception("没有找到前序环节执行人!");
			String processName = TaskData.getCurrentActivityName(taskID);
			String sData1 = TaskData.getCurrentActivitysData1(taskID);
			result = TaskData.FlowBack(processID, processName, Activity, flowID, taskID, sData1, bfepsmlist, context);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 转发流程
	 * 
	 * @param flowID
	 * @param taskID
	 * @param epersonlist
	 * @param context
	 * @return
	 * @throws Exception
	 */
	public String flowforward(String flowID, String taskID, List<OrgUtils> epersonlist, ContextBean context)
			throws Exception {
		String result = "";
		try {
			String processID = TaskData.getCurrentProcessID(taskID);
			String Activity = TaskData.getBeforeActivity(taskID);
			String processName = TaskData.getCurrentActivityName(taskID);
			String sData1 = TaskData.getCurrentActivitysData1(taskID);
			result = TaskData.FlowTransmit(processID, processName, Activity, flowID, taskID, sData1, epersonlist,
					context);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 取消流程
	 * 
	 * @param flowID
	 * @param taskID
	 * @return
	 * @throws Exception
	 */
	public String flowcancel(String flowID, String taskID) throws Exception {
		String result = "";
		try {
			TaskData.FlowCancel(flowID, taskID);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 终止流程
	 * 
	 * @param flowID
	 * @param taskID
	 * @return
	 * @throws Exception
	 */
	public String flowstop(String flowID, String taskID) throws Exception {
		String result = "";
		try {
			TaskData.FlowAbort(flowID, taskID);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 暂停流程
	 * 
	 * @param flowID
	 * @param taskID
	 * @return
	 * @throws Exception
	 */
	public String flowpause(String flowID, String taskID) throws Exception {
		String result = "";
		try {
			TaskData.FlowPause(flowID, taskID);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 激活流程
	 * 
	 * @param flowID
	 * @param taskID
	 * @return
	 * @throws Exception
	 */
	public String flowrestart(String flowID, String taskID) throws Exception {
		String result = "";
		try {
			TaskData.FlowRestart(flowID, taskID);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

}
