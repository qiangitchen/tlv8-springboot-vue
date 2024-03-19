package com.tlv8.oa.mail;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.common.db.DBUtils;
import com.tlv8.common.utils.StringUtils;
import com.alibaba.fastjson.JSON;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;

@Controller
@Scope("prototype")
public class GetReceiveMailAction extends ActionSupport {
	private Data data = new Data();
	private String weichakan;
	private String count;
	private String filter;
	private String offerset;
	private String limit;

	public void setData(Data data) {
		this.data = data;
	}

	public Data getData() {
		return data;
	}

	@ResponseBody
	@RequestMapping("/getReceiveMailAction")
	@SuppressWarnings({ "rawtypes", "deprecation" })
	public Object execute() throws Exception {
		ContextBean context = ContextUtils.getContext();
		String personid = context.getPersonID();
		List<Object> param = new ArrayList<>();
		SQL sql = new SQL();
		sql.SELECT("FID as ID");
		sql.SELECT("FQUREY as STATUS");
		sql.SELECT("FEMAILNAME as TITLE");
		sql.SELECT("FSENDPERNAME as NAME");
		sql.SELECT("FSENDTIME as TIME");
		sql.SELECT("e.FREPLYSTATE");
		sql.SELECT("e.fsenddept as ORGNAME");
		sql.FROM("OA_EM_ReceiveEmail e");
		sql.WHERE("e.fConsigneeID=?");
		param.add(personid);
		if (StringUtils.isNotEmpty(filter)) {
			sql.WHERE("(e.FSENDPERNAME like ? or e.FEMAILNAME like ? or e.FTEXT like ?)");
			param.add("%" + filter + "%");
			param.add("%" + filter + "%");
			param.add("%" + filter + "%");
		}
		sql.ORDER_BY("FQUREY asc, FSENDTIME desc");
		try {
			String yd = "";
			SQL scount = new SQL();
			scount.SELECT("count(*) as COUNT");
			scount.FROM("(" + sql.toString() + ")");
			scount.WHERE("STATUS = '未查看'");
			List yl = DBUtils.selectList("oa", scount.toString(), param, true);
			if (yl.size() > 0) {
				Map m = (Map) yl.get(0);
				weichakan = String.valueOf(m.get("COUNT"));
				yd = String.valueOf(m.get("COUNT")) + "未读";
			}
			SQL ccount = new SQL();
			ccount.SELECT("count(*) as COUNT");
			ccount.FROM("(" + sql.toString() + ")");
			List cl = DBUtils.selectList("oa", ccount.toString(), param, true);
			if (cl.size() > 0) {
				Map m = (Map) cl.get(0);
				count = yd + "/共" + String.valueOf(m.get("COUNT"));
			}
			StringBuffer qsql = new StringBuffer();
			qsql.append("select * from");
			if (DBUtils.IsOracleDB("oa") || DBUtils.IsDMDB("oa")) {
				if (limit != null && !"".equals(limit)) {
					qsql.append("(select rownum srownu,r.* from (");
					qsql.append(sql.toString());
					qsql.append(")r where rownum<=" + limit);
					qsql.append(")a where a.srownu >" + offerset);
				} else {
					qsql.append("(" + sql.toString() + ")");
					qsql.append("a where rownum <=10");
				}
			} else if (DBUtils.IsMySQLDB("oa")) {
				if (limit != null && !"".equals(limit)) {
					qsql.append("(" + sql.toString() + ")");
					qsql.append("r limit " + offerset + "," + limit);
				} else {
					qsql.append("(" + sql.toString() + ")");
					qsql.append("a limit 0,10");
				}
			} else {
				qsql.append("(" + sql.toString() + ")");
				qsql.append(" where ID in ");
				qsql.append("(select top " + limit);
				qsql.append(" ID from (" + sql.toString() + ")");
				qsql.append(") and ID not in ");
				qsql.append("(select top " + offerset);
				qsql.append(" ID from (" + sql.toString() + ") )");
				param.add(personid);
				if (StringUtils.isNotEmpty(filter)) {
					param.add("%" + filter + "%");
					param.add("%" + filter + "%");
					param.add("%" + filter + "%");
				}
				param.add(personid);
				if (StringUtils.isNotEmpty(filter)) {
					param.add("%" + filter + "%");
					param.add("%" + filter + "%");
					param.add("%" + filter + "%");
				}
			}
			List<Map<String, String>> list = DBUtils.selectStringList("oa", qsql.toString(), param, true);
			data.setFlag("true");
			data.setData(JSON.toJSONString(list));
		} catch (Exception e) {
			data.setFlag("false");
			e.printStackTrace();
		}
		return success(data);
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getCount() {
		return count;
	}

	public void setFilter(String filter) {
		try {
			this.filter = URLDecoder.decode(filter, "UTF-8");
		} catch (Exception e) {

		}
	}

	public String getFilter() {
		return filter;
	}

	public void setWeichakan(String weichakan) {
		this.weichakan = weichakan;
	}

	public String getWeichakan() {
		return weichakan;
	}

	public void setOfferset(String offerset) {
		this.offerset = offerset;
	}

	public String getOfferset() {
		return offerset;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public String getLimit() {
		return limit;
	}

}
