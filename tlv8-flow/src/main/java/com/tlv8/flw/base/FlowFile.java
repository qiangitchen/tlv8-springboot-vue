package com.tlv8.flw.base;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.flw.pojo.SaFlowdrawlg;
import com.tlv8.flw.service.SaFlowdrawlgService;
import com.tlv8.flw.service.SaFlowfolderService;
import com.tlv8.system.bean.ContextBean;

/**
 * 流程图存取类
 * 
 * @author 陈乾
 *
 */
@Component
public class FlowFile {
	@Autowired
	SaFlowdrawlgService saFlowdrawlgService;
	@Autowired
	SaFlowfolderService saFlowfolderService;

	/**
	 * 获取流程图信息方法
	 * 
	 * @param processID
	 * @return
	 */
	public Map<String, String> getFlowDraw(String processID) {
		Map<String, String> result = new HashMap<>();
		try {
			SaFlowdrawlg flowdr = saFlowdrawlgService.selectBySprocessid(processID);
			if (flowdr != null) {
				result.put("SDRAWLG", flowdr.getSdrawlg());
				result.put("SPROCESSACTY", flowdr.getSprocessacty());
				result.put("SPROCESSNAME", flowdr.getSprocessname());
				result.put("SPROCESSID", flowdr.getSprocessid());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 保存流程图信息方法
	 * 
	 * @param processID
	 * @param sprocessname
	 * @param sdranwlg
	 * @param sprocessacty
	 * @param context
	 */
	public void saveFlowDraw(String processID, String sprocessname, String sdranwlg, String sprocessacty,
			ContextBean context) {
		String userID = context.getCurrentPersonID();
		String userName = context.getCurrentPersonName();
		try {
			SaFlowdrawlg flowdr = saFlowdrawlgService.selectBySprocessid(processID);
			if (flowdr != null) {
				flowdr.setSprocessname(sprocessname);
				flowdr.setSdrawlg(sdranwlg);
				flowdr.setSprocessacty(sprocessacty);
				saFlowdrawlgService.updateByPrimaryKey(flowdr);
			} else {
				SaFlowdrawlg nflowdr = new SaFlowdrawlg();
				nflowdr.setSid(IDUtils.getGUID());
				nflowdr.setSprocessid(processID);
				nflowdr.setSprocessacty(sprocessacty);
				nflowdr.setSprocessname(sprocessname);
				nflowdr.setSdrawlg(sdranwlg);
				nflowdr.setScreatorid(userID);
				nflowdr.setScreatorname(userName);
				nflowdr.setScreatetime(new Date());
				nflowdr.setVersion(0);
				saFlowdrawlgService.insert(nflowdr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除流程图信息方法
	 * 
	 * @param processID
	 */
	public void deleteFlowDraw(String processID) {
		try {
			SaFlowdrawlg flowdr = saFlowdrawlgService.selectBySprocessid(processID);
			if (flowdr != null) {
				saFlowdrawlgService.deleteByPrimaryKey(flowdr.getSid());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
