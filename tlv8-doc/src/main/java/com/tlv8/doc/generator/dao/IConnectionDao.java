package com.tlv8.doc.generator.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public interface IConnectionDao {
	Connection getConnection() throws Exception;

	void CloseConnection(Connection conn, Statement stm, ResultSet rs);
}
