package com.tlv8.oa.news;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.base.Data;
import com.tlv8.common.jgrid.BasegetGridAction;
import com.tlv8.system.utils.ContextUtils;

@Controller
@Scope("prototype")
public class GetShowNewsGridAction extends BasegetGridAction {
	public Data getData() {
		return this.data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	@ResponseBody
	@PostMapping(value = "/getShowNewsGridAction", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		data = new Data();
		String r = "true";
		String m = "success";
		String f = "";
		try {
			String userid = ContextUtils.getContext().getCurrentPersonID();
			int page = (getPage() == 1) ? 0 : getPage();
			int row = getRows();
			SQL sql = new SQL();
			sql.SELECT("n.fid,fnewstitle,freleasedepartment,fpeople,ftime,n.version");
			sql.SELECT("(select count(*) fcount from oa_news_count c where c.news_releaseid=n.fid)fcount");
			sql.FROM("oa_news_release n");
			sql.LEFT_OUTER_JOIN("oa_news_open o on o.fnewsid = n.fid");
			sql.WHERE("n.FSTATE='已发布'");
			sql.WHERE("(n.ftype = '集体发布' or (n.ftype = '限制发布' and o.fopenid = '"+userid+"') )");
			insql = sql.toString();
			r = createGridBySQL(page, row);
			f = "true";
		} catch (Exception e) {
			m = "操作失败：" + e.getMessage();
			f = "false";
			e.printStackTrace();
		}
		data.setData(r);
		data.setFlag(f);
		data.setMessage(m);
		data.setPage(page);
		data.setAllpage(allpage);
		data.setGridid(gridid);
		return success(data);
	}
}
