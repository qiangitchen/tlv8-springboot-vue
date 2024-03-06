package com.tlv8.flw.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.base.Data;
import com.tlv8.flw.base.FlowFolderTree;
import com.tlv8.flw.bean.FlowFolderTreeBean;
import com.tlv8.flw.pojo.SaFlowdrawlg;
import com.tlv8.flw.pojo.SaFlowfolder;
import com.tlv8.flw.service.SaFlowdrawlgService;
import com.tlv8.flw.service.SaFlowfolderService;

/**
 * @author ChenQain
 */
@Controller
@Scope("prototype")
public class FlowFolderControler extends FlowFolderTreeBean {
	private static final Logger logger = LoggerFactory.getLogger(FlowFolderControler.class);
	@Autowired
	SaFlowfolderService saFlowfolderService;
	@Autowired
	SaFlowdrawlgService saFlowdrawlgService;

	private Data data = new Data();

	public Data getData() {
		return this.data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	/**
	 * 获取目录树
	 */
	@ResponseBody
	@RequestMapping("/getflwFolderAction")
	public Object loadflwFolder() {
		data = new Data();
		String r = "true";
		String m = "success";
		String f = "";
		try {
			r = FlowFolderTree.getFolderJsonStr();
		} catch (Exception e) {
			m = "操作失败：" + e.toString();
			f = "false";
			logger.error(e.toString());
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		return success(data);
	}

	/**
	 * 编辑目录
	 */
	@ResponseBody
	@RequestMapping("/editflwFolderAction")
	public Object editflwFolder() {
		data = new Data();
		String r = "true";
		String m = "success";
		String f = "";
		try {
			SaFlowfolder flowFolder = saFlowfolderService.selectByPrimaryKey(getId());
			if (flowFolder != null) {
				flowFolder.setSname(getName());
				flowFolder.setSprocessid(getSprocessid());
				flowFolder.setSprocessname(getSprocessname());
				flowFolder.setSnamepath(getSnamepath());
				saFlowfolderService.updateByPrimaryKey(flowFolder);
			} else {
				return insertflwFolder();
			}
		} catch (Exception e) {
			m = "操作失败：" + e.toString();
			f = "false";
			logger.error(e.toString());
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		return success(data);
	}

	/**
	 * 添加目录
	 */
	@ResponseBody
	@RequestMapping(value = "/insertflwFolderAction", method = RequestMethod.POST)
	public Object insertflwFolder() {
		data = new Data();
		String r = "true";
		String m = "success";
		String f = "";
		try {
			SaFlowfolder flowFolder = new SaFlowfolder();
			flowFolder.setSid(getId());
			flowFolder.setSparent(getPid());
			flowFolder.setScode(getScode());
			flowFolder.setSname(getName());
			flowFolder.setSidpath(getSidpath());
			flowFolder.setScodepath(getScodepath());
			flowFolder.setSnamepath(getSnamepath());
			flowFolder.setVersion(0);
			saFlowfolderService.insert(flowFolder);
		} catch (Exception e) {
			m = "操作失败：" + e.toString();
			f = "false";
			logger.error(e.toString());
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		return success(data);
	}

	/**
	 * 删除目录
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteflwFolderAction", method = RequestMethod.POST)
	public Object deleteflwFolder() {
		data = new Data();
		String r = "true";
		String m = "success";
		String f = "";
		try {
			List<SaFlowfolder> fli = saFlowfolderService.selectByParent(getId());
			if (fli.size() > 0) {
				m = "操作失败，目录存在子目录不能直接删除!";
			} else {
				List<SaFlowdrawlg> li = saFlowdrawlgService.selectByFolderID(getId());
				if (li.size() > 0) {
					m = "操作失败，目录下存在流程图不能直接删除!";
				} else {
					saFlowfolderService.deleteByPrimaryKey(getId());
				}
			}
		} catch (Exception e) {
			m = "操作失败：" + e.toString();
			f = "false";
			logger.error(e.toString());
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		return success(data);
	}

}
