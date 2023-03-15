package com.tlv8.system.controller;

import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.MD5Util;
import com.tlv8.system.pojo.SaOpPerson;
import com.tlv8.system.service.ISaOpPersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/system/person")
public class PersonController {
    @Autowired
    ISaOpPersonService saOpPersonService;

    /**
     * 重置指定用户的密码
     *
     * @param param
     */
    @ResponseBody
    @RequestMapping("/resetPassword")
    public Object resetPassword(@RequestBody Map<String, String> param) {
        try {
            String personid = param.get("personid");
            SaOpPerson person = saOpPersonService.selectByPrimaryKey(personid);
            if (person != null) {
                person.setSpassword(MD5Util.encode("123456"));
                saOpPersonService.updateData(person);
                return AjaxResult.success("操作成功");
            }
        } catch (Exception e) {
            return AjaxResult.error("操作异常:" + e.getMessage());
        }
        return AjaxResult.error("指定的用户无效");
    }

}
