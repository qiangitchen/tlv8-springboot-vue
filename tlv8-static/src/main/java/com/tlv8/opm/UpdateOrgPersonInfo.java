package com.tlv8.opm;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.system.pojo.SaOpOrg;
import com.tlv8.system.pojo.SaOpPerson;
import com.tlv8.system.service.ISaOpOrgService;
import com.tlv8.system.service.ISaOpPersonService;

/**
 * 更新组织机构及人员信息
 * 
 * @author 陈乾
 * @update 2024-11-23
 */
@Controller
@Scope("prototype")
public class UpdateOrgPersonInfo extends ActionSupport {
	private String personid;
	private String orgid;

	@Autowired
	ISaOpOrgService saOpOrgService;
	@Autowired
	ISaOpPersonService saOpPersonService;

	@ResponseBody
	@PostMapping(value = "/updateOrgPersonInfo", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		try {
			SaOpPerson saperson = saOpPersonService.selectByPrimaryKey(personid);
			if (saperson != null) {
				SaOpOrg psaorg = saOpOrgService.selectByPrimaryKey(orgid);
				if (psaorg != null) {
					SaOpOrg saorg = saOpOrgService.selectByParentIdPersonId(orgid, personid);
					String newid = personid + "@" + orgid;
					boolean isnew = false;
					if (saorg == null) {
						saorg = new SaOpOrg();
						saorg.setSid(newid);
						saorg.setVersion(0);
						isnew = true;
					}
					saorg.setSparent(orgid);
					saorg.setScode(saperson.getScode());
					saorg.setSname(saperson.getSname());
					saorg.setSphone(saperson.getSmobilephone());
					saorg.setSaddress(saperson.getSfamilyaddress());
					saorg.setSzip(saperson.getSzip());
					saorg.setSfid(psaorg.getSfid() + "/" + newid + ".psm");
					saorg.setSfcode(psaorg.getSfcode() + "/" + saperson.getScode());
					saorg.setSfname(psaorg.getSfname() + "/" + saperson.getSname());
					saorg.setSorgkindid("psm");
					saorg.setSpersonid(personid);
					saorg.setSvalidstate(1);
					saorg.setSlevel(psaorg.getSlevel() + 1);
					if (isnew) {
						saOpOrgService.insertData(saorg);
					} else {
						saOpOrgService.updateData(saorg);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this;
	}

	public void setPersonid(String personid) {
		try {
			this.personid = URLDecoder.decode(personid, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getPersonid() {
		return personid;
	}

	public void setOrgid(String orgid) {
		try {
			this.orgid = URLDecoder.decode(orgid, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getOrgid() {
		return orgid;
	}

}
