package com.tlv8.system.action;

import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.IPUtils;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.controller.UserController;
import com.tlv8.system.pojo.SaLog;
import com.tlv8.system.service.ISaLogService;
import com.tlv8.system.service.ISaMenuTreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UrlPathHelper;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Date;

@Component
public class WriteLog {

    @Autowired
    ISaLogService saLogService;
    @Autowired
    ISaMenuTreeService saMenuTreeService;
    @Autowired
    UserController userController;

    /**
     * 写系统日志（访问日志）
     *
     * @param request
     */
    public void writeLog(HttpServletRequest request) {
        String sIP = IPUtils.getRemoteAddr(request);
//        String returnPath = getRefererPath(request);
        String action = request.getParameter("action");
        if (StringUtils.isBlank(action)) {
            action = request.getRequestURI();
        }
        String process = request.getParameter("process");
        String activity = request.getParameter("activity");
        SaLog log = new SaLog();
        log.setSid(IDUtils.getGUID());
        log.setSaction(action);
        log.setSip(sIP);
        log.setSactivity(activity);
        log.setSprocess(process);
        log.setScreatetime(new Date());
        ContextBean contextBean = userController.getContext();
        if (contextBean.isLogin()) {
            log.setScreatorognid(contextBean.getCurrentOgnID());
            log.setScreatorognname(contextBean.getCurrentOgnName());
            log.setScreatordeptid(contextBean.getCurrentDeptID());
            log.setScreatordeptname(contextBean.getCurrentDeptName());
            log.setScreatorposid(contextBean.getCurrentPositionID());
            log.setScreatorposname(contextBean.getCurrentPositionName());
            log.setScreatorpersonid(contextBean.getPersonID());
            log.setScreatorpersonname(contextBean.getPersonName());
            log.setScreatorfid(contextBean.getCurrentPersonFullID());
            log.setScreatorfname(contextBean.getCurrentPersonFullName());
            saLogService.insertData(log);
        }
    }

    public static String getRefererPath(HttpServletRequest request) {
        String returnurl = request.getHeader("Referer");
        String host = request.getRemoteAddr();
        return returnurl.replace(host, "");
    }

    /**
     * 获得当前访问的URL路径
     *
     * @param request
     * @return
     */
    public static String getLocation(HttpServletRequest request) {
        UrlPathHelper helper = new UrlPathHelper();
        StringBuffer buff = request.getRequestURL();
        String uri = request.getRequestURI();
        String origUri = helper.getOriginatingRequestUri(request);
        buff.replace(buff.length() - uri.length(), buff.length(), origUri);
        String queryString = helper.getOriginatingQueryString(request);
        if (queryString != null) {
            buff.append("?").append(queryString);
        }
        try {
            return new String(buff.toString().getBytes(), "iso-8859-1");
        } catch (UnsupportedEncodingException e) {
            return buff.toString();
        }
    }
}