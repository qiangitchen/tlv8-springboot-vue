package com.tlv8.oa.mail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.oa.pojo.OaEmReceiveemail;
import com.tlv8.oa.service.OaEmReceiveemailService;
import com.tlv8.system.utils.ContextUtils;

@Controller
@Scope("prototype")
public class LoadMailPortalInfo extends ActionSupport {
	@Autowired
	OaEmReceiveemailService oaEmReceiveemailService;

	@ResponseBody
	@RequestMapping("/loadMailPortalInfo")
	@Override
	public Object execute() throws Exception {
		Data data = new Data();
		LambdaQueryWrapper<OaEmReceiveemail> wrapper = Wrappers.lambdaQuery(OaEmReceiveemail.class);
		wrapper.eq(OaEmReceiveemail::getFconsigneeid, ContextUtils.getContext().getCurrentPersonID());
		wrapper.eq(OaEmReceiveemail::getFqurey, "未查看");
		wrapper.orderByDesc(OaEmReceiveemail::getFsendtime);
		try {
			List<OaEmReceiveemail> list = oaEmReceiveemailService.list(wrapper);
			data.setData(JSON.toJSONString(list));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage("加载数据错误!");
			e.printStackTrace();
		}
		return success(data);
	}

}
