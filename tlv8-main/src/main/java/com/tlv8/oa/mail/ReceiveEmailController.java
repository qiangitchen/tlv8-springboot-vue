package com.tlv8.oa.mail;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.tlv8.oa.pojo.OaEmReceiveemail;
import com.tlv8.oa.service.OaEmReceiveemailService;

@Controller
@RequestMapping("/receiveEmail")
public class ReceiveEmailController {
	@Autowired
	OaEmReceiveemailService oaEmReceiveemailService;

	/**
	 * 标记邮件已查看
	 * 
	 * @param rowid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/upQurey")
	public Object upQurey(String rowid) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			OaEmReceiveemail oaEmReceiveemail = oaEmReceiveemailService.getById(rowid);
			if (oaEmReceiveemail != null) {
				oaEmReceiveemail.setFqurey("已查看");
				oaEmReceiveemailService.updateById(oaEmReceiveemail);
			}
			res.put("state", true);
		} catch (Exception e) {
			res.put("state", false);
			e.printStackTrace();
		}
		return res;
	}

	/**
	 * 标记所有‘未查看’邮件已查看
	 * 
	 * @param consigneeid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/martAlltoRead")
	public Object martAlltoRead(String consigneeid) {
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			LambdaUpdateWrapper<OaEmReceiveemail> wrapper = Wrappers.lambdaUpdate(OaEmReceiveemail.class);
			wrapper.set(OaEmReceiveemail::getFqurey, "已查看");
			wrapper.eq(OaEmReceiveemail::getFconsigneeid, consigneeid);
			wrapper.eq(OaEmReceiveemail::getFqurey, "未查看");
			oaEmReceiveemailService.update(wrapper);
			res.put("state", true);
		} catch (Exception e) {
			res.put("state", false);
			e.printStackTrace();
		}
		return res;
	}

}
