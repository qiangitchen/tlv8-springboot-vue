package com.tlv8.doc.generator.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tlv8.doc.generator.dao.IConnectionDao;

@Component
public class ConnectionDaoImpl implements IConnectionDao {
	@Autowired
	SqlSessionFactory sqlSessionFactory;

	@Override
	public Connection getConnection() throws Exception {
		return sqlSessionFactory.openSession(true).getConnection();
	}

	@Override
	public void CloseConnection(Connection conn, Statement stm, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (stm != null) {
				stm.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
