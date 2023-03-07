package com.tlv8.system.online;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
 */
@Component
public class InitOnlineInfoAction {

	@Autowired
	ISaOnlineinfoService onlineinfosvr;

	public void execute(ContextBean context, String token) throws Exception {
		String MachineCode = License.getMachineCode();
		try {
			SaOnlineinfo sonlineinfo = onlineinfosvr.selectBySessionID(token);
			if (sonlineinfo != null) {
				sonlineinfo.setSuserid(context.getCurrentPersonID());
				sonlineinfo.setSusername(context.getCurrentPersonName());
				sonlineinfo.setSuserfid(context.getCurrentPersonFullID());
				sonlineinfo.setSuserfname(context.getCurrentPersonFullName());
				sonlineinfo.setSloginip(context.getIp());
				sonlineinfo.setSlogindate(new Date());
				sonlineinfo.setSsessionid(token);
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
				onlineinfo.setSsessionid(token);
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
			onlineinfo.setSsessionid(token);
			onlineinfo.setSserviceip(IPUtils.getIP());
			onlineinfo.setSmachinecode(MachineCode);
			onlineinfosvr.insertData(onlineinfo);
		}
	}

}
