package com.tlv8.system.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.pojo.SaMenu;
import com.tlv8.system.pojo.SaMenuTree;
import com.tlv8.system.service.ISaMenuService;
import com.tlv8.system.service.ISaMenuTreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.FileAndString;

@Controller
@RequestMapping("/system")
@SuppressWarnings("rawtypes")
public class MenusController {

    @Autowired
    ISaMenuTreeService saMenuTreeService;

    @Autowired
    ISaMenuService saMenuService;

    @Autowired
    UserController userController;

    @RequestMapping("/Menu/loadMenuTree")
    @ResponseBody
    public Object loadMenuTree() {
        JSONArray jsona = new JSONArray();
        List<SaMenuTree> roots = saMenuTreeService.selectRootList();
        for (SaMenuTree me : roots) {
            JSONObject json = (JSONObject) JSONObject.toJSON(me);
            json.put("id", me.getSid());
            json.put("key", me.getSid());
            JSONArray child = loadMenuChild(me.getSid());
            if (!child.isEmpty()) {
                json.put("children", child);
            }
            jsona.add(json);
        }
        return AjaxResult.success(jsona);
    }

    private JSONArray loadMenuChild(String pid) {
        JSONArray jsona = new JSONArray();
        List<SaMenuTree> roots = saMenuTreeService.selectByPID(pid);
        for (SaMenuTree me : roots) {
            JSONObject json = (JSONObject) JSONObject.toJSON(me);
            json.put("id", me.getSid());
            json.put("key", me.getSid());
            JSONArray child = loadMenuChild(me.getSid());
            if (!child.isEmpty()) {
                json.put("children", child);
            }
            jsona.add(json);
        }
        return jsona;
    }

    @RequestMapping("/Menu/loadMenuData")
    @ResponseBody
    public Object loadMenuData(@RequestBody Map<String, String> param) {
        String id = param.get("id");
        return AjaxResult.success(saMenuTreeService.selectByPrimaryKey(id));
    }

    @RequestMapping("/User/getUserMenusArray")
    @ResponseBody
    public Object getUserMenusArray() {
        ContextBean context = userController.getContext();
        List<SaMenu> list = saMenuService.selectList(context.getCurrentPersonID(), context.getCurrentPersonFullID());
        System.out.println(list);
        if (list.size() < 1 && "PSN01".equals(context.getCurrentPersonID())) {
            Resource resource = new ClassPathResource("menuList.json");
            try {
                String menuList = FileAndString.FileToString(resource.getFile());
                return AjaxResult.success(JSON.parseArray(menuList));
            } catch (IOException e) {
                e.printStackTrace();
                return AjaxResult.error(e.getMessage());
            }
        }
        return AjaxResult.success(list);
    }

}
