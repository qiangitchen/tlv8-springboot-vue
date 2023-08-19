package com.tlv8.opm.role;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.system.pojo.SaMenuTree;
import com.tlv8.system.pojo.SaOpPermission;
import com.tlv8.system.service.ISaMenuTreeService;
import com.tlv8.system.service.SaOpPermissionService;

@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	ISaMenuTreeService saMenuTreeService;
	@Autowired
	SaOpPermissionService saOpPermissionService;

	/**
	 * 加载指定角色的菜单权限
	 * 
	 * @param roleid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loadRolePermission")
	public Object loadRolePermission(String roleid) {
		Map<String, Object> m = new HashMap<>();
		try {
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			List<SaOpPermission> dlist = saOpPermissionService.selectByRoleID(roleid);
			for (SaOpPermission p : dlist) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("SPROCESS", p.getSprocess());
				map.put("SACTIVITY", p.getSactivity());
				list.add(map);
			}
			m.put("flag", true);
			m.put("data", list);
		} catch (Exception e) {
			m.put("flag", false);
			e.printStackTrace();
		}
		return m;
	}

	/**
	 * 保存菜单权限
	 * 
	 * @param roleid
	 * @param perm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveRolePermission")
	public Object saveRolePermission(String roleid, String perm) {
		Map<String, Object> m = new HashMap<>();
		try {
			perm = URLDecoder.decode(perm, "UTF-8");
		} catch (Exception e) {
		}
		JSONObject json = JSON.parseObject(perm);
		try {
			for (String k : json.keySet()) {
				SaMenuTree smenu = saMenuTreeService.selectByPrimaryKey(k);
				if (smenu != null) {
					if ("add".endsWith(json.getString(k))) {
						SaOpPermission np = new SaOpPermission();
						np.setSid(IDUtils.getGUID());
						np.setSpermissionroleid(roleid);
						np.setSmenuid(smenu.getSid());
						np.setSprocess(smenu.getProcess());
						np.setSactivity(smenu.getActivity());
						np.setSactivityfname(smenu.getLabel());
						saOpPermissionService.insertData(np);
					} else {
						SaOpPermission pmenu = saOpPermissionService.selectByRoleMenu(roleid, smenu.getSid());
						if (pmenu != null) {
							saOpPermissionService.deleteData(pmenu);
						}
					}
				}
			}
			m.put("flag", true);
		} catch (Exception e) {
			e.printStackTrace();
			m.put("flag", false);
		}
		return m;
	}

}
