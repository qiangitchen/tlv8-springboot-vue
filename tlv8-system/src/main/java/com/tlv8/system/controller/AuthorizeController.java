package com.tlv8.system.controller;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;

import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.pojo.SaOpAuthorize;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.pojo.SaOpRole;
import com.tlv8.system.service.ISaOpAuthorizeService;
import com.tlv8.system.service.ISaOpOrgService;
import com.tlv8.system.service.ISaOpRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system/Auth")
public class AuthorizeController {

    @Autowired
    ISaOpAuthorizeService saOpAuthorizeService;

    @Autowired
    ISaOpRoleService saOpRoleService;

    @Autowired
    ISaOpOrgService saOpOrgService;

    @Autowired
    UserController userController;

    @ResponseBody
    @RequestMapping("/loadAuthorizeByOrgID")
    public Object loadAuthorizeByOrgID(@RequestBody Map<String, String> param) {
        String orgid = param.get("orgid");
        List<SaOpAuthorize> authList = saOpAuthorizeService.selectByOrgID(orgid);
        JSONArray jsona = new JSONArray();
        for (SaOpAuthorize auth : authList) {
            JSONObject json = JSONObject.parseObject(JSONObject.toJSONString(auth));
            json.put("key", auth.getSid());
            json.put("id", auth.getSid());
            SaOpRole role = saOpRoleService.selectByPrimaryKey(auth.getSauthorizeroleid());
            json.put("rcode", role.getScode());
            json.put("rname", role.getSname());
            json.put("rtype", role.getScatalog());
            jsona.add(json);
        }
        return AjaxResult.success(jsona);
    }

    @ResponseBody
    @RequestMapping("/saveAuthorize")
    public Object saveAuthorize(@RequestBody Map<String, String> param) {
        String orgid = param.get("orgid");
        String[] roles = param.get("roles").split(",");
        SaOpOrg org = saOpOrgService.selectByPrimaryKey(orgid);
        if (org != null) {
            ContextBean context = userController.getContext();
            for (String roleid : roles) {
                SaOpRole role = saOpRoleService.selectByPrimaryKey(roleid);
                if (role != null) {
                    SaOpAuthorize authorize = saOpAuthorizeService.selectByOrgRole(orgid, roleid);
                    boolean isnew = false;
                    if (authorize == null) {
                        authorize = new SaOpAuthorize();
                        authorize.setSid(IDUtils.getGUID());
                        authorize.setScreatetime(new Date());
                        authorize.setScreatorfid(context.getCurrentPersonFullID());
                        authorize.setScreatorfname(context.getCurrentPersonFullName());
                        authorize.setVersion(0);
                        isnew = true;
                    }
                    authorize.setSauthorizeroleid(role.getSid());
                    authorize.setSdescription(role.getSname());
                    authorize.setSorgid(org.getSid());
                    authorize.setSorgname(org.getSname());
                    authorize.setSorgfid(org.getSfid());
                    authorize.setSorgfname(org.getSfname());
                    if (isnew) {
                        saOpAuthorizeService.insertData(authorize);
                    } else {
                        saOpAuthorizeService.updateData(authorize);
                    }
                }
            }
            return AjaxResult.success("授权成功");
        } else {
            return AjaxResult.error("指定的组织无效");
        }
    }

    @ResponseBody
    @RequestMapping("/removeAuthorizes")
    public Object removeAuthorizes(@RequestBody Map<String, String> param) {
        String[] aus = param.get("aus").split(",");
        for (String auid : aus) {
            SaOpAuthorize authorize = saOpAuthorizeService.selectByPrimaryKey(auid);
            if (authorize != null) {
                if (("PSN01@ORG01".equals(authorize.getSorgid()) || authorize.getSorgid().contains("PSN01")) && "RL01".equals(authorize.getSauthorizeroleid())) {
                    //超管权限不能删除
                    continue;
                }
                saOpAuthorizeService.deleteData(authorize);
            }
        }
        return AjaxResult.success("删除成功");
    }

}