package com.tlv8.flw.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.flw.helper.ExpressionTreeHelper;

/**
 * @author ChenQian
 * @category 获取表达式配置列表(树)
 */
@Controller
@Scope("prototype")
public class GetExpressionTree extends ActionSupport {

	@ResponseBody
	@RequestMapping("GetExpressionTreeAction")
	public Object execute() throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			data.put("data", new ExpressionTreeHelper().getExpressionTreeMapList());
			data.put("flag", "true");
		} catch (Exception e) {
			data.put("flag", "false");
			data.put("message", e.toString());
			e.printStackTrace();
		}
		return data;
	}

}
