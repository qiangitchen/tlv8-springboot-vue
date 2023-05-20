package com.tlv8.opm.role;

import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.system.pojo.SaMenuTree;
import com.tlv8.system.service.ISaMenuTreeService;

@SuppressWarnings("deprecation")
@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
	ISaMenuTreeService saMenuTreeService;

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
		SQL sql = new SQL();
		sql.SELECT_DISTINCT("SPROCESS,SACTIVITY");
		sql.FROM("sa_oppermission").WHERE("SPERMISSIONROLEID=?");
		SqlSession session = DBUtils.getSession("system");
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = session.getConnection();
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, roleid);
			rs = ps.executeQuery();
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("SPROCESS", rs.getString("SPROCESS"));
				map.put("SACTIVITY", rs.getString("SACTIVITY"));
				list.add(map);
			}
			m.put("flag", true);
			m.put("data", list);
		} catch (Exception e) {
			m.put("flag", false);
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(session, conn, ps, rs);
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
		SqlSession session = DBUtils.getSession("system");
		Connection conn = null;
		try {
			conn = session.getConnection();
			for (String k : json.keySet()) {
				SaMenuTree smenu = saMenuTreeService.selectByPrimaryKey(k);
				if (smenu != null) {
					if ("add".endsWith(json.getString(k))) {
						SQL asql = new SQL().INSERT_INTO("sa_oppermission");
						asql.INTO_COLUMNS("SID,SPERMISSIONROLEID,SPROCESS,SACTIVITY,SACTIVITYFNAME");
						asql.INTO_VALUES("?,?,?,?,?");
						PreparedStatement ps1 = conn.prepareStatement(asql.toString());
						ps1.setString(1, IDUtils.getGUID());
						ps1.setString(2, roleid);
						ps1.setString(3, smenu.getProcess());
						ps1.setString(4, smenu.getActivity());
						ps1.setString(5, smenu.getLabel());
						ps1.executeUpdate();
					} else {
						SQL asql = new SQL().DELETE_FROM("sa_oppermission");
						asql.WHERE("SPERMISSIONROLEID=? and SPROCESS=? and SACTIVITY=?");
						PreparedStatement ps2 = conn.prepareStatement(asql.toString());
						ps2.setString(1, roleid);
						ps2.setString(2, smenu.getProcess());
						ps2.setString(3, smenu.getActivity());
						ps2.executeUpdate();
					}
				}
			}
			session.commit(true);
			m.put("flag", true);
		} catch (Exception e) {
			session.rollback(true);
			e.printStackTrace();
			m.put("flag", false);
		} finally {
			DBUtils.closeConn(session, conn, null, null);
		}
		return m;
	}

}
