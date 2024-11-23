package com.tlv8.opm;

import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.common.base.Data;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.pojo.SaOpPerson;
import com.tlv8.system.service.ISaOpOrgService;
import com.tlv8.system.service.ISaOpPersonService;

/**
 * 还原已删除的数据
 * 
 * @author 陈乾
 */
@Controller
@Scope("prototype")
public class ResetOrgDataAction extends ActionSupport {
	private String rowid;

	@Autowired
	ISaOpOrgService saOpOrgService;
	@Autowired
	ISaOpPersonService saOpPersonService;

	@ResponseBody
	@RequestMapping(value = "/resetOrgDataAction", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		Data data = new Data();
		try {
			String[] rowids = rowid.split(",");
			for (int i = 0; i < rowids.length; i++) {
				String id = rowids[i];
				SaOpOrg saorg = saOpOrgService.selectByPrimaryKey(id);
				if (saorg != null) {
					saorg.setSvalidstate(1);
					saOpOrgService.updateData(saorg);
					SaOpPerson saperson = saOpPersonService.selectByPrimaryKey(saorg.getSpersonid());
					if (saperson != null) {
						saperson.setSvalidstate(1);
						saOpPersonService.updateData(saperson);
					}
				}
			}
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			data.setMessage(e.getMessage());
			e.printStackTrace();
		}
		return success(data);
	}

	public void setRowid(String rowid) {
		try {
			this.rowid = URLDecoder.decode(rowid, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getRowid() {
		return rowid;
	}

}
