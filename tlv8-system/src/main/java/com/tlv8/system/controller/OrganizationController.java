package com.tlv8.system.controller;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;

import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.MD5Util;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.pojo.SaOpPerson;
import com.tlv8.system.service.ISaOpOrgService;
import com.tlv8.system.service.ISaOpPersonService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system/org")
public class OrganizationController {

    @Autowired
    ISaOpOrgService saOpOrgService;
    @Autowired
    ISaOpPersonService saOpPersonService;

    @ResponseBody
    @RequestMapping("/orgTree")
    public Object orgTree(@RequestBody Map<String, String> param) {
        List<Map<String, Object>> res = new ArrayList<>();
        List<SaOpOrg> root_list = new ArrayList<>();
        String pid = param.get("pid");
        if (pid == null || "root".equals(pid)) {
            root_list = saOpOrgService.selectRootList();
        } else {
            root_list = saOpOrgService.selectListByParentID(pid);
        }
        for (int i = 0; i < root_list.size(); i++) {
            Map<String, Object> map = new HashMap<>();
            SaOpOrg org = root_list.get(i);
            map.put("key", org.getSid());
            map.put("id", org.getSid());
            map.put("title", org.getSname());
            map.put("name", org.getSname());
            map.put("scode", org.getScode());
            map.put("icon", getIcon(org.getSorgkindid()));
            map.put("orgkind", org.getSorgkindid());
            map.put("sfid", org.getSfid());
            map.put("sfcode", org.getSfcode());
            map.put("sfname", org.getSfname());
            List<Map<String, Object>> child = loadChild(org.getSid());
            if (child.size() > 0) {
                map.put("children", child);
            }
            res.add(map);
        }
        return res;
    }

    private List<Map<String, Object>> loadChild(String parent) {
        List<Map<String, Object>> res = new ArrayList<>();
        List<SaOpOrg> datalist = saOpOrgService.selectListByParentID(parent);
        for (int i = 0; i < datalist.size(); i++) {
            Map<String, Object> map = new HashMap<>();
            SaOpOrg org = datalist.get(i);
            map.put("key", org.getSid());
            map.put("id", org.getSid());
            map.put("title", org.getSname());
            map.put("name", org.getSname());
            map.put("scode", org.getScode());
            map.put("icon", getIcon(org.getSorgkindid()));
            map.put("orgkind", org.getSorgkindid());
            map.put("sfid", org.getSfid());
            map.put("sfcode", org.getSfcode());
            map.put("sfname", org.getSfname());
            List<Map<String, Object>> child = loadChild(org.getSid());
            if (child.size() > 0) {
                map.put("children", child);
            }
            res.add(map);
        }
        return res;
    }

    private String getIcon(String orgkind) {
        if ("ogn".equalsIgnoreCase(orgkind) || "org".equalsIgnoreCase(orgkind)) {
            return "apartment-outlined";
        } else if ("dep".equalsIgnoreCase(orgkind) || "dept".equalsIgnoreCase(orgkind)) {
            return "contacts-outlined";
        } else if ("psm".equalsIgnoreCase(orgkind) || "psn".equalsIgnoreCase(orgkind)) {
            return "user-outlined";
        }
        return "team-outlined";
    }

    @ResponseBody
    @RequestMapping("/orgList")
    public Object orgList(@RequestBody Map<String, String> param) {
        String pid = param.get("pid");
        List<Map<String, Object>> res = new ArrayList<>();
        List<SaOpOrg> root_list = new ArrayList<>();
        if (pid == null || "".equals(pid) || "root".equals(pid)) {
            root_list = saOpOrgService.selectRootList();
        } else {
            root_list = saOpOrgService.selectListByParentID(pid);
        }
        for (int i = 0; i < root_list.size(); i++) {
            Map<String, Object> map = new HashMap<>();
            SaOpOrg org = root_list.get(i);
            map.put("key", org.getSid());
            map.put("sid", org.getSid());
            map.put("ssequence", org.getSsequence());
            map.put("scode", org.getScode());
            map.put("sname", org.getSname());
            map.put("saddress", org.getSaddress());
            map.put("sdescription", org.getSdescription());
            map.put("sfid", org.getSfid());
            map.put("sfcode", org.getSfcode());
            map.put("sfname", org.getSfname());
            map.put("svalidstate", org.getSvalidstate());
            map.put("sorgkindid", org.getSorgkindid());
            map.put("spersonid", org.getSpersonid());
            map.put("version", org.getVersion());
            res.add(map);
        }
        return res;
    }

    /**
     * 加载组织信息
     *
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping("/loadOrgData")
    public Object loadOrgData(@RequestBody Map<String, String> param) {
        AjaxResult result = null;
        try {
            String id = param.get("id");
            result = AjaxResult.success(saOpOrgService.selectByPrimaryKey(id));
        } catch (Exception e) {
            e.printStackTrace();
            result = AjaxResult.error(e.getMessage());
        }
        return result;
    }

    /**
     * 保存组织信息
     *
     * @param param
     * @return
     */
    @ResponseBody
    @RequestMapping("/saveOrgData")
    public Object saveOrgData(@RequestBody SaOpOrg param) {
        AjaxResult result = null;
        try {
            String orgid = IDUtils.getGUID();
            if (StringUtils.isEmpty(param.getSid())) {
                param.setSid(orgid);
            }
            SaOpOrg porg = saOpOrgService.selectByPrimaryKey(param.getSparent());
            if (porg != null) {
                param.setSfid(porg.getSfid() + "/" + param.getSid() + "." + param.getSorgkindid());
                param.setSfcode(porg.getSfcode() + "/" + param.getScode());
                param.setSfname(porg.getSfname() + "/" + param.getSname());
                param.setSlevel(porg.getSlevel() + 1);
            } else {
                param.setSfid("/" + param.getSid() + "." + param.getSorgkindid());
                param.setSfcode("/" + param.getScode());
                param.setSfname("/" + param.getSname());
                param.setSlevel(1);
            }
            SaOpOrg org = saOpOrgService.selectByPrimaryKey(param.getSid());
            if (org != null) {
                param.setVersion(org.getVersion() + 1);
                saOpOrgService.updateData(param);
            } else {
                if ("psm".equalsIgnoreCase(param.getSorgkindid())) {//人员类型需要特殊处理
                    SaOpPerson person = saOpPersonService.selectByCode(param.getScode());
                    if (person != null) {
                        return AjaxResult.error("保存失败，用户编号已经存在！");
                    } else {
                        String psmid = IDUtils.getGUID();
                        person = new SaOpPerson();
                        person.setSid(psmid);
                        person.setScode(param.getScode());
                        person.setSname(param.getSname());
                        person.setSpassword(MD5Util.encode("123456"));//默认密码：123456
                        person.setSmainorgid(param.getSparent());
                        person.setSmobilephone(param.getSphone());
                        person.setSzip(param.getSzip());
                        person.setSfamilyaddress(param.getSaddress());
                        person.setSsequence(param.getSsequence());
                        person.setSvalidstate(1);
                        saOpPersonService.insertData(person);
                        param.setSpersonid(psmid);
                        orgid = psmid + "@" + param.getSparent();
                    }
                }
                param.setSvalidstate(1);
                param.setSid(orgid);
                param.setVersion(0);
                saOpOrgService.insertData(param);
            }
            result = AjaxResult.success("保存成功", param);
        } catch (Exception e) {
            e.printStackTrace();
            result = AjaxResult.error("保存异常：" + e.getMessage());
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/changeOrgState")
    public Object changeOrgState(@RequestBody Map<String, String> param) {
        try {
            String sid = param.get("sid");
            int state = Integer.parseInt(param.get("state"));
            SaOpOrg org = saOpOrgService.selectByPrimaryKey(sid);
            if (org != null) {
                if (state < 1 && (sid.equalsIgnoreCase("ORG01") || sid.equalsIgnoreCase("PSN01@ORG01"))) {
                    return AjaxResult.error("超管用户不能删除和禁用");
                }
                org.setSvalidstate(state);
                saOpOrgService.updateData(org);
                changeChildSate(org.getSid(), state);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("操作异常：" + e.getMessage());
        }
        return AjaxResult.success("操作成功");
    }

    private void changeChildSate(String pid, int state) {
        List<SaOpOrg> orgList = saOpOrgService.selectListByParentID(pid);
        for (SaOpOrg org : orgList) {
            if (state < 1 && (org.getSid().equalsIgnoreCase("ORG01") || org.getSid().equalsIgnoreCase("PSN01@ORG01"))) {
                continue;
            }
            org.setSvalidstate(state);
            saOpOrgService.updateData(org);
            changeChildSate(org.getSid(), state);
        }
    }

    @ResponseBody
    @RequestMapping("/moveOrg")
    public Object moveOrg(@RequestBody Map<String, String> param) {
        String orgid = param.get("orgid");
        String toid = param.get("toid");
        SaOpOrg porg = saOpOrgService.selectByPrimaryKey(toid);
        if (porg != null && !"psm".equalsIgnoreCase(porg.getSorgkindid())) {
            SaOpOrg org = saOpOrgService.selectByPrimaryKey(orgid);
            if (org != null) {
                org.setSfid(porg.getSfid() + "/" + org.getSid() + "." + org.getSorgkindid());
                org.setSfcode(porg.getSfcode() + "/" + org.getScode());
                org.setSfname(porg.getSfname() + "/" + org.getSname());
                org.setSlevel(porg.getSlevel() + 1);
                org.setSparent(porg.getSid());
                saOpOrgService.updateData(org);
                updateChildOrgPath(org);
                return AjaxResult.success("移动成功");
            }
        } else {
            SaOpOrg org = saOpOrgService.selectByPrimaryKey(orgid);
            if (org != null) {
                org.setSfid("/" + org.getSid() + "." + org.getSorgkindid());
                org.setSfcode("/" + org.getScode());
                org.setSfname("/" + org.getSname());
                org.setSlevel(1);
                org.setSparent(null);
                saOpOrgService.updateData(org);
                updateChildOrgPath(org);
                return AjaxResult.success("移动成功");
            }
            return AjaxResult.error("指定移动位置无效");
        }
        return AjaxResult.error("指定组织无效");
    }

    private void updateChildOrgPath(SaOpOrg porg) {
        List<SaOpOrg> orgList = saOpOrgService.selectListByParentID(porg.getSid());
        for (SaOpOrg org : orgList) {
            org.setSfid(porg.getSfid() + "/" + org.getSid() + "." + org.getSorgkindid());
            org.setSfcode(porg.getSfcode() + "/" + org.getScode());
            org.setSfname(porg.getSfname() + "/" + org.getSname());
            org.setSlevel(porg.getSlevel() + 1);
            saOpOrgService.updateData(org);
            updateChildOrgPath(org);
        }
    }


    @ResponseBody
    @RequestMapping("/loadRecycle")
    public Object loadRecycle() {
        JSONArray jsona = new JSONArray();
        List<SaOpOrg> dataList = saOpOrgService.selectRecycleList();
        for (SaOpOrg org : dataList) {
            JSONObject json = JSONObject.parseObject(JSON.toJSONString(org));
            json.put("key", org.getSid());
            json.put("id", org.getSid());
            jsona.add(json);
        }
        return AjaxResult.success(jsona);
    }

    @ResponseBody
    @RequestMapping("/reCoverOrg")
    public Object reCoverOrg(@RequestBody Map<String, String> param) {
        String[] orgids = param.get("orgids").split(",");
        for (String orgid : orgids) {
            SaOpOrg org = saOpOrgService.selectByPrimaryKey(orgid);
            if (org != null) {
                org.setSvalidstate(1);
                if ("psm".equalsIgnoreCase(org.getSorgkindid())) {
                    SaOpPerson person = saOpPersonService.selectByPrimaryKey(org.getSpersonid());
                    if (person != null) {
                        person.setSvalidstate(1);
                        saOpPersonService.updateData(person);
                    }
                }
                saOpOrgService.updateData(org);
            }
        }
        return AjaxResult.success();
    }

    @ResponseBody
    @RequestMapping("/clearOrg")
    public Object clearOrg(@RequestBody Map<String, String> param) {
        String[] orgids = param.get("orgids").split(",");
        for (String orgid : orgids) {
            SaOpOrg org = saOpOrgService.selectByPrimaryKey(orgid);
            if (org != null) {
                clearChild(org.getSid());
                if ("psm".equalsIgnoreCase(org.getSorgkindid())) {
                    SaOpPerson person = saOpPersonService.selectByPrimaryKey(org.getSpersonid());
                    if (person != null) {
                        saOpPersonService.deleteData(person);
                    }
                }
                saOpOrgService.deleteData(org);
            }
        }
        return AjaxResult.success();
    }

    private void clearChild(String pid) {
        List<SaOpOrg> orgs = saOpOrgService.selectAllByParentID(pid);
        for (SaOpOrg org : orgs) {
            clearChild(org.getSid());
            if ("psm".equalsIgnoreCase(org.getSorgkindid())) {
                SaOpPerson person = saOpPersonService.selectByPrimaryKey(org.getSpersonid());
                if (person != null) {
                    saOpPersonService.deleteData(person);
                }
            }
            saOpOrgService.deleteData(org);
        }
    }


}
