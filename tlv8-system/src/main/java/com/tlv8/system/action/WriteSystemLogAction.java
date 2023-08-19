package com.tlv8.system.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.IPUtils;
import com.tlv8.system.pojo.SaLog;
import com.tlv8.system.pojo.SaMenuTree;
import com.tlv8.system.service.ISaLogService;
import com.tlv8.system.service.ISaMenuTreeService;
import com.tlv8.system.utils.OrgUtils;

/**
 * @P 写系统日志
 * @author ChenQain
 * @C 2011-12-20
 */
@Controller
@Scope("prototype")
public class WriteSystemLogAction extends ActionSupport {
	private Data data;
	private String personID;
	private String srcPath;
	private String discription;
	private String processName;
	private String activateName;
	private String actionName;

	public Data getdata() {
		return this.data;
	}

	public void setdata(Data data) {
		this.data = data;
	}

	@Autowired
	ISaLogService saLogService;
	@Autowired
	ISaMenuTreeService saMenuTreeService;

	@ResponseBody
	@RequestMapping(value = "/WriteSystemLogAction", method = RequestMethod.POST)
	public Object execute() throws Exception {
		data = new Data();
		if (personID == null || "".equals(personID)) {
			data.setFlag("false");
			data.setMessage("用户ID为空!");
			return data;
		}
		String cpath = request.getContextPath();
		if (srcPath.startsWith(cpath)) {
			srcPath = srcPath.substring(cpath.length());
		}
		OrgUtils user = new OrgUtils(personID);
		String SCREATORFID = user.getPersonFullID() == null ? "" : user.getPersonFullID();
		String SCREATORFNAME = user.getPersonFullName() == null ? "" : user.getPersonFullName();
		String SCREATORPERSONID = user.getPersonID() == null ? "" : user.getPersonID();
		String SCREATORPERSONNAME = user.getPersonName() == null ? "" : user.getPersonName();
		String SCREATORPOSID = user.getPositionID() == null ? "" : user.getPositionID();
		String SCREATORPOSNAME = user.getPositionName() == null ? "" : user.getPositionName();
		String SCREATORDEPTID = user.getDeptID() == null ? "" : user.getDeptID();
		String SCREATORDEPTNAME = user.getDeptName() == null ? "" : user.getDeptName();
		String SCREATOROGNID = user.getOgnID() == null ? "" : user.getOgnID();
		String SCREATOROGNNAME = user.getOgnName() == null ? "" : user.getOgnName();
		String sIP = IPUtils.getRemoteAddr(request);
		String customer = "PC端页面";
		String process = "";
		String activity = "";
		try {
			if (srcPath != null && !"".equals(srcPath)) {
				if (srcPath.indexOf("/mobileUI/") > 0) {
					srcPath = srcPath.replace("/mobileUI/", "/");
					customer = "手机端访问";
				}
				List<SaMenuTree> mms = saMenuTreeService.selectByPath(srcPath);
				if (mms.size() > 0) {
					SaMenuTree saMenuTree = mms.get(0);
					SaMenuTree pmenu = saMenuTreeService.selectByPrimaryKey(saMenuTree.getPid());
					if (pmenu != null) {
						processName = pmenu.getLabel();
						activateName = saMenuTree.getLabel();
					} else {
						processName = saMenuTree.getLabel();
						activateName = saMenuTree.getLabel();
					}
					process = saMenuTree.getProcess();
					activity = saMenuTree.getActivity();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (activateName == null || "".equals(activateName)) {
			data.setFlag("false");
			data.setMessage("不是已知的功能!");
			return data;
		}
		SaLog saLog = new SaLog();
		saLog.setSid(IDUtils.getGUID());
		saLog.setSaction(srcPath);
		saLog.setSaction(customer);
		saLog.setSactionname(actionName);
		saLog.setSdescription(discription);
		saLog.setSprocess(process);
		saLog.setSprocessname(processName);
		saLog.setSactivity(activity);
		saLog.setSactivityname(activateName);
		saLog.setSip(sIP);
		saLog.setScreatetime(new Date());
		saLog.setScreatordeptid(SCREATORDEPTID);
		saLog.setScreatordeptname(SCREATORDEPTNAME);
		saLog.setScreatorfid(SCREATORFID);
		saLog.setScreatorfname(SCREATORFNAME);
		saLog.setScreatorognid(SCREATOROGNID);
		saLog.setScreatorognname(SCREATOROGNNAME);
		saLog.setScreatorpersonid(SCREATORPERSONID);
		saLog.setScreatorpersonname(SCREATORPERSONNAME);
		saLog.setScreatorposid(SCREATORPOSID);
		saLog.setScreatorposname(SCREATORPOSNAME);
		saLogService.insertData(saLog);
		data.setFlag("true");
		return data;
	}

	public void setActionName(String actionName) {
		try {
			this.actionName = URLDecoder.decode(actionName, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getActionName() {
		return actionName;
	}

	public void setProcessName(String processName) {
		try {
			this.processName = URLDecoder.decode(processName, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getProcessName() {
		return processName;
	}

	public void setActivateName(String activateName) {
		try {
			this.activateName = URLDecoder.decode(activateName, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getActivateName() {
		return activateName;
	}

	public String getPersonID() {
		return personID;
	}

	public void setPersonID(String personID) {
		try {
			this.personID = URLDecoder.decode(personID, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getSrcPath() {
		return srcPath;
	}

	public void setSrcPath(String srcPath) {
		try {
			this.srcPath = URLDecoder.decode(srcPath, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		try {
			this.discription = URLDecoder.decode(discription, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}
