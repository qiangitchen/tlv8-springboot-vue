package com.tlv8.system.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.pojo.SaOpManagement;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.service.ISaOpManagementService;
import com.tlv8.system.service.ISaOpOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system/manage")
public class ManagementController {

    @Autowired
    ISaOpManagementService saOpManagementService;

    @Autowired
    ISaOpOrgService saOpOrgService;

    @Autowired
    UserController userController;

    @RequestMapping("/loadManagement")
    @ResponseBody
    public Object loadManagement(@RequestBody Map<String, String> param) {
        String orgid = param.get("orgid");
        JSONArray jsona = new JSONArray();
        List<SaOpManagement> dataList = saOpManagementService.selectByOrgID(orgid);
        for (SaOpManagement management : dataList) {
            JSONObject json = (JSONObject) JSONObject.toJSON(management);
            json.put("id", management.getSid());
            json.put("key", management.getSid());
            json.put("createtime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(management.getScreatetime()));
            jsona.add(json);
        }
        return AjaxResult.success(jsona);
    }

    @RequestMapping("/saveManagement")
    @ResponseBody
    public Object saveManagement(@RequestBody Map<String, String> param) {
        String orgid = param.get("orgid");
        String manage = param.get("manage");
        String manageType = param.get("manageType");
        if (manageType == null) {
            manageType = "systemManagement";
        }
        SaOpOrg org = saOpOrgService.selectByPrimaryKey(orgid);
        SaOpOrg morg = saOpOrgService.selectByPrimaryKey(manage);
        if (org != null && morg != null) {
            SaOpManagement management = new SaOpManagement();
            management.setSid(IDUtils.getGUID());
            management.setScreatetime(new Date());
            ContextBean context = userController.getContext();
            management.setScreatorfid(context.getCurrentPersonFullID());
            management.setScreatorfname(context.getCurrentPersonFullName());
            management.setSmanageorgfid(morg.getSfid());
            management.setSmanageorgfname(morg.getSfname());
            management.setSmanageorgid(morg.getSid());
            management.setSmanageorgname(morg.getSname());
            management.setSorgfid(org.getSfid());
            management.setSorgfname(org.getSfname());
            management.setSorgid(org.getSid());
            management.setSorgname(org.getSname());
            management.setSmanagetypeid(manageType);
            management.setVersion(0);
            saOpManagementService.insertData(management);
            return AjaxResult.success();
        } else {
            return AjaxResult.error("保存失败：指定的组织无效");
        }
    }

    @RequestMapping("/deleteManagement")
    @ResponseBody
    public Object deleteManagement(@RequestBody Map<String, String> param) {
        String[] rmids = param.get("rmids").split(",");
        for (String id : rmids) {
            saOpManagementService.deleteDataByPrimaryKey(id);
        }
        return AjaxResult.success();
    }

}