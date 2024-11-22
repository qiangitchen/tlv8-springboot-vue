package com.tlv8.opm;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * 分配人员
 * 
 * @author 陈乾
 */
@Controller
@Scope("prototype")
public class AppendPersonMembers extends ActionSupport {
	Logger logger = LoggerFactory.getLogger(getClass());
	private String personIds;
	private String orgId;

	@Autowired
	ISaOpOrgService saOpOrgService;
	@Autowired
	ISaOpPersonService saOpPersonService;

	@ResponseBody
	@RequestMapping(value = "/appendPersonMembers", produces = "application/json;charset=UTF-8")
	public Object execute() throws Exception {
		Data data = new Data();
		try {
			SaOpOrg org = saOpOrgService.selectByPrimaryKey(orgId);
			if (org != null) {
				String fid = org.getSid();
				String fcode = org.getScode();
				String fname = org.getSname();
				int level = org.getSlevel() + 1;
				String[] persons = personIds.split(",");
				for (int i = 0; i < persons.length; i++) {
					SaOpOrg personOrg = saOpOrgService.selectByPrimaryKey(persons[i]);
					if (personOrg != null) {
						int state = personOrg.getSvalidstate();
						String personid = personOrg.getSpersonid();
						String scode = personOrg.getScode();
						String sname = personOrg.getSname();
						String newpsmid = personid + "@" + orgId;
						int sequence = personOrg.getSsequence();
						SaOpPerson hp = saOpPersonService.selectByPrimaryKey(newpsmid);
						if (hp != null) {
							data.setFlag("false");
							data.setMessage("[" + sname + "]已经在当前部门，不需要分配!");
						} else {
							SaOpOrg addOrg = new SaOpOrg();
							addOrg.setSid(newpsmid);
							addOrg.setScode(scode);
							addOrg.setSname(sname);
							addOrg.setSparent(orgId);
							addOrg.setSfid(fid + "/" + newpsmid);
							addOrg.setSfcode(fcode + "/" + scode);
							addOrg.setSfname(fname + "/" + sname);
							addOrg.setSorgkindid("psm");
							addOrg.setSvalidstate(state);
							addOrg.setSpersonid(personid);
							addOrg.setSnodekind("nkLimb");
							addOrg.setSlevel(level);
							addOrg.setSsequence(sequence);
							addOrg.setVersion(0);
							saOpOrgService.insertData(addOrg);
						}
					}
				}
			}
			data.setFlag("true");
		} catch (Exception e) {
			data.setFlag("false");
			logger.error("分配人员异常", e);
		}
		return success(data);
	}

	public void setPersonIds(String personIds) {
		try {
			this.personIds = URLDecoder.decode(personIds, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getPersonIds() {
		return personIds;
	}

	public void setOrgId(String orgId) {
		try {
			this.orgId = URLDecoder.decode(orgId, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getOrgId() {
		return orgId;
	}

}
