package com.tlv8.flw.helper;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.StringArray;
import com.tlv8.flw.base.FlowActivity;
import com.tlv8.flw.base.TaskData;
import com.tlv8.flw.expression.BooleanExpression;
import com.tlv8.flw.pojo.SaFlowdrawlg;
import com.tlv8.flw.pojo.SaTask;
import com.tlv8.flw.service.SaFlowdrawlgService;
import com.tlv8.flw.service.SaTaskService;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.controller.UserController;
import com.tlv8.system.utils.OrgUtils;

/**
 * 流程基本操作
 * 
 * @author ChenQain
 */
@Component
public class FlowBaseHelper {
	@Autowired
	HttpServletRequest request;
	@Autowired
	UserController userController;
	@Autowired
	SaFlowdrawlgService saFlowdrawlgService;
	@Autowired
	SaTaskService saTaskService;
	@Autowired
	TaskData taskData;

	/**
	 * 根据页面地址查询流程图id
	 * 
	 * @param path
	 * @param request
	 * @return String
	 */
	public String seachProcessID(String path, HttpServletRequest request) {
		String result = null;
		path = path.replace(request.getContextPath(), "");
		path = path.replace("/", "\\/");
		if (DBUtils.IsMySQLDB()) {
			path = path.replace("\\", "\\\\\\\\");
			path = path.substring(1);
		} else if (DBUtils.IsPostgreSQL()) {
			path = path.replace("\\", "\\\\");
		}
		try {
			List<SaFlowdrawlg> list = saFlowdrawlgService.seachProcessByPath(path);
			if (list.size() > 0) {
				return list.get(0).getSprocessid();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 启动流程
	 * 
	 * @param processID
	 * @param sData1
	 * @param context
	 * @return String
	 * @throws Exception
	 */
	public String startflow(String processID, String sData1) throws Exception {
		String result = "";
		try {
			ContextBean context = userController.getContext();
			String processName = new FlowActivity(processID, "start").getProcessName();
			result = taskData.startFlow(processID, processName, sData1, context);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 启动流程 给自己增加初始环节待办
	 * 
	 * @param processID
	 * @param sData1
	 * @return
	 * @throws Exception
	 */
	public SaTask start(String processID, String sData1) throws Exception {
		ContextBean context = userController.getContext();
		String flowID = startflow(processID, sData1);
		List<OrgUtils> ePersonList = new ArrayList<OrgUtils>();
		ePersonList.add(new OrgUtils(context));
		FlowActivity flwA = new FlowActivity(processID, "start");
		String taskID = flowout(flowID, flowID, sData1, ePersonList, flwA.getAfterActivity(request));
		return saTaskService.selectByPrimaryKey(taskID);
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
			List<FlowActivity> afterActivityList) throws Exception {
		String result = "";
		if (ePersonList.size() == 0)
			throw new Exception("未指定执行人，流转失败！");
		try {
			ContextBean context = userController.getContext();
			String processID = taskData.getCurrentProcessID(taskID);
			String Activity = taskData.getCurrentActivity(taskID);
			if (processID != null) {
				if (Activity == null || "".equals(Activity))
					Activity = "start";
				FlowActivity flwA = new FlowActivity(processID, Activity);
				String processName = flwA.getProcessName();
				for (int i = 0; i < afterActivityList.size(); i++) {
					result = taskData.FlowOut(processID, processName, (String) afterActivityList.get(i).getId(), flowID,
							taskID, sData1, ePersonList, request, context);
				}
			}
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 流转流程
	 * 
	 * @param taskID
	 * @return
	 */
	public Data flowout(String taskID) throws Exception {
		Data data = new Data();
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		String processID = task.getSprocess();
		String Activity = task.getSactivity();
		FlowActivity flwA = new FlowActivity(processID, Activity);
		String flowID = task.getSflowid();
		String sdata1 = task.getSdata1();
		List<FlowActivity> aftAList = flwA.getAfterActivity(flowID, taskID, sdata1, request);
		ContextBean context = userController.getContext();
		List<OrgUtils> ePersonList = new ArrayList<OrgUtils>();
		if (aftAList.size() == 1 && "end".equals(aftAList.get(0).getType())
				&& (!"together".equals(flwA.getGrapModle()) || !"merge".equals(flwA.getGrapWay()))) {
			// 如果下一环节为结束环节时 不做流转确认
			OrgUtils OrgU = new OrgUtils(context);
			ePersonList.add(OrgU);
			String ntaskid = flowout(flowID, taskID, sdata1, ePersonList, aftAList);
			data.setFlag("end");
			data.setData(ntaskid);
			return data;
		}
		// 共同模式且需要合并
		if ("together".equals(flwA.getGrapModle()) && "merge".equals(flwA.getGrapWay())) {
			List<SaTask> lis = saTaskService.selectActivityOtherTask(flowID, Activity, taskID, "tesReady");
			if (lis.size() > 0) {
				task.setSstatusid("tesFinished");
				task.setSstatusname("已完成");
				task.setSexecutetime(new Date());
				task.setSafinishtime(new Date());
				task.setVersion(task.getVersion() + 1);
				saTaskService.updateByPrimaryKey(task);
				data.setFlag("msg");
				data.setMessage("请等待其他人处理!");
				return data;
			}
		}
		StringArray epersonids = new StringArray();
		if (aftAList.size() == 1 && "no".equals(aftAList.get(0).getOutquery())) {// 不需要流转确认时处理
			String epersonid = aftAList.get(0).getExcutorIDs("self");
			if (epersonid != null && !"".equals(epersonid)) {// 指定固定执行人
				if ((epersonid.indexOf(",") > 0)) {
					String[] excutors = epersonid.split(",");
					for (int i = 0; i < excutors.length; i++) {
						if (!"".equals(excutors[i].trim())) {
							OrgUtils OrgU = new OrgUtils(excutors[i]);
							ePersonList.add(OrgU);
						}
					}
				} else {
					OrgUtils OrgU = new OrgUtils(epersonid);
					ePersonList.add(OrgU);
				}
				String ntaskid = flowout(flowID, taskID, sdata1, ePersonList, aftAList);
				data.setFlag("true");
				data.setData(ntaskid);
				return data;
			} else {// 未指定固定执行人
				String exeGroup = aftAList.get(0).getExcutorGroup();
				if (exeGroup != null && !"".equals(exeGroup)) {
					exeGroup = exeGroup.replaceAll("getProcessID\\(\\)", processID);
					exeGroup = exeGroup.replaceAll("getFlowID\\(\\)", flowID);
					exeGroup = exeGroup.replaceAll("getTaskID\\(\\)", taskID);
					exeGroup = exeGroup.replaceAll("getProcesssData1\\(\\)", sdata1);
				}
				String excutorGroup = "";
				if (aftAList.get(0).getExcutorGroup() == null || "".equals(aftAList.get(0).getExcutorGroup())) {
					excutorGroup = BooleanExpression.getScriptExpressionVal(
							BooleanExpression.resolutionExpression("getOrgUnitHasActivity(\"" + processID + "\",\""
									+ aftAList.get(0).getId() + "\",\"FALSE\",\"FALSE\")", request));
				} else {
					excutorGroup = BooleanExpression
							.getScriptExpressionVal(BooleanExpression.resolutionExpression(exeGroup, request));
				}
				StringArray excutorGroupfilter = new StringArray();
				String[] exGroups = excutorGroup.split(",");
				for (int i = 0; i < exGroups.length; i++) {
					if (exGroups[i] != null && !"".equals(exGroups[i])) {
						excutorGroupfilter.push(" SFID like '%" + exGroups[i] + "%'");
					}
				}
				if (excutorGroupfilter.getLength() > 0) {
					String excutorGroupfilters = "(" + excutorGroupfilter.join(" or ") + ")";
					excutorGroupfilters += " and SFID like '" + context.getCurrentOgnFullID() + "%'";
					SQL sql = new SQL().SELECT("SID").FROM("SA_OPORG").WHERE("SORGKINDID='psm'");
					sql.WHERE("(" + excutorGroupfilters + ")");
					List<Map<String, String>> reList = DBUtils.execQueryforList("system", sql.toString(), true);
					for (int i = 0; i < reList.size(); i++) {
						epersonids.push(reList.get(i).get("SID"));
					}
				}
			}
		}
		if (epersonids.getLength() > 0) {
			for (int i = 0; i < epersonids.getLength(); i++) {
				OrgUtils OrgU = new OrgUtils(epersonids.get(i));
				ePersonList.add(OrgU);
			}
		} else {
			if (processID != null) {
				if (aftAList.size() == 1) {
					// 如果下一环节为结束环节时 不做流转确认
					if ("end".equals(aftAList.get(0).getType())) {
						OrgUtils OrgU = new OrgUtils(context);
						ePersonList.add(OrgU);
						String ntaskid = flowout(flowID, taskID, sdata1, ePersonList, aftAList);
						data.setFlag("end");
						data.setData(ntaskid);
						return data;
					}
				}
				data.setFlag("select");
				StringBuffer afterActList = new StringBuffer();
				afterActList.append("[");
				for (int i = 0; i < aftAList.size(); i++) {
					if (i > 0)
						afterActList.append(",");
					String exeGroup = aftAList.get(i).getExcutorGroup();
					if (exeGroup != null && !"".equals(exeGroup)) {
						exeGroup = exeGroup.replaceAll("getProcessID\\(\\)", processID);
						exeGroup = exeGroup.replaceAll("getFlowID\\(\\)", flowID);
						exeGroup = exeGroup.replaceAll("getTaskID\\(\\)", taskID);
						exeGroup = exeGroup.replaceAll("getProcesssData1\\(\\)", sdata1);
					}
					String excutorGroup = "";
					if (aftAList.get(i).getExcutorGroup() == null || "".equals(aftAList.get(i).getExcutorGroup())) {
						excutorGroup = BooleanExpression.getScriptExpressionVal(
								BooleanExpression.resolutionExpression("getOrgUnitHasActivity(\"" + processID + "\",\""
										+ aftAList.get(i).getId() + "\",\"FALSE\",\"FALSE\")", request));
					} else {
						excutorGroup = BooleanExpression
								.getScriptExpressionVal(BooleanExpression.resolutionExpression(exeGroup, request));
					}
					String activitylabel = aftAList.get(i).getsActivityLabel();
					if (activitylabel == null || "".equals(activitylabel)) {
						activitylabel = aftAList.get(i).getActivityname() + ":" + aftAList.get(i).getProcessName();
					} else {
						activitylabel = activitylabel.replaceAll("getProcessID\\(\\)", processID);
						activitylabel = exeGroup.replaceAll("getFlowID\\(\\)", flowID);
						activitylabel = activitylabel.replaceAll("getTaskID\\(\\)", taskID);
						activitylabel = activitylabel.replaceAll("getProcesssData1\\(\\)", sdata1);
						activitylabel = BooleanExpression
								.getScriptExpressionVal(BooleanExpression.resolutionExpression(activitylabel, request));
					}
					afterActList.append("{id:\"" + aftAList.get(i).getId() + "\",name:\""
							+ aftAList.get(i).getActivityname() + "\",label:\"" + activitylabel + "\",type:\""
							+ aftAList.get(i).getType() + "\",excutorGroup:\"" + excutorGroup + "\",excutorIDs:\""
							+ aftAList.get(i).getExcutorIDs() + "\",excutorNames:\"" + aftAList.get(i).getExcutorNames()
							+ "\"}");
				}
				afterActList.append("]");
				// System.out.println(afterActList);

				data.setData("{activityListStr:'" + afterActList.toString() + "',flowID:'" + flowID + "',taskID:'"
						+ taskID + "'}");
				return data;
			}
		}
		System.out.println(ePersonList);
		String ntaskid = flowout(flowID, taskID, sdata1, ePersonList, aftAList);
		data.setFlag("true");
		data.setData(ntaskid);
		return data;
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
	public String flowback(String flowID, String taskID) throws Exception {
		String result = "";
		try {
			ContextBean context = userController.getContext();
			SaTask task = saTaskService.selectByPrimaryKey(taskID);
			String processID = task.getSprocess();
			String curActivity = task.getSactivity();
			FlowActivity flwA = new FlowActivity(processID, curActivity);
			List<FlowActivity> ActivityList = flwA.getBeforeActivity();
			String backActivity = flwA.getBackActivity();
			String Activity = taskData.getBeforeActivity(taskID);
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
				Map<String, String> HistoryActivity = taskData.getHistoryActivity(flowID);
				for (int i = 0; i < ActivityList.size(); i++) {
					String activy = ActivityList.get(i).getActivity();
					if (activy != null) {
						if (HistoryActivity.containsKey(activy)) {
							bfepsmlist = taskData.getActivityExecutor(flowID, activy);
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
				bfepsmlist = taskData.getActivityExecutor(flowID, Activity);
			}
			if (Activity == null || "".equals(Activity))
				throw new Exception("没有前序环节!");
			if (bfepsmlist.size() < 1)
				throw new Exception("没有找到前序环节执行人!");
			String processName = taskData.getCurrentActivityName(taskID);
			String sData1 = taskData.getCurrentActivitysData1(taskID);
			result = taskData.FlowBack(processID, processName, Activity, flowID, taskID, sData1, bfepsmlist, context);
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
	public String flowforward(String flowID, String taskID, List<OrgUtils> epersonlist) throws Exception {
		String result = "";
		try {
			ContextBean context = userController.getContext();
			SaTask task = saTaskService.selectByPrimaryKey(taskID);
			String processID = task.getSprocess();
			String Activity = task.getSactivity();
			String processName = task.getSname();
			String sData1 = task.getSdata1();
			result = taskData.FlowTransmit(processID, processName, Activity, flowID, taskID, sData1, epersonlist,
					context);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	/**
	 * 转发流程
	 * 
	 * @param taskID
	 * @return
	 * @throws Exception
	 */
	public Data flowforward(String taskID) throws Exception {
		Data data = new Data();
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		String processID = task.getSprocess();
		String Activity = task.getSactivity();
		String flowID = task.getSflowid();
		String sdata1 = task.getSdata1();
		FlowActivity flwA = new FlowActivity(processID, Activity);
		List<OrgUtils> ePersonList = new ArrayList<OrgUtils>();
		if (processID != null) {
			data.setFlag("select");
			StringBuffer afterActList = new StringBuffer();
			afterActList.append("[");
			String exeGroup = flwA.getTranseRole();
			if (exeGroup != null) {
				exeGroup = exeGroup.replaceAll("getProcessID\\(\\)", processID);
				exeGroup = exeGroup.replaceAll("getFlowID\\(\\)", flowID);
				exeGroup = exeGroup.replaceAll("getTaskID\\(\\)", taskID);
				exeGroup = exeGroup.replaceAll("getProcesssData1\\(\\)", sdata1);
			}
			String excutorGroup = "";
			if (flwA.getTranseRole() == null || "".equals(flwA.getExcutorGroup())) {
				excutorGroup = BooleanExpression.getScriptExpressionVal(BooleanExpression.resolutionExpression(
						"getOrgUnitHasActivity(\"" + processID + "\",\"" + flwA.getId() + "\",\"FALSE\",\"FALSE\")",
						request));
			} else {
				excutorGroup = BooleanExpression
						.getScriptExpressionVal(BooleanExpression.resolutionExpression(exeGroup, request));
			}
			afterActList.append("{id:\"" + flwA.getId() + "\",name:\"" + flwA.getActivityname() + "\",type:\""
					+ flwA.getType() + "\",excutorGroup:\"" + excutorGroup + "\",excutorIDs:\"" + flwA.getExcutorIDs()
					+ "\",excutorNames:\"" + flwA.getExcutorNames() + "\"}");
			afterActList.append("]");
			data.setData("{activityListStr:'" + afterActList.toString() + "',flowID:'" + flowID + "',taskID:'" + taskID
					+ "'}");
			return data;
		}
		String ntaskid = flowforward(flowID, taskID, ePersonList);
		data.setData(ntaskid);
		data.setFlag("true");
		return data;
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
			taskData.FlowCancel(flowID, taskID);
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
			taskData.FlowAbort(flowID, taskID);
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
			taskData.FlowPause(flowID, taskID);
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
			taskData.FlowRestart(flowID, taskID);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

}
