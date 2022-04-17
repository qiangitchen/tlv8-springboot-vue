package com.tlv8.system.online;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.common.mac.License;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.IPUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.pojo.SaOnlineinfo;
import com.tlv8.system.service.ISaOnlineinfoService;

/**
 * 添加或更新在线用户信息
 * 
 * @author chenqian_17817450957
 *
 */
public class InitOnlineInfoAction {

	@Autowired
	ISaOnlineinfoService onlineinfosvr;

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ContextBean context = ContextBean.getContext(request);
		if (context == null || context.getCurrentPersonID() == null || "".equals(context.getCurrentPersonID())) {
			// 如果没有登录成功则不做处理
			return;
		}
		String MachineCode = License.getMachineCode();
		try {
			SaOnlineinfo sonlineinfo = onlineinfosvr.selectBySessionID(context.getSessionID());
			if (sonlineinfo != null) {
				sonlineinfo.setSuserid(context.getCurrentPersonID());
				sonlineinfo.setSusername(context.getCurrentPersonName());
				sonlineinfo.setSuserfid(context.getCurrentPersonFullID());
				sonlineinfo.setSuserfname(context.getCurrentPersonFullName());
				sonlineinfo.setSloginip(context.getIp());
				sonlineinfo.setSlogindate(new Date());
				sonlineinfo.setSsessionid(context.getSessionID());
				sonlineinfo.setSserviceip(IPUtils.getIP());
				sonlineinfo.setSmachinecode(MachineCode);
				onlineinfosvr.updateData(sonlineinfo);
			} else {
				SaOnlineinfo onlineinfo = new SaOnlineinfo();
				onlineinfo.setSid(IDUtils.getGUID());
				onlineinfo.setSuserid(context.getCurrentPersonID());
				onlineinfo.setSusername(context.getCurrentPersonName());
				onlineinfo.setSuserfid(context.getCurrentPersonFullID());
				onlineinfo.setSuserfname(context.getCurrentPersonFullName());
				onlineinfo.setSloginip(context.getIp());
				onlineinfo.setSlogindate(new Date());
				onlineinfo.setSsessionid(context.getSessionID());
				onlineinfo.setSserviceip(IPUtils.getIP());
				onlineinfo.setSmachinecode(MachineCode);
				onlineinfosvr.insertData(onlineinfo);
			}
		} catch (Exception e) {
			SaOnlineinfo onlineinfo = new SaOnlineinfo();
			onlineinfo.setSid(IDUtils.getGUID());
			onlineinfo.setSuserid(context.getCurrentPersonID());
			onlineinfo.setSusername(context.getCurrentPersonName());
			onlineinfo.setSuserfid(context.getCurrentPersonFullID());
			onlineinfo.setSuserfname(context.getCurrentPersonFullName());
			onlineinfo.setSloginip(context.getIp());
			onlineinfo.setSlogindate(new Date());
			onlineinfo.setSsessionid(context.getSessionID());
			onlineinfo.setSserviceip(IPUtils.getIP());
			onlineinfo.setSmachinecode(MachineCode);
			onlineinfosvr.insertData(onlineinfo);
		}
	}

}
