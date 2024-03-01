package com.tlv8.flw.base;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.flw.expression.BooleanExpression;
import com.tlv8.flw.pojo.SaTask;
import com.tlv8.flw.service.SaTaskService;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.OrgUtils;

/**
 * 流程任务数据操作
 * 
 * @author 陈乾
 *
 * @update 2023-04-13
 */
@Component
public class TaskData {
	@Autowired
	SaTaskService saTaskService;

	/**
	 * 启动流程
	 */
	public String startFlow(String processID, String processName, String sData1, ContextBean context)
			throws SQLException {
		String flowID = IDUtils.getGUID();
		String taskID = flowID;
		SaTask task = new SaTask(context, sData1);
		task.setSid(taskID);
		task.setSflowid(flowID);
		task.setSprocess(processID);
		task.setSname(processName);
		task.setSstatusid("tesExecuting");
		task.setSstatusname("正在处理");
		task.setSepersonid(context.getCurrentPersonID());
		task.setSepersoncode(context.getCurrentPersonCode());
		task.setSepersonname(context.getCurrentPersonName());
		task.setSeposid(context.getCurrentPositionID());
		task.setSeposcode(context.getCurrentPositionCode());
		task.setSeposname(context.getCurrentPositionName());
		task.setSedeptid(context.getCurrentDeptID());
		task.setSedeptcode(context.getCurrentDeptCode());
		task.setSedeptname(context.getCurrentDeptName());
		task.setSeognid(context.getCurrentOgnID());
		task.setSeogncode(context.getCurrentOgnCode());
		task.setSeognname(context.getCurrentOgnName());
		task.setSefid(context.getCurrentPersonFullID());
		task.setSefname(context.getCurrentPersonFullName());
		saTaskService.insert(task);
		return flowID;
	}

	/**
	 * 流转
	 */
	public String FlowOut(String processID, String processName, String Activity, String flowID, String taskID,
			String sData1, List<OrgUtils> ePersonList, HttpServletRequest request, ContextBean context)
			throws Exception {
		Map<String, String> m = checktesReady(taskID);
		if (!"tesReady".equals(m.get("SSTATUSID")) && !"tesExecuting".equals(m.get("SSTATUSID"))) {
			throw new Exception("当前任务:" + (String) m.get("SSTATUSNAME") + ",不能流转.");
		}
		// String actType = (new FlowActivity(processID, Activity)
		// .getBeforeActivity().get(0).getType());
		FlowActivity act = new FlowActivity(processID, Activity);
		String beforeActivity = getCurrentActivity(taskID); // 流转时参考当前环节
		FlowActivity beforeAct = new FlowActivity(processID, beforeActivity);
		String actType = beforeAct.getType();
		String SSTATUSID = "tesReady";
		String SSTATUSNAME = "尚未处理";
		String newtaskIDs = "";
		if ("end".equals(act.getType())) {
			SSTATUSID = "tesFinished";
			SSTATUSNAME = "已完成";
		}
		// processName = act.getActivityname() + ":" + processName;// 任务标题
		String activitylabel = act.getsActivityLabel();
		if ((activitylabel == null) || ("".equals(activitylabel))) {
			processName = act.getActivityname() + ":" + act.getProcessName();
		}else {
			activitylabel = activitylabel.replaceAll("getProcessID\\(\\)", flowID);
			activitylabel = activitylabel.replaceAll("getTaskID\\(\\)", taskID);
			activitylabel = activitylabel.replaceAll("getProcesssData1\\(\\)", sData1);
			processName = BooleanExpression
					.getScriptExpressionVal(BooleanExpression.resolutionExpression(activitylabel, request));
		}
		String eURL = act.getUrl();
		String cURL = beforeAct.getUrl();
		for (int i = 0; i < ePersonList.size(); i++) {
			String newtaskID = IDUtils.getGUID();
			newtaskIDs = newtaskID;
			OrgUtils euser = ePersonList.get(i);
			if ("".equals(euser.getPersonID()) || euser.getPersonID() == null) {
				throw new Exception("流转失败,指定的执行人错误!\n 提示:请注意选择执行人.");
			}
			SaTask task = new SaTask(context, sData1);
			task.setSid(newtaskID);
			task.setSparentid(taskID);
			task.setSflowid(flowID);
			task.setSprocess(processID);
			task.setSactivity(Activity);
			task.setSname(processName);
			task.setSstatusid(SSTATUSID);
			task.setSstatusname(SSTATUSNAME);
			task.setScurl(cURL);
			task.setSeurl(eURL);
			task.setSepersonid(euser.getPersonID());
			task.setSepersoncode(euser.getPersonCode());
			task.setSepersonname(euser.getPersonName());
			task.setSeposid(euser.getPositionID());
			task.setSeposcode(euser.getPositionCode());
			task.setSeposname(euser.getPositionName());
			task.setSedeptid(euser.getDeptID());
			task.setSedeptcode(euser.getDeptCode());
			task.setSedeptname(euser.getDeptName());
			task.setSeognid(euser.getOgnID());
			task.setSeogncode(euser.getOgnCode());
			task.setSeognname(euser.getOgnName());
			task.setSefid(euser.getPersonFullID());
			task.setSefname(euser.getPersonFullName());
			task.setSastarttime(new Date());
			saTaskService.insert(task);
		}
		if (ePersonList.size() > 0) {
			if (!"".equals(actType) && !"start".equals(actType)) {
				SaTask task = saTaskService.selectByPrimaryKey(taskID);
				if (!"tesExecuting".equals(task.getSstatusid())) {
					task.setSstatusid("tesFinished");
					task.setSstatusname("已完成");
					task.setSexecutetime(new Date());
					task.setSafinishtime(new Date());
					task.setVersion(task.getVersion() + 1);
					saTaskService.updateByPrimaryKey(task);
				}
				String ptaskID = getCurrentTaskParentID(taskID);
				// 非共同模式时取消其他待办[当前环节]
				if (!"together".equals(beforeAct.getGrapModle())) {
					saTaskService.cancelOtherTask(taskID, ptaskID, beforeActivity, flowID);
				}
			}
			// 是否为空或结束环节[下一环节]
			if (act.getAfterActivity(request).size() == 0 || "end".equals(act.getType())) {// 流程结束 完成所有待办
				saTaskService.accomplishFlow(flowID);
				return "";
			}
		}
		return newtaskIDs;
	}

	/**
	 * 转发
	 * 
	 * @param processID
	 * @param processName
	 * @param Activity
	 * @param flowID
	 * @param taskID
	 * @param sData1
	 * @param ePersonList
	 * @param context
	 * @return String 最新的任务id
	 * @throws SQLException
	 */
	public String FlowTransmit(String processID, String processName, String Activity, String flowID, String taskID,
			String sData1, List<OrgUtils> ePersonList, ContextBean context) throws SQLException {
		FlowActivity act = new FlowActivity(processID, Activity);
		processName = act.getActivityname() + ":" + processName;// 任务标题
		String eURL = act.getUrl();
		String cURL = eURL;
		String newtaskID = "";
		for (int i = 0; i < ePersonList.size(); i++) {
			OrgUtils euser = ePersonList.get(i);
			newtaskID = IDUtils.getGUID();
			SaTask task = new SaTask(context, sData1);
			task.setSid(newtaskID);
			task.setSparentid(taskID);
			task.setSflowid(flowID);
			task.setSprocess(processID);
			task.setSactivity(Activity);
			task.setSname(processName);
			task.setSstatusid("tesReady");
			task.setSstatusname("尚未处理");
			task.setScurl(cURL);
			task.setSeurl(eURL);
			task.setSepersonid(euser.getPersonID());
			task.setSepersoncode(euser.getPersonCode());
			task.setSepersonname(euser.getPersonName());
			task.setSeposid(euser.getPositionID());
			task.setSeposcode(euser.getPositionCode());
			task.setSeposname(euser.getPositionName());
			task.setSedeptid(euser.getDeptID());
			task.setSedeptcode(euser.getDeptCode());
			task.setSedeptname(euser.getDeptName());
			task.setSeognid(euser.getOgnID());
			task.setSeogncode(euser.getOgnCode());
			task.setSeognname(euser.getOgnName());
			task.setSefid(euser.getPersonFullID());
			task.setSefname(euser.getPersonFullName());
			task.setSastarttime(new Date());
			saTaskService.insert(task);
		}
		if (ePersonList.size() > 0) {
			SaTask task = saTaskService.selectByPrimaryKey(taskID);
			task.setSstatusid("tesTransmit");
			task.setSstatusname("已转发");
			task.setSexecutetime(new Date());
			task.setVersion(task.getVersion() + 1);
			saTaskService.updateByPrimaryKey(task);
		}
		return newtaskID;
	}

	/**
	 * 回退
	 */
	public String FlowBack(String processID, String processName, String Activity, String flowID, String taskID,
			String sData1, List<OrgUtils> ePersonList, ContextBean context) throws SQLException {
		FlowActivity act = new FlowActivity(processID, Activity);
		String nprocessName = act.getActivityname();// 任务标题
		processName = nprocessName + "←回退-" + processName;
		String eURL = act.getUrl();
		String cuActivity = getCurrentActivity(taskID);
		FlowActivity Cuact = new FlowActivity(processID, cuActivity);
		String cURL = Cuact.getUrl();
		String newtaskID = "";
		for (int i = 0; i < ePersonList.size(); i++) {
			OrgUtils euser = ePersonList.get(i);
			newtaskID = IDUtils.getGUID();
			SaTask task = new SaTask(context, sData1);
			task.setSid(newtaskID);
			task.setSparentid(taskID);
			task.setSflowid(flowID);
			task.setSprocess(processID);
			task.setSactivity(Activity);
			task.setSname(processName);
			task.setSstatusid("tesReady");
			task.setSstatusname("尚未处理");
			task.setScurl(cURL);
			task.setSeurl(eURL);
			task.setSepersonid(euser.getPersonID());
			task.setSepersoncode(euser.getPersonCode());
			task.setSepersonname(euser.getPersonName());
			task.setSeposid(euser.getPositionID());
			task.setSeposcode(euser.getPositionCode());
			task.setSeposname(euser.getPositionName());
			task.setSedeptid(euser.getDeptID());
			task.setSedeptcode(euser.getDeptCode());
			task.setSedeptname(euser.getDeptName());
			task.setSeognid(euser.getOgnID());
			task.setSeogncode(euser.getOgnCode());
			task.setSeognname(euser.getOgnName());
			task.setSefid(euser.getPersonFullID());
			task.setSefname(euser.getPersonFullName());
			task.setSastarttime(new Date());
			saTaskService.insert(task);
		}
		if (ePersonList.size() > 0) {
			SaTask task = saTaskService.selectByPrimaryKey(taskID);
			task.setSstatusid("tesReturned");
			task.setSstatusname("已回退");
			task.setSexecutetime(new Date());
			task.setVersion(task.getVersion() + 1);
			saTaskService.updateByPrimaryKey(task);
			String ptaskID = getCurrentTaskParentID(taskID);
			saTaskService.cancelOtherTask(taskID, ptaskID, cuActivity, flowID);
		}
		return newtaskID;
	}

	/**
	 * 取消
	 */
	public void FlowCancel(String flowID, String taskID) throws SQLException {
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		task.setSstatusid("tesCanceled");
		task.setSstatusname("已取消");
		task.setSexecutetime(new Date());
		task.setVersion(task.getVersion() + 1);
		saTaskService.updateByPrimaryKey(task);
	}

	/**
	 * 终止
	 */
	public void FlowAbort(String flowID, String taskID) throws SQLException {
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		task.setSstatusid("tesAborted");
		task.setSstatusname("已终止");
		task.setSexecutetime(new Date());
		task.setVersion(task.getVersion() + 1);
		saTaskService.updateByPrimaryKey(task);
		SaTask flow = saTaskService.selectByPrimaryKey(flowID);
		flow.setSstatusid("tesAborted");
		flow.setSstatusname("已终止");
		flow.setSexecutetime(new Date());
		flow.setVersion(task.getVersion() + 1);
		saTaskService.updateByPrimaryKey(flow);
	}

	/**
	 * 暂停
	 */
	public void FlowPause(String flowID, String taskID) throws SQLException {
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		task.setSstatusid("tesPause");
		task.setSstatusname("已暂停");
		saTaskService.updateByPrimaryKey(task);
		SaTask flow = saTaskService.selectByPrimaryKey(flowID);
		flow.setSstatusid("tesPause");
		flow.setSstatusname("已暂停");
		saTaskService.updateByPrimaryKey(flow);
	}

	/**
	 * 激活
	 */
	public void FlowRestart(String flowID, String taskID) throws SQLException {
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		task.setSstatusid("tesReady");
		task.setSstatusname("尚未处理");
		saTaskService.updateByPrimaryKey(task);
		SaTask flow = saTaskService.selectByPrimaryKey(flowID);
		flow.setSstatusid("tesExecuting");
		flow.setSstatusname("正在处理");
		saTaskService.updateByPrimaryKey(flow);
	}

	/**
	 * 验证状态
	 */
	public Map<String, String> checktesReady(String taskID) {
		Map<String, String> rsmap = new HashMap<>();
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		if (task != null) {
			rsmap.put("SSTATUSID", task.getSstatusid());
			rsmap.put("SSTATUSNAME", task.getSstatusname());
		}
		return rsmap;
	}

	/**
	 * 获取当前流程标识
	 */
	public String getCurrentProcessID(String taskID) {
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		if (task != null) {
			return task.getSprocess();
		}
		return null;
	}

	/**
	 * 获取流程标识
	 */
	public String getProcessID(String flowID) {
		String SPROCESS = null;
		List<SaTask> li = saTaskService.selectByFlowID(flowID);
		if (li.size() > 0) {
			SPROCESS = li.get(0).getSprocess();
		}
		return SPROCESS;
	}

	/**
	 * 获取流程flow标识
	 */
	public String getFlowID(String taskID) {
		String SPROCESS = null;
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		if (task != null) {
			return task.getSprocess();
		}
		return SPROCESS;
	}

	/**
	 * 获取当前所在环节标识
	 */
	public String getCurrentActivity(String taskID) {
		String activity = null;
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		if (task != null) {
			activity = task.getSactivity();
		}
		if (activity == null) {
			return "start";
		}
		return activity;
	}

	/**
	 * 获取当前所在环节任务名称
	 */
	public String getCurrentActivityName(String taskID) {
		String activity = "";
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		if (task != null) {
			return task.getSname();
		}
		return activity;
	}

	/**
	 * 获取当前所在环节sData1
	 */
	public String getCurrentActivitysData1(String taskID) {
		String sdata = "";
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		if (task != null) {
			return task.getSdata1();
		}
		return sdata;
	}

	/**
	 * 获取提交环节标识
	 */
	public String getBeforeActivity(String taskID) {
		String activity = "startActivity";
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		if (task != null) {
			SaTask ptask = saTaskService.selectByPrimaryKey(task.getSparentid());
			if (ptask != null) {
				activity = ptask.getSactivity();
			}
		}
		return activity;
	}

	/**
	 * 获取提交环节执行人
	 * 
	 * @flowID 流程ID
	 * 
	 * @url 执行地址
	 */
	public List<OrgUtils> getBeforeActivityExecutor(String flowID, String url) {
		List<OrgUtils> list = new ArrayList<>();
		List<SaTask> li = saTaskService.selectByFlowID(flowID);
		for (SaTask task : li) {
			if (url.equals(task.getSeurl())) {
				OrgUtils org = new OrgUtils(task.getSepersonid());
				list.add(org);
			}
		}
		return list;
	}

	/**
	 * 获取提指定环节执行人
	 * 
	 * @flowID 流程ID
	 * 
	 * @activity 环节
	 */
	public List<OrgUtils> getActivityExecutor(String flowID, String activity) {
		List<OrgUtils> list = new ArrayList<>();
		List<SaTask> li = saTaskService.selectByFlowActivity(flowID, activity);
		if (li.size() > 0) {
			String personid = li.get(0).getSepersonid();
			OrgUtils org = new OrgUtils(personid);
			list.add(org);
		}
		return list;
	}

	/**
	 * 获取提交环节执行人
	 * 
	 * @taskID 任务ID
	 */
	public List<OrgUtils> getBeforeActivityExecutor(String taskID) {
		List<OrgUtils> list = new ArrayList<>();
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		if (task != null) {
			SaTask ptask = saTaskService.selectByPrimaryKey(task.getSparentid());
			if (ptask != null && "tesFinished".equals(ptask.getSstatusid())) {
				String personid = ptask.getSepersonid();
				OrgUtils org = new OrgUtils(personid);
				list.add(org);
			}
		}
		return list;
	}

	/**
	 * 检测流程是否已经结束
	 */
	public boolean checkisfinished(String flowID) throws SQLException {
		SaTask task = saTaskService.selectByPrimaryKey(flowID);
		if (task != null) {
			return "tesFinished".equals(task.getSstatusid());
		}
		return false;
	}

	/**
	 * 获取任务信息{标题、执行页面、单据ID、执行人ID、提交人ID}
	 */
	public Map<String, String> getTaskInfor(String taskID, String executor) {
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		if (task != null) {
			Map<String, String> hm = new HashMap<>();
			hm.put("name", task.getSname());
			hm.put("url", task.getSeurl());
			hm.put("sData1", task.getSdata1());
			hm.put("flowID", task.getSflowid());
			hm.put("process", task.getSprocess());
			hm.put("activity", task.getSactivity());
			return hm;
		}
		return null;
	}

	/**
	 * 获取已走过的环节
	 */
	public Map<String, String> getHistoryActivity(String flowID) throws SQLException {
		Map<String, String> activityList = new HashMap<>();
		List<SaTask> li = saTaskService.selectByFlowID(flowID);
		for (int i = 0; i < li.size(); i++) {
			String activity = li.get(i).getSactivity();
			String activityName = li.get(i).getSname();
			activityList.put(activity, activityName);
		}
		return activityList;
	}

	/**
	 * 获取当前任务的父ID
	 */
	public String getCurrentTaskParentID(String taskID) {
		String ptid = "";
		SaTask task = saTaskService.selectByPrimaryKey(taskID);
		if (task != null) {
			ptid = task.getSparentid();
		}
		return ptid;
	}
}
