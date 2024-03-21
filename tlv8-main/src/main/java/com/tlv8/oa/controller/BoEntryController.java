package com.tlv8.oa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tlv8.common.base.Data;
import com.tlv8.common.domain.AjaxResult;
import com.tlv8.oa.pojo.BoEntry;
import com.tlv8.oa.service.BoEntryService;
import com.tlv8.system.utils.ContextUtils;

@RestController
public class BoEntryController {
	@Autowired
	private BoEntryService boEntryService;

	@RequestMapping("/getPortalBofoAction")
	public Object getPortalBofoAction() {
		Data data = new Data();
		try {
			String userid = ContextUtils.getContext().getCurrentPersonID();
			LambdaQueryWrapper<BoEntry> wrapper = Wrappers.lambdaQuery(BoEntry.class);
			wrapper.eq(BoEntry::getCreatorid, userid);
			List<BoEntry> list = boEntryService.list(wrapper);
			data.setData(JSONArray.toJSONString(list));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage("加载数据错误!");
			e.printStackTrace();
		}
		return AjaxResult.success(data);
	}

}
