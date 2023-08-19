package com.tlv8.opm.menu;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.StringUtils;

@Controller
@RequestMapping("/menu")
public class FunctionTreeController {

	/**
	 * 加载菜单配置-树形列表数据
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loadFunctionTree")
	public Object loadFunctionTree() {
		Map<String, Object> m = new HashMap<>();
		SQL sql = new SQL();
		sql.SELECT("*");
		sql.FROM("sa_opmenutree").ORDER_BY("sorts asc");
		try {
			List<Map<String, Object>> list = DBUtils.selectForList("system", sql.toString());
			List<Map<String, Object>> data = new ArrayList<>();
			for (Map<String, Object> map : list) {
				Map<String, Object> d = new HashMap<>();
				for (String k : map.keySet()) {
					d.put(k.toLowerCase(), map.get(k));
				}
				if (map.get("pid") == null) {
					d.put("pid", "");
				}
				if (!StringUtils.isEmpty(map.get("process")) && !StringUtils.isEmpty(map.get("activity"))) {
					d.put("isMenu", true);
				}
				data.add(d);
			}
			m.put("count", data.size());
			m.put("data", data);
			m.put("code", "0");
			m.put("msg", "");
		} catch (SQLException e) {
			e.printStackTrace();
			m.put("code", "-1");
			m.put("msg", "加载异常：" + e.getMessage());
		}
		return m;
	}

}
