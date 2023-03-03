package com.tlv8.system.controller;

import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.service.ISaOpOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @ResponseBody
    @RequestMapping("/orgTree")
    public Object orgTree() {
        List<Map<String, Object>> res = new ArrayList<>();
        List<SaOpOrg> root_list = saOpOrgService.selectRootList();
        for (int i = 0; i < root_list.size(); i++) {
            Map<String, Object> map = new HashMap<>();
            SaOpOrg org = root_list.get(i);
            map.put("key", org.getSid());
            map.put("title", org.getSname());
            map.put("icon", getIcon(org.getSorgkindid()));
            map.put("orgkind", org.getSorgkindid());
            map.put("sfid", org.getSfid());
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
            map.put("title", org.getSname());
            map.put("icon", getIcon(org.getSorgkindid()));
            map.put("orgkind", org.getSorgkindid());
            map.put("sfid", org.getSfid());
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
    public Object orgList(String pid) {
        List<Map<String, Object>> res = new ArrayList<>();
        List<SaOpOrg> root_list = new ArrayList<>();
        if (pid == null) {
            root_list = saOpOrgService.selectRootList();
        } else {
            root_list = saOpOrgService.selectListByParentID(pid);
        }
        for (int i = 0; i < root_list.size(); i++) {
            Map<String, Object> map = new HashMap<>();
            SaOpOrg org = root_list.get(i);
            map.put("key", org.getSid());
            map.put("SSEQUENCE", org.getSsequence());
            map.put("SCODE", org.getScode());
            map.put("SNAME", org.getSname());
            map.put("SADDRESS", org.getSaddress());
            map.put("SDESCRIPTION", org.getSdescription());
            map.put("sfid", org.getSfid());
            map.put("sfcode", org.getSfcode());
            map.put("sfname", org.getSfname());
            map.put("svalidstate", org.getSvalidstate());
            map.put("sorgkindid", org.getSorgkindid());
            map.put("version", org.getVersion());
            res.add(map);
        }
        return res;
    }

}
