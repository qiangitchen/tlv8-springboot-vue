package com.tlv8.oa.mail;

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
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;

@Controller
@Scope("prototype")
public class GetReceiveMailCountAction extends ActionSupport {
	private Data data = new Data();
	private String count;

	public void setData(Data data) {
		this.data = data;
	}

	public Data getData() {
		return data;
	}

	@ResponseBody
	@RequestMapping("/getReceiveMailCountAction")
	@SuppressWarnings({ "rawtypes" })
	public Object execute() throws Exception {
		try {
			ContextBean context = ContextUtils.getContext();
			String personid = context.getPersonID();
			SQL sql = new SQL();
			sql.SELECT("count(*) COUNT");
			sql.FROM("OA_EM_RECEIVEEMAIL");
			sql.WHERE("FCONSIGNEEID=? and FQUREY = '未查看'");
			sql.ORDER_BY("FQUREY asc, FSENDTIME desc");
			List<Object> param = new ArrayList<>();
			param.add(personid);
			List yl = DBUtils.selectList("oa", sql.toString(), param, true);
			if (yl.size() > 0) {
				Map m = (Map) yl.get(0);
				count = String.valueOf(m.get("COUNT"));
			}
			data.setData(count);
			data.setFlag("true");
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
}
