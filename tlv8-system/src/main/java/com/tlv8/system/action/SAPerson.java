package com.tlv8.system.action;

import com.tlv8.system.pojo.SysLogin;
import org.springframework.beans.factory.annotation.Autowired;

import com.tlv8.system.pojo.SaOpPerson;
import com.tlv8.system.service.ISaOpPersonService;
import com.tlv8.system.service.ISysLoginService;

/**
 * 用户同步签名
 *
 * @author chenqian
 */
public class SAPerson {

    @Autowired
    ISaOpPersonService personservice;

    @Autowired
    ISysLoginService iSysLoginService;
    
    /**
     * 更新CA证书
     *
     * @param personid
     * @param sn
     */
    public void addCASN(String personid, String sn) {
        SaOpPerson person = personservice.selectByPrimaryKey(personid);
        if (person != null) {
            person.setFcasn(sn);
            personservice.updateData(person);
        }
    }

    /**
     * 更新签名
     *
     * @param personid
     * @param signm
     */
    public void addSign(String personid, String signm) {
        SaOpPerson person = personservice.selectByPrimaryKey(personid);
        if (person != null) {
            person.setFsignm(signm);
            personservice.updateData(person);
        }
    }

    /**
     * 更新密码
     *
     * @param username
     * @param password
     * @param new_password
     * @throws Exception
     */
    public void changePassword(String username, String password, String new_password) throws Exception {
        SysLogin sysLogin = iSysLoginService.getInfoByCode(username, username, username);
        if (sysLogin != null) {
            if (sysLogin.getSpassword().equals(password)) {
                SaOpPerson person = personservice.selectByPrimaryKey(sysLogin.getPersonid());
                if (person != null) {
                    person.setSpassword(new_password);
                    personservice.updateData(person);
                    return;
                }
            }
        }
        throw new Exception("密码验证失败！");
    }

}