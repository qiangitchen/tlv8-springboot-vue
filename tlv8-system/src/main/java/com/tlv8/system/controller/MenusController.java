package com.tlv8.system.controller;

import com.alibaba.fastjson.JSON;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.FileAndString;
import com.tlv8.system.service.ISaMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system/User")
public class MenusController {

    @Autowired
    ISaMenuService saMenuService;

    @RequestMapping("/getUserMenusArray")
    @ResponseBody
    public Object getUserMenusArray() {
        List list = new ArrayList();
        if (list.size() < 1) {
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

    @RequestMapping("/getUserMenusTree")
    @ResponseBody
    public Object getUserMenusTree() {
        List list = saMenuService.selectList();
        if (list.size() < 1) {
            Resource resource = new ClassPathResource("menuTree.json");
            try {
                return AjaxResult.success(JSON.parseArray(FileAndString.FileToString(resource.getFile())));
            } catch (IOException e) {
                e.printStackTrace();
                return AjaxResult.error(e.getMessage());
            }
        }
        return AjaxResult.success(list);
    }
}
