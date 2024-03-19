package com.tlv8.oa.mail;

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
import com.alibaba.fastjson.JSON;
import com.tlv8.system.utils.ContextUtils;

@Controller
@Scope("prototype")
public class LoadMailPortalInfo extends ActionSupport {

	private Data data = new Data();

	@ResponseBody
	@RequestMapping("/loadMailPortalInfo")
	@Override
	public Object execute() throws Exception {
		SQL sql = new SQL();
		sql.SELECT("FID,FQUREY,FEMAILNAME,FSENDPERNAME,FSENDTIME");
		sql.FROM("OA_EM_RECEIVEEMAIL");
		sql.WHERE("FCONSIGNEEID='" + ContextUtils.getContext().getCurrentPersonID() + "'");
		sql.WHERE("FQUREY='未查看'");
		sql.ORDER_BY("FSENDTIME DESC");
		try {
			List<Map<String, String>> list = DBUtils.execQueryforList("oa", sql.toString(), true);
			data.setData(JSON.toJSONString(list));
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage("加载数据错误!");
			e.printStackTrace();
		}
		return success(data);
	}

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

}
