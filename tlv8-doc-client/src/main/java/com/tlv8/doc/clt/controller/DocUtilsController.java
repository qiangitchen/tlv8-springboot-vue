package com.tlv8.doc.clt.controller;

import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.common.utils.StringUtils;
import com.tlv8.doc.clt.pojo.SaDocnamespace;
import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnamespaceService;
import com.tlv8.doc.clt.service.SaDocnodeService;

@Controller
public class DocUtilsController {
	@Autowired
	private SaDocnamespaceService saDocnamespaceService;
	@Autowired
	private SaDocnodeService saDocnodeService;

	@ResponseBody
	@RequestMapping("/queryHostAction")
	public Object queryHostAction(String urlPattern) {
		Map<String, Object> res = new HashMap<>();
		List<SaDocnamespace> nms = saDocnamespaceService.selectAll();
		if (nms.size() > 0) {
			String url = nms.get(0).getSurl();
			if (StringUtils.isNotEmpty(urlPattern)) {
				try {
					urlPattern = URLDecoder.decode(urlPattern, "utf-8");
				} catch (Exception e) {
				}
				url += urlPattern;
			}
			if (url.indexOf("?") > 0) {
				url += "&";
			} else {
				url += "?";
			}
			url += "key=" + IDUtils.getGUID();
			res.put("data", url);
			res.put("flag", true);
		} else {
			res.put("flag", false);
			res.put("message", "没有找到文档服务配置");
		}
		return res;
	}

	@ResponseBody
	@RequestMapping("/getDocIdByFileId")
	public Object getDocIdByFileId(String fileID) {
		Map<String, Object> res = new HashMap<>();
		SaDocnode docnode = saDocnodeService.selectByFileID(fileID);
		if (docnode != null) {
			res.put("data", docnode);
			res.put("flag", true);
		} else {
			res.put("flag", false);
			res.put("message", "查询失败");
		}
		return res;
	}

	/**
	 * 加载附件信息
	 * 
	 * @param dbkey
	 * @param tablename
	 * @param cellname
	 * @param keyfield
	 * @param rowid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loadAttachmentInformation")
	public Object loadAttachmentInformation(String dbkey, String tablename, String cellname, String keyfield,
			String rowid) {
		Map<String, Object> res = new HashMap<>();
		SQL sql = new SQL();
		sql.SELECT(cellname);
		sql.FROM(tablename);
		sql.WHERE(keyfield + "=?");
		SqlSession session = DBUtils.getSqlSession();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = session.getConnection();
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, rowid);
			rs = ps.executeQuery();
			if (rs.next()) {
				res.put("data", rs.getString(cellname));
				res.put("flag", true);
				res.put("message", "查询成功");
			} else {
				res.put("flag", false);
				res.put("data", "[]");
				res.put("message", "查询失败");
			}
		} catch (Exception e) {
			res.put("flag", false);
			res.put("data", "[]");
			res.put("message", "查询异常：" + e.getMessage());
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(session, conn, ps, rs);
		}
		return res;
	}
}
