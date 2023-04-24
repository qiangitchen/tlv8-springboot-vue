package com.tlv8.doc.listenner;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Statement;
import java.util.stream.Collectors;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.ibatis.session.SqlSession;

import com.tlv8.common.db.DBUtils;
import com.tlv8.doc.generator.utils.Sys;

public class DataSourceLoaderListener implements ServletContextListener {
	protected boolean started = false;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		started = false;
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		printWellcome(event);
		started = true;
		datalisten();
	}

	private void datalisten() {
		try {
			Sys.printMsg("启动数据库监听...");
			new Thread(new Runnable() {

				@Override
				public void run() {
					while (started) {
						SqlSession session = DBUtils.getSqlSession();
						Connection conn = null;
						Statement stm = null;
						try {
							conn = session.getConnection();
							stm = conn.createStatement();
							stm.executeQuery("select * from Doc_Admin");
						} catch (Exception e) {
						} finally {
							DBUtils.closeConn(session, conn, stm, null);
						}
						try {
							Thread.sleep(5 * 60 * 1000);// 5分钟检测一次
						} catch (InterruptedException e) {
						}
					}
				}
			}).start();
			Sys.printMsg("启动数据库监听完成.");
		} catch (Exception e) {
			Sys.printMsg("启动数据库监听异常:");
			e.printStackTrace();
		}
	}

	@SuppressWarnings("deprecation")
	private void printWellcome(ServletContextEvent event) {
		try {
			String context = new BufferedReader(
					new InputStreamReader(DataSourceLoaderListener.class.getResourceAsStream("wellcome"))).lines()
							.collect(Collectors.joining(System.lineSeparator()));
			context = context.replace("${dir}", event.getServletContext().getRealPath(""));
			try {
				context = context.replace("${db}", DBUtils.getAppConn("doc").getMetaData().getDriverName());
			} catch (Exception e) {
				context = context.replace("${db}", "检测异常");
			}
			System.out.println(context);
		} catch (Exception e) {
		}
	}

}
