package com.tlv8.doc.clt.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.action.ActionSupport;
import com.tlv8.doc.clt.pojo.SaDocnode;
import com.tlv8.doc.clt.service.SaDocnodeService;

@Controller
@Scope("prototype")
public class GetDocIdByFileIdAction extends ActionSupport {
	private String fileID;
	@Autowired
	private SaDocnodeService saDocnodeService;

	@ResponseBody
	@RequestMapping("/getDocIdByFileId")
	public Object execute() throws Exception {
		Map<String, Object> res = new HashMap<>();
		SaDocnode docnode = saDocnodeService.selectByFileID(fileID);
		if (docnode != null) {
			res.put("data", docnode);
			res.put("flag", true);
		} else {
			res.put("flag", false);
			res.put("message", "查询失败");
		}
		return success(res);
	}

	public String getFileID() {
		return fileID;
	}

	public void setFileID(String fileID) {
		this.fileID = fileID;
	}

}
