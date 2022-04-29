package com.tlv8.system.controller;

import com.tlv8.common.db.DBUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/system/test")
public class TestController {

    @ResponseBody
    @RequestMapping("/dbselect")
    public Object loadData(){
        try {
            return DBUtils.selectStringList("system","select sid,scode,sname from sa_opperson");
        } catch (Exception e) {
           e.printStackTrace();
        }
        return null;
    }

}
