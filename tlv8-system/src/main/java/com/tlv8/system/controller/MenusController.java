package com.tlv8.system.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.tlv8.system.service.ISaMenuTreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.common.utils.FileAndString;

@Controller
@RequestMapping("/system")
@SuppressWarnings("rawtypes")
public class MenusController {

    @Autowired
    ISaMenuTreeService saMenuTreeService;

    @RequestMapping("/Menu/loadMenuTree")
    @ResponseBody
    public Object loadMenuTree() {
        return AjaxResult.success(saMenuTreeService.selectList());
    }

    @RequestMapping("/User/getUserMenusArray")
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

}
