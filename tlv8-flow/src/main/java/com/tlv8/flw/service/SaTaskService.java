package com.tlv8.flw.service;

import com.tlv8.flw.pojo.SaTask;

import java.util.List;

/**
 * Created by TLv8 IDE on 2023/04/13.
 */
public interface SaTaskService {

	int deleteByPrimaryKey(String id);

	int insert(SaTask row);

	SaTask selectByPrimaryKey(String id);

	List<SaTask> selectAll();

	int updateByPrimaryKey(SaTask row);

	/**
	 * 非共同模式时取消其他待办[当前环节]
	 * 
	 * @param taskID
	 * @param ptaskID
	 * @param beforeActivity
	 * @param flowID
	 * @return int 更新数据条数
	 */
	int cancelOtherTask(String taskID, String ptaskID, String beforeActivity, String flowID);

	/**
	 * 流程结束 完成所有待办
	 * 
	 * @param flowID
	 * @return int 更新数据条数
	 */
	int accomplishFlow(String flowID);

	/**
	 * 根据流程id获取任务列表
	 * 
	 * @param flowID
	 * @return
	 */
	List<SaTask> selectByFlowID(String flowID);

	/**
	 * 获取流程指定环节的任务列表(已处理)
	 * 
	 * @param flowID
	 * @param activity
	 * @return
	 */
	List<SaTask> selectByFlowActivity(String flowID, String activity);

	/**
	 * 获取指定环节其他任务列表（状态）
	 * 
	 * @param flowID
	 * @param activity
	 * @param taskID
	 * @param statusid
	 * @return
	 */
	List<SaTask> selectActivityOtherTask(String flowID, String activity, String taskID, String statusid);
}
