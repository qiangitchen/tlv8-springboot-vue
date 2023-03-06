package com.tlv8.system.action;

import java.util.HashMap;

import com.tlv8.system.pojo.SysLogin;
import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.system.service.ISysLoginService;

@SuppressWarnings({"rawtypes", "unchecked"})
public class Login {

    @Autowired
    ISysLoginService iSysLoginService;

    private String message;

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessage() {
        return this.message;
    }

    public HashMap<String, String> doLogin(String username, String password, String ip, String logintype)
            throws Exception {
        HashMap<String, String> m = new HashMap<String, String>();
        try {
            SysLogin sysLogin = iSysLoginService.getInfoByCode(username, username, username);
            if (sysLogin != null) {
                m.put("username", sysLogin.getUsername());
                m.put("personID", sysLogin.getPersonid());
                m.put("personName", sysLogin.getPersonname());
                m.put("personCode", sysLogin.getPersoncode());
                m.put("orgID", sysLogin.getOrgid());
                m.put("orgName", sysLogin.getOrgname());
                m.put("orgPath", sysLogin.getOrgpath());
                m.put("agentPersonID", sysLogin.getAgentpersonid());
                m.put("agentPersonName", sysLogin.getAgentpersonname());
                m.put("agentPersonCode", sysLogin.getAgentpersoncode());
                m.put("agentOrgID", sysLogin.getAgentorgid());
                m.put("agentOrgName", sysLogin.getAgentorgname());
                m.put("agentOrgPath", sysLogin.getAgentorgpath());
                m.put("mobilephone", sysLogin.getSmobilephone());
                if (!password.equalsIgnoreCase(sysLogin.getSpassword())) {
                    throw new Exception("用户名或密码错误!");
                }
                if ("-1".equals(sysLogin.getSvalidstate())) {
                    throw new Exception("用户已被删除!");
                } else if (!"1".equals(sysLogin.getSvalidstate())) {
                    throw new Exception("您的账号暂时无法登陆，请联系管理员。");
                }
            } else {
                throw new Exception("用户名或密码错误!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }

    public HashMap<String, String> MD5doLogin(String username, String password) throws Exception {
        HashMap m = new HashMap();
        try {
            SysLogin sysLogin = iSysLoginService.getInfoByCode(username, username, username);
            if (sysLogin != null) {
                m.put("username", sysLogin.getUsername());
                m.put("personID", sysLogin.getPersonid());
                m.put("personName", sysLogin.getPersonname());
                m.put("personCode", sysLogin.getPersoncode());
                m.put("orgID", sysLogin.getOrgid());
                m.put("orgName", sysLogin.getOrgname());
                m.put("orgPath", sysLogin.getOrgpath());
                m.put("agentPersonID", sysLogin.getAgentpersonid());
                m.put("agentPersonName", sysLogin.getAgentpersonname());
                m.put("agentPersonCode", sysLogin.getAgentpersoncode());
                m.put("agentOrgID", sysLogin.getAgentorgid());
                m.put("agentOrgName", sysLogin.getAgentorgname());
                m.put("agentOrgPath", sysLogin.getAgentorgpath());
                m.put("mobilephone", sysLogin.getSmobilephone());
                if (!password.equalsIgnoreCase(sysLogin.getSpassword())) {
                    throw new Exception("用户名或密码错误!");
                }
                if ("-1".equals(sysLogin.getSvalidstate())) {
                    throw new Exception("用户已被删除!");
                } else if (!"1".equals(sysLogin.getSvalidstate())) {
                    throw new Exception("您的账号暂时无法登陆，请联系管理员。");
                }
            } else {
                throw new Exception("用户名或密码错误!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }

    public HashMap<String, String> CAdoLogin(String sn) throws Exception {
        HashMap m = new HashMap();
        try {
            SysLogin sysLogin = iSysLoginService.getInfoByCASN(sn);
            if (sysLogin != null) {
                m.put("username", sysLogin.getUsername());
                m.put("personID", sysLogin.getPersonid());
                m.put("personName", sysLogin.getPersonname());
                m.put("personCode", sysLogin.getPersoncode());
                m.put("orgID", sysLogin.getOrgid());
                m.put("orgName", sysLogin.getOrgname());
                m.put("orgPath", sysLogin.getOrgpath());
                m.put("agentPersonID", sysLogin.getAgentpersonid());
                m.put("agentPersonName", sysLogin.getAgentpersonname());
                m.put("agentPersonCode", sysLogin.getAgentpersoncode());
                m.put("agentOrgID", sysLogin.getAgentorgid());
                m.put("agentOrgName", sysLogin.getAgentorgname());
                m.put("agentOrgPath", sysLogin.getAgentorgpath());
                m.put("mobilephone", sysLogin.getSmobilephone());
                if ("-1".equals(sysLogin.getSvalidstate())) {
                    throw new Exception("用户已被删除!");
                } else if (!"1".equals(sysLogin.getSvalidstate())) {
                    throw new Exception("您的账号暂时无法登陆，请联系管理员。");
                }
            } else {
                throw new Exception("证书无效或未配置!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }

    public HashMap<String, String> sCAdoLogin(String signm) throws Exception {
        HashMap m = new HashMap();
        try {
            SysLogin sysLogin = iSysLoginService.getInfoBySignm(signm);
            if (sysLogin != null) {
                m.put("username", sysLogin.getUsername());
                m.put("personID", sysLogin.getPersonid());
                m.put("personName", sysLogin.getPersonname());
                m.put("personCode", sysLogin.getPersoncode());
                m.put("orgID", sysLogin.getOrgid());
                m.put("orgName", sysLogin.getOrgname());
                m.put("orgPath", sysLogin.getOrgpath());
                m.put("agentPersonID", sysLogin.getAgentpersonid());
                m.put("agentPersonName", sysLogin.getAgentpersonname());
                m.put("agentPersonCode", sysLogin.getAgentpersoncode());
                m.put("agentOrgID", sysLogin.getAgentorgid());
                m.put("agentOrgName", sysLogin.getAgentorgname());
                m.put("agentOrgPath", sysLogin.getAgentorgpath());
                m.put("mobilephone", sysLogin.getSmobilephone());
                if ("-1".equals(sysLogin.getSvalidstate())) {
                    throw new Exception("用户已被删除!");
                } else if (!"1".equals(sysLogin.getSvalidstate())) {
                    throw new Exception("您的账号暂时无法登陆，请联系管理员。");
                }
            } else {
                throw new Exception("证书无效或未配置!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }
}