package com.tlv8.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统管理
 * 
 * @author 陈乾
 *
 */
@Controller
@RequestMapping("/system")
public class SystemController {

	/**
	 * 菜单设置
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/sysMenu")
	public void sysMenu(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/SA/system/sysMenu/mainActivity.html");
	}

	/**
	 * 机构管理
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/organization")
	public void organization(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/SA/system/organization/mainActivity.html");
	}

	/**
	 * 角色管理
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/roleManage")
	public void roleManage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/SA/system/role/mainActivity.html");
	}

	/**
	 * 授权管理
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/authorManage")
	public void authorManage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/SA/system/authorization/mainActivity.html");
	}

	/**
	 * 管理权限
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/manageMeant")
	public void manageMeant(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/SA/system/management/mainActivity.html");
	}

	/**
	 * 回收站
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/recycle")
	public void recycle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/SA/system/recycled/mainActivity.html");
	}

}
