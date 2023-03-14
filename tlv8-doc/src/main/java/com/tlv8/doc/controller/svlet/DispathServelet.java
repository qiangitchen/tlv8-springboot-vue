package com.tlv8.doc.controller.svlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tlv8.doc.controller.connector.HttpConnector;
import com.tlv8.doc.controller.connector.ShttpServletRequest;
import com.tlv8.doc.controller.inter.RequestHandler;

@Controller
@RequestMapping("/DocServer")
public class DispathServelet {
	protected final Logger infolog = Logger.getLogger(getClass());

	@RequestMapping("/repository/**")
	public void doFilter(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			ShttpServletRequest srequest = new ShttpServletRequest(request);
			String baseContextPath = srequest.getPathInfo();
			response.setCharacterEncoding("utf-8");
			if ((baseContextPath != null) && (baseContextPath.startsWith("/")) && (baseContextPath.length() > 1)
					&& ((baseContextPath.indexOf('/', 1)) != -1)) {
				try {
					RequestHandler requesthandler = new HttpConnector(srequest).getRequestHandler();
					requesthandler.initHttpHeader(response);
					requesthandler.handleRequest(srequest, response);
				} catch (Exception e) {
					infolog.error(e);
					e.printStackTrace();
					response.sendError(500);
				}
			} else {
				response.sendError(404);
			}
		} catch (IOException e) {
			infolog.error(e);
			e.printStackTrace();
			response.sendError(500);
		}
	}

}
