package com.tlv8.flw.service.impl;

import com.tlv8.flw.mapper.SaTaskMapper;
import com.tlv8.flw.pojo.SaTask;
import com.tlv8.flw.service.SaTaskService;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by TLv8 IDE on 2023/04/13.
 */
@Service
public class SaTaskServiceImpl implements SaTaskService {
	@Autowired
	private SaTaskMapper saTaskMapper;

	public int deleteByPrimaryKey(String id) {
		return saTaskMapper.deleteByPrimaryKey(id);
	}

	public int insert(SaTask row) {
		return saTaskMapper.insert(row);
	}

	public SaTask selectByPrimaryKey(String id) {
		return saTaskMapper.selectByPrimaryKey(id);
	}

	public List<SaTask> selectAll() {
		return saTaskMapper.selectAll();
	}

	public int updateByPrimaryKey(SaTask row) {
		return saTaskMapper.updateByPrimaryKey(row);
	}

	public int cancelOtherTask(String taskID, String ptaskID, String beforeActivity, String flowID) {
		Map<String, Object> param = new HashMap<>();
		param.put("taskID", taskID);
		param.put("ptaskID", ptaskID);
		param.put("beforeActivity", beforeActivity);
		param.put("flowID", flowID);
		return saTaskMapper.cancelOtherTask(param);
	}

	public int accomplishFlow(String flowID) {
		return saTaskMapper.accomplishFlow(flowID);
	}

	public List<SaTask> selectByFlowID(String flowID) {
		return saTaskMapper.selectByFlowID(flowID);
	}

	public List<SaTask> selectByFlowActivity(String flowID, String activity) {
		Map<String, Object> param = new HashMap<>();
		param.put("flowID", flowID);
		param.put("activity", activity);
		return saTaskMapper.selectByFlowActivity(param);
	}

	public List<SaTask> selectActivityOtherTask(String flowID, String activity, String taskID, String statusid) {
		Map<String, Object> param = new HashMap<>();
		param.put("flowID", flowID);
		param.put("activity", activity);
		param.put("taskID", taskID);
		param.put("statusid", statusid);
		return saTaskMapper.selectActivityOtherTask(param);
	}

}
