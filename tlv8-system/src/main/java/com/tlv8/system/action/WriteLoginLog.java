package com.tlv8.system.action;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.IPUtils;
import com.tlv8.system.help.PassCodeHelper;
import com.tlv8.system.pojo.SaLoginlog;
import com.tlv8.system.service.ISaLoginlogService;

public class WriteLoginLog {

	@Autowired
	ISaLoginlogService loginlogService;

	public void write(String userID, String userName, String sIP, String password, HttpServletRequest request) {
		if (sIP == null || "0:0:0:0:0:0:0:1".equals(sIP))
			sIP = "127.0.0.1";
		String logPassword = PassCodeHelper.enCode(password);
		String serverip = IPUtils.getIP();
		SaLoginlog loginlog = new SaLoginlog();
		loginlog.setSid(IDUtils.getGUID());
		loginlog.setSuserid(userID);
		loginlog.setSusername(userName);
		loginlog.setPassword(logPassword);
		loginlog.setSloginip(sIP);
		loginlog.setSserviceip(serverip);
		loginlog.setSday(dateToWeek(new Date()));
		Calendar calendar = Calendar.getInstance();
		loginlog.setSdaynum(calendar.get(Calendar.DAY_OF_WEEK));
		loginlog.setSlogintime(new Date());
		loginlog.setVersion(0);
		loginlogService.insertData(loginlog);
	}

	/**
	 * 日期转星期
	 *
	 * @param datet
	 * @return
	 */
	public String dateToWeek(Date datet) {
		String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
		// 获得一个日历
		Calendar cal = Calendar.getInstance();
		cal.setTime(datet);
		// 指示一个星期中的某天。
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		if (w < 0) {
			w = 0;
		}
		return weekDays[w];
	}
}
