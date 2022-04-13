package com.tlv8.monitor.controller;

import java.text.DecimalFormat;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.common.base.Data;

import oshi.SystemInfo;
import oshi.software.os.FileSystem;
import oshi.software.os.OSFileStore;
import oshi.software.os.OperatingSystem;
import oshi.util.FormatUtil;

@Controller
@RequestMapping("/monitor")
public class FileSystemUsageController {

	/**
	 * 获取服务器硬盘信息[json]
	 */

	private Data data = new Data();

	public void setData(Data data) {
		this.data = data;
	}

	public Data getData() {
		return data;
	}

	@ResponseBody
	@RequestMapping("/FileSystemUsage")
	public Object execute() throws Exception {
		SystemInfo si = new SystemInfo();
		OperatingSystem os = si.getOperatingSystem();
		FileSystem fileSystem = os.getFileSystem();
		List<OSFileStore> fsArray = fileSystem.getFileStores();
		JSONArray jsona = new JSONArray();
		for (OSFileStore fs : fsArray) {
			if (fs.getDescription().contains("CD")) {
				continue;
			}
			long usable = fs.getUsableSpace();
			long total = fs.getTotalSpace();
			long used = total - usable;
			JSONObject json = new JSONObject(fs);
			json.put("dirName", fs.getName());
			json.put("Total", FormatUtil.formatBytes(total));
			json.put("Free", FormatUtil.formatBytes(fs.getFreeSpace()));
			json.put("Avail", FormatUtil.formatBytes(usable));
			json.put("Used", FormatUtil.formatBytes(used));
			double usePercent = 100d * used / total;
			DecimalFormat df = new DecimalFormat("#.##%");
			json.put("UsePercent", df.format(usePercent));
			jsona.put(json);
		}
		data.setData(jsona.toString());
		data.setFlag("true");
		return data;
	}

	public static void main(String[] args) {
		try {
			FileSystemUsageController test = new FileSystemUsageController();
			test.execute();
			System.out.println(test.data.getData());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
