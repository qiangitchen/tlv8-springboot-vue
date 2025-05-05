package com.tlv8.fun;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;

import com.tlv8.common.utils.MD5Util;

@Controller
@RequestMapping("/system/fun")
public class FunController {
	private static String PROJECT_WEB_FOLDER;

	@RequestMapping("/loaadPages")
	@ResponseBody
	public Object loaadPages(HttpServletRequest request) {
		PROJECT_WEB_FOLDER = request.getServletContext().getRealPath("");
		return loadFolder(PROJECT_WEB_FOLDER);
	}

	private JSONArray loadFolder(String dirPath) {
		JSONArray jsona = new JSONArray();
		if (!dirPath.endsWith(".svn") && !dirPath.endsWith("WEB-INF") && !dirPath.endsWith("META-INF")) {
			File file = new File(dirPath);
			File[] subFiles = file.listFiles();
			for (File subFile : subFiles) {
				if (subFile.isFile()) {
					String filename = subFile.getName().toLowerCase();
					if (isIgnorePage(filename)) {
						continue;
					}
					if (filename.contains(".jsp") || filename.contains(".htm")) {
						String f = subFile.getAbsolutePath();
						f = rebuildFilePath(f);
						f = f.substring(PROJECT_WEB_FOLDER.length() - 1);
						JSONObject json = new JSONObject();
						json.put("id", MD5Util.encode(subFile.getAbsolutePath()));
						json.put("text", subFile.getName());
						json.put("path", f);
						jsona.add(json);
					}
				} else {
					String f = subFile.getAbsolutePath();
					f = rebuildFilePath(f);
					if (!f.endsWith(".svn") && !f.endsWith("WEB-INF") && !f.endsWith("META-INF")
							&& isPageFolder(subFile)) {
						JSONObject json = new JSONObject();
						json.put("id", MD5Util.encode(subFile.getAbsolutePath()));
						json.put("text", subFile.getName());
						json.put("children", loadFolder(subFile.getAbsolutePath()));
						jsona.add(json);
					}
				}

			}
		}
		return jsona;
	}

	public String rebuildFilePath(String paramString) {
		return paramString.replace("\\", "/");
	}

	private boolean isPageFolder(File fl) {
		boolean rt = false;
		File[] subFiles = fl.listFiles();
		for (File subFile : subFiles) {
			if (subFile.isFile()) {
				if (subFile.getName().toLowerCase().contains(".jsp")
						|| subFile.getName().toLowerCase().contains(".htm"))
					return true;
			} else {
				rt = isPageFolder(subFile);
			}
		}
		return rt;
	}

	private boolean isIgnorePage(String filename) {
		if (filename.equals("404.jsp") || filename.equals("error.jsp") || filename.equals("alertlogin.jsp")
				|| filename.equals("sessionauthor.jsp") || filename.equals("sessionerr.jsp")) {
			return true;
		}
		return false;
	}
}
