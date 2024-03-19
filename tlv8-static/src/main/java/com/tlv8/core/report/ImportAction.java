package com.tlv8.core.report;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tlv8.common.action.RequestParams;
import com.tlv8.common.base.Sys;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.IDUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.echat.EChatExecuteFilter;
import com.tlv8.system.utils.ContextUtils;

import jxl.Workbook;

@Controller
@RequestMapping("/core")
public class ImportAction {
	private static final Logger logger = LoggerFactory.getLogger(ImportAction.class);

	@ResponseBody
	@RequestMapping(value = "/importAction", method = RequestMethod.POST)
	public Object upload(HttpServletRequest request, @RequestParam("upload") MultipartFile file,
			@RequestHeader("User-Agent") String userAgent) throws Exception {
		Map<String, Object> res = new HashMap<>();
		RequestParams params = new RequestParams(request);
		if (file == null) {
			res.put("message", "导入失败：未选择文件或文件类型不正确！");
			res.put("state", false);
			logger.error(res.get("message").toString());
			return res;
		} else if (file.getOriginalFilename().toLowerCase().indexOf("xls") < 0
				&& !"".equals(file.getOriginalFilename())) {
			res.put("message", "导入失败：文件类型不正确！正确的导入文件为Excel");
			res.put("state", false);
			logger.error(res.get("message").toString());
			return res;
		}
		String confirmXmlName = params.getParamValue("confirmXmlName");
		String srcPath = params.getParamValue("srcPath");
		Element config = null;
		confirmXmlName = (confirmXmlName == null || "".equals(confirmXmlName)) ? "impConfirm.xml" : confirmXmlName;
		if (srcPath == null || "undefined".equals(srcPath)) {
			srcPath = "";
		} else {
			String filePath = "static" + srcPath.replace(request.getContextPath(), "");
			try {
				InputStream ins = EChatExecuteFilter.class.getClassLoader().getResourceAsStream(filePath);
				config = MappingConfig.getConfig(ins);
			} catch (Exception e) {
				logger.info("读取导入配置文件失败:" + e.toString());
			}
		}
		try {
			Map<String, Integer> imrs = impInit(file.getInputStream(), params.getParamValue("dbkey"),
					params.getParamValue("table"), params.getParamValue("relation"), params.getParamValue("useNormal"),
					config);
			res.putAll(imrs);
			res.put("state", true);
		} catch (Exception e) {
			res.put("state", false);
			res.put("message", "导入失败：" + e.toString());
			logger.error(e.toString());
			e.printStackTrace();
		}
		return res;
	}

	private Map<String, Integer> impInit(InputStream inputStream, String dbkey, String table, String relation,
			String useNormal, Element config) throws Exception {
		Map<String, Integer> res = new HashMap<>();
		Workbook wb1 = null;
		String[][] page0 = null;
		try {
			try {
				wb1 = XlsUtils.getWorkbook(inputStream);
				page0 = XlsUtils.readSheet(wb1, 0);
				res = WriteData(page0, dbkey, table, relation, useNormal, config);
			} catch (Exception e) {
				logger.error(e.toString());
				throw new Exception(Sys.packErrMsg(String.format("导入数据时出错, 详细: %s", e.toString())));
			}
		} finally {
			wb1.close();
			inputStream.close();
		}
		return res;
	}

	// 写数据操作
	@SuppressWarnings("deprecation")
	private Map<String, Integer> WriteData(String[][] condata, String dbkey, String table, String relation,
			String useNormal, Element config) throws Exception {
		Map<String, Integer> res = new HashMap<>();
		String sql = "";
		int fversion = 0;
		if ("TMJ_INVENTORY_INFO".equals(table.toUpperCase())) {
			sql = "select FVERSION from TMJ_VERSION_INFO where FSTATE =2";
			Connection con = null;
			ResultSet rs = null;
			con = DBUtils.getAppConn(dbkey);
			rs = DBUtils.execQuery(con, sql);
			if (rs.next()) {
				fversion = rs.getInt(1);
			} else {
				throw new Exception("当前未开放导入,请与管理员联系!");
			}
			DBUtils.closeConn(con, null, rs);
		}
		String AllimpCells = getCells(dbkey, relation, useNormal, config);
		if (dbkey == null || "".equals(dbkey))
			dbkey = "system";
		int startLine = 0;
		int endLine = 0;
		if ("true".equals(useNormal)) {
			startLine = MappingConfig.getAttributeInt(config, "row", "start") - 1;
			endLine = MappingConfig.getAttributeInt(config, "row", "end");
		} else {
			startLine = (startLine == 1) ? 1 : startLine - 1;
			endLine = (endLine == -1) ? condata.length : endLine - 1;
		}
		if (startLine == -9999 || endLine == -9999) {
			throw new Exception("导入数据时出错,数据行配置错误!");
		}
		int okcout = (endLine == -1) ? condata.length - startLine + 1 : endLine - startLine - 1;
		res.put("totalCount", okcout);
		table = (table != null && !"".equals(table)) ? table
				: MappingConfig.getAttributeValue(config, "concept", "name");
		if (table == null || "".equals(table)) {
			throw new Exception("导入数据时出错,需要导入表名未配置或配置错误!");
		}
		endLine = (endLine == -1) ? condata.length : endLine - 1;
		for (int i = startLine; i < endLine; i++) {
			String fID = IDUtils.getGUID();
			String rowKey = (dbkey == "system") ? "sID" : "fID";
			ContextBean user = ContextUtils.getContext();
			String PersonName = user.getCurrentPersonName() == null ? "" : user.getCurrentPersonName();
			String CREATORDEPTID = user.getCurrentDeptID() == null ? "" : user.getCurrentDeptID();
			String CREATORDEPTNAME = user.getCurrentDeptName() == null ? "" : user.getCurrentDeptName();
			if (!"system".equals(dbkey) && dbkey != null) {
				sql = "insert into " + table + "(" + rowKey + "," + AllimpCells
						+ ",FINPORTSTORESID,FINPORTSTORES,FOPERATORID,FOPERATOR,fVERSION,version)values('" + fID
						+ "',AllInsertVlue,'" + CREATORDEPTID + "','" + CREATORDEPTNAME + "','"
						+ user.getCurrentPersonID() + "','" + PersonName + "'," + fversion + ",0)";
			} else {
				sql = "insert into " + table + "(" + rowKey + "," + AllimpCells + ",version)values('" + fID
						+ "',AllInsertVlue,0)";
			}
			String[] cells = AllimpCells.split(",");
			String AllInsertVlue = "";
			for (int n = 0; n < cells.length; n++) {
				DateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd");
				DateFormat dataTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String ThisValue = "";
				try {
					ThisValue = condata[i][n];
					if (ThisValue.indexOf(".00") > 0) {
						ThisValue = ThisValue.replaceAll(",", "");
						ThisValue = ThisValue.replaceAll(".00", "");
					}
				} catch (Exception e) {
				}
				if (ThisValue != null && !"".equals(ThisValue)) {
					try {
						dataTimeFormat.parse(XlsUtils.trimSpace(ThisValue));
						if (DBUtils.IsOracleDB(dbkey)) {
							AllInsertVlue += ",to_date('"
									+ dataTimeFormat.format(dataTimeFormat.parse(XlsUtils.trimSpace(ThisValue)))
									+ "','yyyy-MM-dd hh24:mi:ss')";
						} else {
							AllInsertVlue += ",cast('"
									+ dataTimeFormat.format(dataTimeFormat.parse(XlsUtils.trimSpace(ThisValue)))
									+ "'as datetime)";
						}
					} catch (Exception e) {
						try {
							dataFormat.parse(XlsUtils.trimSpace(ThisValue));
							if (DBUtils.IsOracleDB(dbkey)) {
								AllInsertVlue += ",to_date('"
										+ dataFormat.format(dataFormat.parse(XlsUtils.trimSpace(ThisValue)))
										+ "','yyyy-MM-dd')";
							} else {
								AllInsertVlue += ",cast('"
										+ dataFormat.format(dataFormat.parse(XlsUtils.trimSpace(ThisValue)))
										+ "' as datetime)";
							}
						} catch (Exception ex) {
							AllInsertVlue += ",'" + XlsUtils.trimSpace(ThisValue) + "'";
						}
					}
				} else {
					AllInsertVlue += ",''";
				}
			}
			AllInsertVlue = AllInsertVlue.replaceFirst(",", "");
			sql = sql.replace("AllInsertVlue", AllInsertVlue);
			try {
				// System.out.println(sql);
				subMitData(dbkey, sql);
			} catch (Exception e) {
				okcout--;
			}
		}
		System.out.println(okcout);
		res.put("fokCount", okcout);
		return res;
	}

	// 获取导入字段
	private String getCells(String dbkey, String relation, String useNormal, Element config) throws Exception {
		if ("system".equals(dbkey)) {
			relation = (relation != null && !"".equals(relation)
					&& (!"true".equals(useNormal)
							|| MappingConfig.getAttributeValue(config, "relation", "name") == null)) ? relation
									: MappingConfig.getAttributeValue(config, "relation", "name");
		} else {
			relation = MappingConfig.getAttributeValue(config, "relation", "name");
		}
		if ("".equals(relation) || relation == null) {
			throw new Exception("导入数据时出错,列名未配置或配置错误!");
		}
		String result = "";
		String[] cell = relation.split(",");
		for (int i = 0; i < cell.length; i++) {
			if (!"No".equals(cell[i]) && !"master_check".equals(cell[i])) {
				result += "," + cell[i];
			}
		}
		result = result.replaceFirst(",", "");
		return result;
	}

	// 提交数据
	@SuppressWarnings("deprecation")
	private void subMitData(String dbkey, String sql) throws SQLException, NamingException {
		Connection conn = null;
		Statement stm = null;
		try {
			conn = DBUtils.getAppConn(dbkey);
			stm = conn.createStatement();
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			throw new SQLException(e);
		} finally {
			try {
				DBUtils.closeConn(conn, stm, null);
			} catch (SQLException e) {
				throw new SQLException(e);
			}
		}
	}

}
