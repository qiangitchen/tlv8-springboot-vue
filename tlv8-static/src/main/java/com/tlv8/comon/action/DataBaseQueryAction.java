package com.tlv8.comon.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.db.DBUtils;

/**
 * 通用数据查询方法
 */
@RestController
@Scope("prototype")
public class DataBaseQueryAction extends ActionSupport {
	private static final Logger logger = LoggerFactory.getLogger(DataBaseQueryAction.class);
	private String dbkey;
	private String coname;
	private String tbname;
	private String whe;

	@RequestMapping(value = "/dataBaseQueryAction", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public Object execute() throws Exception {
		List<Map<String, String>> data = new ArrayList<>();
		try {
			SQL sql = new SQL();
			sql.SELECT(coname);
			sql.FROM(tbname + " " + whe);
//			sql.WHERE(whe);
			data = DBUtils.selectStringList(dbkey, sql.toString(), true);
		} catch (Exception e) {
			logger.error(e.toString());
			e.printStackTrace();
		}
		return success(data);
	}

	public String getConame() {
		return coname;
	}

	public void setConame(String coname) {
		this.coname = coname;
	}

	public String getTbname() {
		return tbname;
	}

	public void setTbname(String tbname) {
		this.tbname = tbname;
	}

	public String getWhe() {
		return whe;
	}

	public void setWhe(String whe) {
		this.whe = whe;
	}

	public String getDbkey() {
		return dbkey;
	}

	public void setDbkey(String dbkey) {
		this.dbkey = dbkey;
	}

}
