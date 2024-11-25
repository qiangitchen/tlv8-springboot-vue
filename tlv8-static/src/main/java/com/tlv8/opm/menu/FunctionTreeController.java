package com.tlv8.opm.menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.utils.StringUtils;
import com.tlv8.system.pojo.SaMenuTree;
import com.tlv8.system.service.ISaMenuTreeService;

@Controller
@RequestMapping("/menu")
public class FunctionTreeController {

	@Autowired
	ISaMenuTreeService saMenuTreeService;

	/**
	 * 加载菜单配置-树形列表数据
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loadFunctionTree")
	public Object loadFunctionTree() {
		Map<String, Object> m = new HashMap<>();
		try {
			List<SaMenuTree> list = saMenuTreeService.selectList();
			List<Map<String, Object>> data = new ArrayList<>();
			for (SaMenuTree menu : list) {
				Map<String, Object> mn = new HashMap<>();
				JSONObject d = new JSONObject(menu);
				for (String key : d.keySet()) {
					mn.put(key, d.get(key));
				}
				if (StringUtils.isNull(mn.get("pid"))) {
					mn.put("pid", "");
				}
				if (!StringUtils.isEmpty(mn.get("process")) && !StringUtils.isEmpty(mn.get("activity"))) {
					mn.put("isMenu", true);
				}
				data.add(mn);
			}
			m.put("count", data.size());
			m.put("data", data);
			m.put("code", "0");
			m.put("msg", "");
		} catch (Exception e) {
			m.put("code", "-1");
			m.put("msg", "加载异常：" + e.getMessage());
			e.printStackTrace();
		}
		return m;
	}

}
