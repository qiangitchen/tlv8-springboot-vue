package com.tlv8.opm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.system.pojo.SaOpPerson;
import com.tlv8.system.service.ISaOpPersonService;

@Controller
@Scope("prototype")
public class CheckPersonCode extends ActionSupport {
	private int count;
	private String value;
	private String id;

	@Autowired
	ISaOpPersonService saOpPersonService;

	@ResponseBody
	@RequestMapping("/checkPersonCode")
	public Object execute() throws Exception {
		count = 0;
		List<SaOpPerson> list = saOpPersonService.selectByCodeIgnoreCase(value);
		for (SaOpPerson person : list) {
			if (!person.getSid().equals(id)) {
				count++;
			}
		}
		return this;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
