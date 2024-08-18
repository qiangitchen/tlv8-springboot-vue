package com.tlv8.doc.clt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.log.NullLogChute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tlv8.doc.clt.doc.DocDBHelper;
import com.tlv8.doc.clt.doc.DocUtils;
import com.tlv8.system.bean.ContextBean;
import com.tlv8.system.utils.ContextUtils;

/**
 * 文档编辑/查看
 * 
 * @author 陈乾
 *
 */
@Controller
@RequestMapping("/doc_ocx")
public class DocOcxController {
	VelocityEngine ve;

	@Autowired
	DocDBHelper docDBHelper;

	@ModelAttribute
	public void executeBefor() throws Exception {
		ve = new VelocityEngine();
		ve.setProperty(Velocity.RESOURCE_LOADER, "class");
		ve.setProperty("class.resource.loader.class",
				"org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
		ve.setProperty(RuntimeConstants.RUNTIME_LOG_LOGSYSTEM, new NullLogChute());
		ve.init();
	}

	/**
	 * 普通office文件编辑查看
	 * 
	 * @param request
	 * @param response
	 * @param fileID
	 * @param fileName
	 * @param dbkey
	 * @param tablename
	 * @param billid
	 * @param cellname
	 * @param callerName
	 * @param option
	 * @param userAgent
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("/officeediter")
	public void officeEditer(HttpServletRequest request, HttpServletResponse response, String fileID, String fileName,
			String dbkey, String tablename, String billid, String cellname, String callerName, String option,
			@RequestHeader("User-Agent") String userAgent) throws IOException {
		System.out.println(userAgent);
		if (userAgent.contains("Windows")) {
			// Windows将文件转换成pdf查看
			if (userAgent.indexOf("Chrome") > 0 || userAgent.indexOf("Firefox") > 0
					|| userAgent.indexOf("AppleWebKit") > 0) {
				try {
					pspdfview(request, response, fileID, fileName, option);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return;
			}
		} else {
			String nodeName = fileName;
			try {
				nodeName = URLDecoder.decode(nodeName, "UTF-8");
				nodeName = nodeName.toLowerCase();
				if (nodeName.endsWith(".xls") || nodeName.endsWith(".xlsx") || nodeName.endsWith(".et")) {
					etfileediter(request, response, fileID, fileName, option);
					return;
				}
				if (nodeName.endsWith(".ppt") || nodeName.endsWith(".pptx") || nodeName.endsWith(".dps")) {
					dpsfileediter(request, response, fileID, fileName, option);
					return;
				} else {
					fileediter(request, response, fileID, fileName, option);
					return;
				}
			} catch (Exception e) {
			}
		}
		ContextBean contextbean = ContextUtils.getContext();
		VelocityContext context = new VelocityContext();
		context.put("contextPath", request.getContextPath());
		context.put("fileID", fileID);
		context.put("fileName", fileName);
		context.put("dbkey", dbkey);
		context.put("tablename", billid);
		context.put("cellname", cellname);
		context.put("callerName", callerName);
		context.put("username", contextbean.getPersonName());
		context.put("option", option);
		String docHost = docDBHelper.queryDocHost();
		context.put("docHost", docHost);
		String comiturl = docHost + "/repository/file/edit/" + fileID + "/" + contextbean.getPersonID() + "?"
				+ DocUtils.getBizSecureParams();
		context.put("comiturl", comiturl);
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		Template template = ve.getTemplate("templates/doc_ocx/officeediter.html", "utf-8");
		PrintWriter writer = response.getWriter();
		template.merge(context, writer);
		writer.close();
	}

	/**
	 * 将文件转换成pdf文件预览
	 * 
	 * @param request
	 * @param response
	 * @param fileid
	 * @param fileName
	 * @param option
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/pspdfview")
	public void pspdfview(HttpServletRequest request, HttpServletResponse response, String fileID, String fileName,
			String option) throws Exception {
		String host = docDBHelper.queryDocHost();
		String url = host + "/repository/file/viewpdf/" + fileID + "/last/content";
		String durl = host + "/repository/file/view/" + fileID + "/last/content";
		if (fileName == null) {
			fileName = "文件查看";
		}
		VelocityContext context = new VelocityContext();
		context.put("contextPath", request.getContextPath());
		context.put("fileid", fileID);
		context.put("url", url);
		context.put("durl", durl);
		context.put("fileName", URLDecoder.decode(fileName, "utf-8"));
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		Template template = ve.getTemplate("templates/doc_ocx/pspdfview.html", "utf-8");
		PrintWriter writer = response.getWriter();
		template.merge(context, writer);
		writer.close();
	}

	/**
	 * wps表格文件
	 * 
	 * @param request
	 * @param response
	 * @param fileID
	 * @param fileName
	 * @param option
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/wps/etfileediter")
	public void etfileediter(HttpServletRequest request, HttpServletResponse response, String fileID, String fileName,
			String option) throws Exception {
		String docHost = docDBHelper.queryDocHost();
		ContextBean contextbean = ContextUtils.getContext();
		VelocityContext context = new VelocityContext();
		context.put("contextPath", request.getContextPath());
		context.put("docHost", docHost);
		context.put("fileID", fileID);
		fileName = URLDecoder.decode(fileName, "utf-8");
		String titleName = "";
		if (fileName.lastIndexOf(".") > 0) {
			titleName = fileName.substring(0, fileName.lastIndexOf("."));
		} else {
			titleName = fileName;
		}
		context.put("fileName", fileName);
		context.put("titleName", titleName);
		context.put("username", contextbean.getPersonName());
		context.put("option", option);
		String loadurl = docHost + "/repository/file/download/" + fileID + "/" + contextbean.getPersonID() + "?"
				+ DocUtils.getBizSecureParams();
		context.put("loadurl", loadurl);
		String comiturl = docHost + "/repository/file/wpsedit/" + fileID + "/" + contextbean.getPersonID() + "?"
				+ DocUtils.getBizSecureParams();
		context.put("comiturl", comiturl);
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		Template template = ve.getTemplate("templates/doc_ocx/wps/etfileediter.html", "utf-8");
		PrintWriter writer = response.getWriter();
		template.merge(context, writer);
		writer.close();
	}

	/**
	 * wps 幻灯片
	 * 
	 * @param request
	 * @param response
	 * @param fileID
	 * @param fileName
	 * @param option
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/wps/dpsfileediter")
	public void dpsfileediter(HttpServletRequest request, HttpServletResponse response, String fileID, String fileName,
			String option) throws Exception {
		String docHost = docDBHelper.queryDocHost();
		ContextBean contextbean = ContextUtils.getContext();
		VelocityContext context = new VelocityContext();
		context.put("contextPath", request.getContextPath());
		context.put("docHost", docHost);
		context.put("fileID", fileID);
		fileName = URLDecoder.decode(fileName, "utf-8");
		String titleName = "";
		if (fileName.lastIndexOf(".") > 0) {
			titleName = fileName.substring(0, fileName.lastIndexOf("."));
		} else {
			titleName = fileName;
		}
		context.put("fileName", fileName);
		context.put("titleName", titleName);
		context.put("username", contextbean.getPersonName());
		context.put("option", option);
		String loadurl = docHost + "/repository/file/download/" + fileID + "/" + contextbean.getPersonID() + "?"
				+ DocUtils.getBizSecureParams();
		context.put("loadurl", loadurl);
		String comiturl = docHost + "/repository/file/wpsedit/" + fileID + "/" + contextbean.getPersonID() + "?"
				+ DocUtils.getBizSecureParams();
		context.put("comiturl", comiturl);
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		Template template = ve.getTemplate("templates/doc_ocx/wps/dpsfileediter.html", "utf-8");
		PrintWriter writer = response.getWriter();
		template.merge(context, writer);
		writer.close();
	}

	/**
	 * wps-word文件
	 * 
	 * @param request
	 * @param response
	 * @param fileID
	 * @param fileName
	 * @param option
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/wps/fileediter")
	public void fileediter(HttpServletRequest request, HttpServletResponse response, String fileID, String fileName,
			String option) throws Exception {
		String docHost = docDBHelper.queryDocHost();
		ContextBean contextbean = ContextUtils.getContext();
		VelocityContext context = new VelocityContext();
		context.put("contextPath", request.getContextPath());
		context.put("docHost", docHost);
		context.put("fileID", fileID);
		fileName = URLDecoder.decode(fileName, "utf-8");
		String titleName = "";
		if (fileName.lastIndexOf(".") > 0) {
			titleName = fileName.substring(0, fileName.lastIndexOf("."));
		} else {
			titleName = fileName;
		}
		context.put("fileName", fileName);
		context.put("titleName", titleName);
		context.put("username", contextbean.getPersonName());
		context.put("option", option);
		String loadurl = docHost + "/repository/file/download/" + fileID + "/" + contextbean.getPersonID() + "?"
				+ DocUtils.getBizSecureParams();
		context.put("loadurl", loadurl);
		String comiturl = docHost + "/repository/file/wpsedit/" + fileID + "/" + contextbean.getPersonID() + "?"
				+ DocUtils.getBizSecureParams();
		context.put("comiturl", comiturl);
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		Template template = ve.getTemplate("templates/doc_ocx/wps/fileediter.html", "utf-8");
		PrintWriter writer = response.getWriter();
		template.merge(context, writer);
		writer.close();
	}
}
