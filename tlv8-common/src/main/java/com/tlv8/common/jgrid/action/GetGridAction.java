package com.tlv8.common.jgrid.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.base.Data;
import com.tlv8.common.jgrid.BasegetGridAction;

/**
 * 公用查询（grid） 支持Oracle、 SQL Server、 MySQL
 * 
 * @author ChenQian
 */
@Controller
@Scope("prototype")
public class GetGridAction extends BasegetGridAction {
	private static final Logger logger = LoggerFactory.getLogger(GetGridAction.class);

	public Data getData() {
		return this.data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	@ResponseBody
	@PostMapping(value = "/getGridAction", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		data = new Data();
		String r = "true";
		String m = "success";
		String f = "";
		try {
			int page = (getPage() == 1) ? 0 : getPage();
			int row = getRows();
			r = createGrid(row, page);
			f = "true";
		} catch (Exception e) {
			m = "操作失败：" + e.getMessage();
			f = "false";
			logger.error("操作失败", e);
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
