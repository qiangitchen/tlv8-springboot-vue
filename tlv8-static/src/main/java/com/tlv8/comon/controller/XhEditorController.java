package com.tlv8.comon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson2.JSONException;
import com.alibaba.fastjson2.JSONObject;

import com.tlv8.common.utils.doc.DocSvrUtils;
import com.tlv8.doc.clt.components.DocClient;
import com.tlv8.doc.clt.obj.DocUploadRes;

@RestController
@RequestMapping("/xheditor")
public class XhEditorController {
	@Autowired
	DocClient docClient;

	@RequestMapping("/xhUploadImage")
	public Object xhUploadImage(@RequestParam(value = "filedata", required = false) MultipartFile filedata,
			HttpServletRequest request, HttpServletResponse response) {
		String docPath = "/root/Xheditor/image";
		JSONObject json = new JSONObject();
		try {
			DocUploadRes docres = docClient.uploadFile(filedata, docPath);
			// 如果前面加个!则表示上传后立即显示图片 不用单击确定按钮
			json.put("msg", "!" + DocSvrUtils.getViewUrl(docres.getFileID()));
			json.put("success", true);
			json.put("info", "上传成功！");
			json.put("err", "");
		} catch (Exception e) {
			json.put("msg", "上传失败！");
			json.put("success", false);
			json.put("info", "上传失败！");
			json.put("err", "上传失败！");
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		return json;
	}

	@RequestMapping("/xhUploadFile")
	public Object xhUploadFile(@RequestParam(value = "filedata", required = false) MultipartFile filedata,
			HttpServletRequest request, HttpServletResponse response) {
		String docPath = "/root/Xheditor/file";
		JSONObject json = new JSONObject();
		try {
			DocUploadRes docres = docClient.uploadFile(filedata, docPath);
			json.put("msg", DocSvrUtils.getViewUrl(docres.getFileID()));
			json.put("success", true);
			json.put("info", "上传成功！");
			json.put("err", "");
		} catch (Exception e) {
			json.put("msg", "上传失败！");
			json.put("success", false);
			json.put("info", "上传失败！");
			json.put("err", "上传失败！");
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		return json;
	}

	@RequestMapping("/xhUploadFlash")
	public Object xhUploadFlash(@RequestParam(value = "filedata", required = false) MultipartFile filedata,
			HttpServletRequest request, HttpServletResponse response) {
		String docPath = "/root/Xheditor/flash";
		JSONObject json = new JSONObject();
		try {
			DocUploadRes docres = docClient.uploadFile(filedata, docPath);
			json.put("msg", DocSvrUtils.getViewUrl(docres.getFileID()));
			json.put("success", true);
			json.put("info", "上传成功！");
			json.put("err", "");
		} catch (Exception e) {
			json.put("msg", "上传失败！");
			json.put("success", false);
			json.put("info", "上传失败！");
			json.put("err", "上传失败！");
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		return json;
	}

	@RequestMapping("/xhUploadMedia")
	public Object xhUploadMedia(@RequestParam(value = "filedata", required = false) MultipartFile filedata,
			HttpServletRequest request, HttpServletResponse response) {
		String docPath = "/root/Xheditor/media";
		JSONObject json = new JSONObject();
		try {
			DocUploadRes docres = docClient.uploadFile(filedata, docPath);
			json.put("msg", DocSvrUtils.getViewUrl(docres.getFileID()));
			json.put("success", true);
			json.put("info", "上传成功！");
			json.put("err", "");
		} catch (Exception e) {
			try {
				json.put("msg", "上传失败！");
				json.put("success", false);
				json.put("info", "上传失败！");
				json.put("err", "上传失败！");
			} catch (JSONException e1) {
			}
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		return json;
	}
}
