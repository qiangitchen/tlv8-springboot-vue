package com.tlv8.common.db;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import com.tlv8.common.base.Sys;
import com.tlv8.common.db.dao.UtilsDao;
import com.tlv8.common.utils.spring.SpringUtils;

/**
 * 数据库操作基础类
 *
 * @author 陈乾
 */
@SuppressWarnings({ "unchecked", "rawtypes" })
public class DBUtils {
	private static final Logger logger = LoggerFactory.getLogger(DBUtils.class);

	/**
	 * 获取数据库连接 DataSource
	 * 
	 * @param dbkey
	 * @return DataSource
	 */
	public static DataSource getDataSource(String dbkey) {
		logger.debug(dbkey);
		DynamicRoutingDataSource dynamicRoutingDataSource = SpringUtils.getBean(DynamicRoutingDataSource.class);
		// 获取数据源对象
		DataSource dataSource = dynamicRoutingDataSource.getDataSource(dbkey);
		return dataSource;
	}

	/**
	 * 获取数据源集合
	 * 
	 * @return Map
	 */
	public static Map<String, DataSource> getDBConfig() {
		DynamicRoutingDataSource dynamicRoutingDataSource = SpringUtils.getBean(DynamicRoutingDataSource.class);
		return dynamicRoutingDataSource.getDataSources();
	}

	public static SqlSession getSqlSession() {
		return SpringUtils.getBean(SqlSessionFactory.class).openSession();
	}

	/**
	 * 判断数据库类型PostgreSQL数据库
	 *
	 * @param key
	 * @return boolean
	 */
	public static boolean IsPostgreSQL(String key) {
		boolean res = false;
		DataSource dataSource = getDataSource(key);
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf((":postgresql:").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(null, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型PostgreSQL数据库
	 * 
	 * @return
	 */
	public static boolean IsPostgreSQL() {
		boolean res = false;
		SqlSession session = getSqlSession();
		Connection conn = null;
		try {
			conn = session.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf((":postgresql:").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(session, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型达梦数据库
	 *
	 * @param key
	 * @return boolean
	 */
	public static boolean IsDMDB(String key) {
		boolean res = false;
		DataSource dataSource = getDataSource(key);
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf((":dm:").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(null, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型达梦数据库
	 * 
	 * @return
	 */
	public static boolean IsDMDB() {
		boolean res = false;
		SqlSession session = getSqlSession();
		Connection conn = null;
		try {
			conn = session.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf((":dm:").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(session, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型金仓数据库
	 *
	 * @param key
	 * @return boolean
	 */
	public static boolean IsKingDB(String key) {
		boolean res = false;
		DataSource dataSource = getDataSource(key);
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf(("kingbase").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(null, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型金仓数据库
	 * 
	 * @return
	 */
	public static boolean IsKingDB() {
		boolean res = false;
		SqlSession session = getSqlSession();
		Connection conn = null;
		try {
			conn = session.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf(("kingbase").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(session, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型ORACLE
	 *
	 * @param key
	 * @return boolean
	 */
	public static boolean IsOracleDB(String key) {
		boolean res = false;
		DataSource dataSource = getDataSource(key);
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf(("oracle").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(null, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型ORACLE
	 * 
	 * @return
	 */
	public static boolean IsOracleDB() {
		boolean res = false;
		SqlSession session = getSqlSession();
		Connection conn = null;
		try {
			conn = session.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf(("oracle").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(session, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型MYSQL
	 *
	 * @param key
	 * @return boolean
	 */
	public static boolean IsMySQLDB(String key) {
		boolean res = false;
		DataSource dataSource = getDataSource(key);
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf(("mysql").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(null, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型MYSQL
	 * 
	 * @return
	 */
	public static boolean IsMySQLDB() {
		boolean res = false;
		SqlSession session = getSqlSession();
		Connection conn = null;
		try {
			conn = session.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf(("mysql").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(session, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型SQL Server
	 *
	 * @param key
	 * @return boolean
	 */
	public static boolean IsMSSQLDB(String key) {
		boolean res = false;
		DataSource dataSource = getDataSource(key);
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf(("jtds").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(null, conn, null, null);
		}
		return res;
	}

	/**
	 * 判断数据库类型SQL Server
	 * 
	 * @return
	 */
	public static boolean IsMSSQLDB() {
		boolean res = false;
		SqlSession session = getSqlSession();
		Connection conn = null;
		try {
			conn = session.getConnection();
			String url = conn.getMetaData().getURL();
			res = url.toUpperCase().indexOf(("jtds").toUpperCase()) > 0;
		} catch (Exception e) {
		} finally {
			closeConn(session, conn, null, null);
		}
		return res;
	}

	/**
	 * 获取连接
	 *
	 * @param key
	 * @return Connection
	 * @throws SQLException
	 * @see java.sql.Connection
	 */
	public static Connection getAppConn(String key) throws SQLException {
		DataSource dataSource = getDataSource(key);
		Connection conn = dataSource.getConnection();
		conn.setAutoCommit(true);
		return conn;
	}

	/**
	 * 查询操作JDBC
	 *
	 * @param key
	 * @param sql
	 * @return List
	 * @throws SQLException
	 * @see java.util.List
	 */
	public static List<Map<String, String>> execQueryforList(String key, String sql) throws SQLException {
		return execQueryforList(key, sql, false);
	}

	/**
	 * 查询操作JDBC
	 *
	 * @param key
	 * @param sql
	 * @param upperColumnName 是否将返回的字段名转为大写
	 * @return List
	 * @throws SQLException
	 * @see java.util.List
	 */
	public static List<Map<String, String>> execQueryforList(String key, String sql, boolean upperColumnName)
			throws SQLException {
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		List li = new ArrayList();
		Connection aConn = getAppConn(key);
		Statement qry = aConn.createStatement(1004, 1007);
		try {
			rs = qry.executeQuery(sql);
			rsmd = rs.getMetaData();
			int size = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, String> sm = new HashMap<String, String>();
				for (int i = 1; i <= size; i++) {
					String cellType = rsmd.getColumnTypeName(i);
					String columnName = rsmd.getColumnLabel(i);
					if (upperColumnName) {
						columnName = columnName.toUpperCase();
					}
					if ("DATE".equals(cellType) || "DATETIME".equals(cellType) || "TIMESTAMP".equals(cellType)) {
						try {
							try {
								SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								String v_l = format.format(format.parse(rs.getString(i)));
								sm.put(columnName, v_l);
							} catch (Exception e) {
								try {
									SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
									SimpleDateFormat nformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									String v_l = nformat.format(format.parse(rs.getString(i)));
									sm.put(columnName, v_l);
								} catch (Exception er) {
									SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
									String v_l = format.format(format.parse(rs.getString(i)));
									sm.put(columnName, v_l);
								}
							}
						} catch (Exception e) {
							sm.put(columnName, "");
						}
					} else if ("BLOB".equals(cellType)) {
						try {
							sm.put(columnName, convertBlobToBase64String(rs.getBlob(i)));
						} catch (Exception e) {
							sm.put(columnName, null);
							Sys.printMsg(e.toString());
						}
					} else if ("CLOB".equals(cellType)) {
						Clob clob = rs.getClob(i);
						String content = "";
						if (clob != null) {
							BufferedReader in = new BufferedReader(clob.getCharacterStream());
							StringWriter out = new StringWriter();
							int c;
							try {
								while ((c = in.read()) != -1) {
									out.write(c);
								}
							} catch (IOException e) {
								e.printStackTrace();
							}
							content = out.toString();
						}
						sm.put(columnName, content);
					} else if ("INTEGER".equals(cellType) || "INT".equals(cellType) || "LONG".equals(cellType)) {
						sm.put(columnName, (rs.getString(i) == null) ? "" : String.valueOf(rs.getLong(i)));
					} else if ("NUMBER".equals(cellType) || "FLOAT".equals(cellType) || "DECIMAL".equals(cellType)
							|| "DOUBLE".equals(cellType)) {
						sm.put(columnName, (rs.getString(i) == null) ? "" : rs.getBigDecimal(i).toString());
					} else {
						sm.put(columnName, (rs.getString(i) == null) ? "" : String.valueOf(rs.getString(i)));
					}
				}
				li.add(sm);
			}
		} catch (SQLException e) {
			Sys.printMsg(e.toString());
			throw new SQLException(e + ">>\n sql:" + sql);
		} finally {
			closeConn(null, aConn, qry, rs);
		}
		return li;
	}

	/**
	 * 查询操作
	 * 
	 * @param sql
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public static List<Map<String, String>> execQueryforList(String sql, List<Object> param) throws SQLException {
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		List li = new ArrayList();
		SqlSession session = getSqlSession();
		Connection aConn = session.getConnection();
		PreparedStatement ps = null;
		try {
			ps = aConn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.size(); i++) {
					ps.setObject(i + 1, param.get(i));
				}
			}
			rs = ps.executeQuery();
			rsmd = rs.getMetaData();
			int size = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, String> sm = new HashMap<String, String>();
				for (int i = 1; i <= size; i++) {
					String cellType = rsmd.getColumnTypeName(i);
					String columnName = rsmd.getColumnLabel(i);
					if ("DATE".equals(cellType) || "DATETIME".equals(cellType) || "TIMESTAMP".equals(cellType)) {
						try {
							try {
								SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
								String v_l = format.format(format.parse(rs.getString(i)));
								sm.put(columnName, v_l);
							} catch (Exception e) {
								try {
									SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
									SimpleDateFormat nformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									String v_l = nformat.format(format.parse(rs.getString(i)));
									sm.put(columnName, v_l);
								} catch (Exception er) {
									SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
									String v_l = format.format(format.parse(rs.getString(i)));
									sm.put(columnName, v_l);
								}
							}
						} catch (Exception e) {
							sm.put(columnName, "");
						}
					} else if ("BLOB".equals(cellType)) {
						try {
							sm.put(columnName, convertBlobToBase64String(rs.getBlob(i)));
						} catch (Exception e) {
							sm.put(columnName, null);
							Sys.printMsg(e.toString());
						}
					} else if ("CLOB".equals(cellType)) {
						Clob clob = rs.getClob(i);
						String content = "";
						if (clob != null) {
							BufferedReader in = new BufferedReader(clob.getCharacterStream());
							StringWriter out = new StringWriter();
							int c;
							try {
								while ((c = in.read()) != -1) {
									out.write(c);
								}
							} catch (IOException e) {
								e.printStackTrace();
							}
							content = out.toString();
						}
						sm.put(columnName, content);
					} else if ("INTEGER".equals(cellType) || "INT".equals(cellType) || "LONG".equals(cellType)) {
						sm.put(columnName, (rs.getString(i) == null) ? "" : String.valueOf(rs.getLong(i)));
					} else if ("NUMBER".equals(cellType) || "FLOAT".equals(cellType) || "DECIMAL".equals(cellType)
							|| "DOUBLE".equals(cellType)) {
						sm.put(columnName, (rs.getString(i) == null) ? "" : rs.getBigDecimal(i).toString());
					} else {
						sm.put(columnName, (rs.getString(i) == null) ? "" : String.valueOf(rs.getString(i)));
					}
				}
				li.add(sm);
			}
		} catch (SQLException e) {
			Sys.printMsg(e.toString());
			session.close();
			throw new SQLException(e + ">>\n sql:" + sql);
		} finally {
			closeConn(session, aConn, ps, rs);
		}
		return li;
	}

	/**
	 * blob转base64
	 *
	 * @param blob
	 * @return String
	 */
	public static String convertBlobToBase64String(Blob blob) {
		String result = "";
		if (null != blob) {
			try {
				InputStream msgContent = blob.getBinaryStream();
				ByteArrayOutputStream output = new ByteArrayOutputStream();
				byte[] buffer = new byte[100];
				int n = 0;
				while (-1 != (n = msgContent.read(buffer))) {
					output.write(buffer, 0, n);
				}
				result = new String(Base64.getEncoder().encode(output.toByteArray()));
				output.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		} else {
			return null;
		}
	}

	/**
	 * 查询数据返回list
	 *
	 * @param key
	 * @param sql
	 * @return list
	 * @throws SQLException
	 * @see java.util.List
	 */
	public static List<Map<String, Object>> selectForList(String key, String sql) throws SQLException {
		List<Map<String, Object>> rlist = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getAppConn(key);
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int cns = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int n = 1; n <= cns; n++) {
					map.put(rsmd.getColumnLabel(n), rs.getObject(n));
				}
				rlist.add(map);
			}
		} catch (Exception e) {
			logger.error(e.toString());
			throw e;
		}
		return rlist;
	}

	/**
	 * 获取通用查询列表。
	 *
	 * @param sql     查询sql
	 * @param listStr 显示数据字段名
	 * @return List&lt;Map&lt;String, String&gt;&gt;
	 * @see java.util.List
	 * @see java.util.Map
	 */
	public static List<Map<String, String>> execQueryList(String dbkey, String sql, List<String> listStr,
			List<String> listprms, List<String> listprms1) {
		List result = new ArrayList<Map<String, String>>();
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = getAppConn(dbkey);
			if (connection != null) {
				ps = connection.prepareStatement(sql);
				if (listprms != null && listprms.size() > 0) {
					for (int k = 0; k < listprms.size(); k++) {
						if (listprms1 != null && listprms1.size() > 0) {
							if (listprms1.get(k).equals("1")) {
								ps.setString(k + 1, "%" + listprms.get(k) + "%");
							} else if (listprms1.get(k).equals("int")) {
								ps.setInt(k + 1, Integer.parseInt(listprms.get(k)));
							} else if (listprms1.get(k).equals("dou")) {
								ps.setDouble(k + 1, Double.parseDouble(listprms.get(k)));
							} else {
								ps.setString(k + 1, listprms.get(k));
							}
						} else {
							ps.setString(k + 1, listprms.get(k));
						}
					}
				}
				rs = ps.executeQuery();
				while (rs.next()) {
					Map msp = new HashMap();
					for (int i = 0; i < listStr.size(); i++) {
						String key = listStr.get(i);
						msp.put(key, rs.getString(key));
					}

					result.add(msp);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConn(null, connection, ps, rs);
		}
		return result;
	}

	/**
	 * 查詢操作[为了兼容老版本]不推荐使用
	 *
	 * @param aConn
	 * @param aSQL
	 * @return ResultSet
	 * @throws SQLException
	 * @see java.sql.ResultSet
	 */
	public static ResultSet execQuery(Connection aConn, String aSQL) throws SQLException {
		ResultSet result = null;
		Statement qry = aConn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		try {
			result = qry.executeQuery(aSQL);
			return result;
		} catch (SQLException e) {
			throw new SQLException(e);
		}
	}

	/**
	 * 更新操作
	 *
	 * @param dbkey
	 * @param sql
	 * @return String
	 * @throws SQLException
	 */
	public static String execUpdateQuery(String dbkey, String sql) throws SQLException {
		String result = "success";
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getAppConn(dbkey);
			ps = connection.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		} finally {
			closeConn(null, connection, ps, null);
		}
		return result;
	}

	/**
	 * 更新操作
	 *
	 * @param dbkey
	 * @param sql
	 * @param list
	 * @return String
	 * @throws SQLException
	 */
	public static String execUpdate(String dbkey, String sql, List<String> list) throws SQLException {
		Connection connection = null;
		PreparedStatement ps = null;
		String result = "false";
		try {
			connection = getAppConn(dbkey);
			if (connection != null) {
				ps = connection.prepareStatement(sql);
				for (int i = 0; i < list.size(); i++) {
					ps.setString((i + 1), list.get(i));
				}
				boolean flag = ps.execute();
				result = String.valueOf(flag);
			}
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		} finally {
			closeConn(null, connection, ps, null);
		}
		return result;
	}

	/**
	 * 更新操作
	 * 
	 * @param sql
	 * @param list
	 * @return
	 * @throws SQLException
	 */
	public static int execUpdate(String sql, List<Object> list) throws SQLException {
		SqlSession session = getSqlSession();
		Connection connection = null;
		PreparedStatement ps = null;
		int result = 0;
		try {
			connection = session.getConnection();
			if (connection != null) {
				ps = connection.prepareStatement(sql);
				for (int i = 0; i < list.size(); i++) {
					ps.setObject((i + 1), list.get(i));
				}
				result = ps.executeUpdate();
			}
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		} finally {
			closeConn(session, connection, ps, null);
		}
		return result;
	}

	/**
	 * 插入操作 -单表操作可用
	 *
	 * @param dbkey
	 * @param sql
	 * @return String
	 * @throws SQLException
	 */
	public static String execInsertQuery(String dbkey, String sql) throws SQLException {
		String result = "success";
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getAppConn(dbkey);
			ps = connection.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		} finally {
			closeConn(null, connection, ps, null);
		}
		return result;
	}

	/**
	 * 删除操作 -单表操作可用
	 *
	 * @param dbkey
	 * @param sql
	 * @return String
	 * @throws SQLException
	 */
	public static String execdeleteQuery(String dbkey, String sql) throws SQLException {
		String result = "success";
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getAppConn(dbkey);
			ps = connection.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		} finally {
			closeConn(null, connection, ps, null);
		}
		return result;
	}

	/**
	 * 关闭数据库连接
	 *
	 * @param conn
	 * @param stm
	 * @param rs
	 * @throws SQLException
	 */
	public static void closeConn(Connection conn, Statement stm, ResultSet rs) throws SQLException {
		try {
			if (rs != null)
				rs.close();
			if (stm != null)
				stm.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			throw new SQLException(e.toString());
		}
	}

	/**
	 * 关闭数据库连接
	 *
	 * @param session
	 * @param conn
	 * @param stm
	 * @param rs
	 * @see org.apache.ibatis.session.SqlSession
	 * @see java.sql.Connection
	 * @see java.sql.Statement
	 * @see java.sql.ResultSet
	 */
	public static void closeConn(SqlSession session, Connection conn, Statement stm, ResultSet rs) {
		try {
			if (session != null) {
				session.commit(true);
			}
		} catch (Exception e) {
		}
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
		try {
			if (stm != null)
				stm.close();
		} catch (Exception e) {
		}
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
		try {
			if (session != null)
				session.close();
		} catch (Exception e) {
		}
	}

	/**
	 * 调用存储过程; aParams为分号分割的字符串参数值列表, 所有参数只能是字符串类型, 且只能是in类型
	 *
	 * @param aProcName
	 * @param aParamValues
	 * @return String
	 */
	public static String callProc(String aProcName, String aParamValues) throws Exception {
		return callProc("system", aProcName, aParamValues);
	}

	/**
	 * 调用存储过程; aParams为分号分割的字符串参数值列表, 所有参数只能是字符串类型, 且只能是in类型
	 *
	 * @param dbkey
	 * @param aProcName
	 * @param aParamValues
	 * @return String
	 */
	public static String callProc(String dbkey, String aProcName, String aParamValues) throws Exception {
		String result;
		result = "调用存储过程";
		logger.debug(String.format("com.tlv8.base.db.DBUtils.callProc(aProcName:%s, aParamValues:%s)", aProcName,
				aParamValues));

		String[] values = aParamValues.split(";");
		try {
			Connection conn = getAppConn(dbkey);
			CallableStatement proc = null;
			try {
				String s1 = "";
				for (int i = 1; i <= values.length; i++) {
					s1 += ",?";
				}
				if (s1.length() > 0)
					s1 = s1.substring(1);
				String sql = String.format("{ call %s(%s,?) }", aProcName, s1);
				proc = conn.prepareCall(sql);
				for (int i = 1; i <= values.length; i++) {
					proc.setString(i, values[i - 1]);
					proc.registerOutParameter(3, Types.VARCHAR);
				}
				proc.execute();
				result += "->" + proc.getString(3);
				logger.debug(result);
			} finally {
				closeConn(null, conn, proc, null);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return result;
	}

	/**
	 * 查询数据
	 *
	 * @param session
	 * @param sql
	 * @return List&lt;Map&lt;String, Object&gt;&gt;
	 */
	public static List<Map<String, Object>> selectList(SqlSession session, String sql) {
		List<Map<String, Object>> rlist = session.selectList(UtilsDao.select, sql);
		return rlist;
	}

	/**
	 * 查询数据 -带参数
	 *
	 * @param session
	 * @param sql
	 * @param params
	 * @return List&lt;Map&lt;String, Object&gt;&gt;
	 * @throws Exception
	 */
	public static List<Map<String, Object>> selectList(SqlSession session, String sql, Object[] params)
			throws Exception {
		List<Object> ps = new ArrayList<Object>();
		for (Object o : params) {
			ps.add(o);
		}
		List<Map<String, Object>> rlist = selectList(session, sql, ps);
		return rlist;
	}

	/**
	 * 查询数据 -带参数
	 *
	 * @param session
	 * @param sql
	 * @param params
	 * @return List&lt;Map&lt;String, Object&gt;&gt;
	 * @throws Exception
	 */
	private static List<Map<String, Object>> selectList(SqlSession session, String sql, List<Object> params)
			throws Exception {
		List<Map<String, Object>> rlist = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = session.getConnection();
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.size(); i++) {
				ps.setObject(i + 1, params.get(i));
			}
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int cns = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int n = 1; n <= cns; n++) {
					map.put(rsmd.getColumnLabel(n), rs.getObject(n));
				}
				rlist.add(map);
			}
		} catch (Exception e) {
			logger.error(e.toString());
			throw e;
		}
		return rlist;
	}

	/**
	 * 查询数据 -字段内容返回String类型
	 *
	 * @param dbname
	 * @param sql
	 * @return List&lt;Map&lt;String, Object&gt;&gt;
	 * @throws Exception
	 */
	public static List<Map<String, String>> selectStringList(String dbname, String sql) throws Exception {
		return selectStringList(dbname, sql, false);
	}

	/**
	 * 查询数据 -字段内容返回String类型
	 *
	 * @param dbname
	 * @param sql
	 * @return List&lt;Map&lt;String, Object&gt;&gt;
	 * @throws Exception
	 */
	public static List<Map<String, String>> selectStringList(String dbname, String sql, boolean upperColumnName)
			throws Exception {
		return selectStringList(dbname, sql, null, upperColumnName);
	}

	/**
	 * 查询数据 -字段内容返回String类型
	 *
	 * @param session
	 * @param sql
	 * @return List&lt;Map&lt;String, String&gt;&gt;
	 * @throws Exception
	 */
	public static List<Map<String, String>> selectStringList(SqlSession session, String sql, boolean upperColumnName)
			throws Exception {
		return selectStringList(session, sql, null, upperColumnName);
	}

	/**
	 * 查询数据 -带参数 字段内容返回String类型
	 *
	 * @param dbname
	 * @param sql
	 * @param params
	 * @return List&lt;Map&lt;String, Object&gt;&gt;
	 * @throws Exception
	 */
	public static List<Map<String, String>> selectStringList(String dbname, String sql, List<Object> params,
			boolean upperColumnName) throws Exception {
		List<Map<String, String>> rlist = new ArrayList<Map<String, String>>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getAppConn(dbname);
			ps = conn.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.size(); i++) {
					ps.setObject(i + 1, params.get(i));
				}
			}
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int cns = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				for (int n = 1; n <= cns; n++) {
					String colname = rsmd.getColumnLabel(n);
					if (upperColumnName) {
						colname = colname.toUpperCase();
					}
					map.put(colname, rs.getString(n));
				}
				rlist.add(map);
			}
		} catch (Exception e) {
			logger.error(e.toString());
			throw e;
		} finally {
			closeConn(null, conn, ps, rs);
		}
		return rlist;
	}

	/**
	 * @param session
	 * @param sql
	 * @param params
	 * @return List&lt;Map&lt;String, Object&gt;&gt;
	 * @throws Exception
	 */
	public static List<Map<String, String>> selectStringList(SqlSession session, String sql, List<Object> params,
			boolean upperColumnName) throws Exception {
		List<Map<String, String>> rlist = new ArrayList<Map<String, String>>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = session.getConnection();
			ps = conn.prepareStatement(sql);
			if (params != null) {
				for (int i = 0; i < params.size(); i++) {
					ps.setObject(i + 1, params.get(i));
				}
			}
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int cns = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				for (int n = 1; n <= cns; n++) {
					String colname = rsmd.getColumnLabel(n);
					if (upperColumnName) {
						colname = colname.toUpperCase();
					}
					map.put(colname, rs.getString(n));
				}
				rlist.add(map);
			}
		} catch (Exception e) {
			logger.error(e.toString());
			throw e;
		} finally {
			closeConn(null, null, ps, rs);
		}
		return rlist;
	}

	/**
	 * 查询数据 -带参数
	 *
	 * @param dbname
	 * @param sql
	 * @param params
	 * @return List&lt;Map&lt;String, Object&gt;&gt;
	 */
	public static List<Map<String, Object>> selectList(String dbname, String sql, List<Object> params,
			boolean upperColumnName) {
		List<Map<String, Object>> rlist = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getAppConn(dbname);
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.size(); i++) {
				ps.setObject(i + 1, params.get(i));
			}
			rs = ps.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int cns = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int n = 1; n <= cns; n++) {
					String colname = rsmd.getColumnLabel(n);
					if (upperColumnName) {
						colname = colname.toUpperCase();
					}
					map.put(colname, rs.getObject(n));
				}
				rlist.add(map);
			}
		} catch (Exception e) {
			logger.error(e.toString());
			e.printStackTrace();
		} finally {
			closeConn(null, conn, ps, rs);
		}
		return rlist;
	}

	/**
	 * 插入数据 并自动提交
	 *
	 * @param dbname
	 * @param sql
	 * @return int
	 */
	public static int excuteInsert(String dbname, String sql) throws Exception {
		int r = 0;
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getAppConn(dbname);
			ps = connection.prepareStatement(sql);
			r = ps.executeUpdate();
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		} finally {
			closeConn(null, connection, ps, null);
		}
		return r;
	}

	/**
	 * 插入数据
	 *
	 * @param session
	 * @param sql
	 * @return int
	 */
	public static int excuteInsert(SqlSession session, String sql) throws Exception {
		try {
			int r = session.update(UtilsDao.insert, sql);
			return r;
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		}
	}

	/**
	 * 数据插入 统一事务
	 *
	 * @param session
	 * @param sql
	 * @param params
	 * @return int
	 */
	public static int excuteInsert(SqlSession session, String sql, List<Object> params) throws Exception {
		return excuteUpdate(session, sql, params);
	}

	/**
	 * 删除数据 并自动提交
	 *
	 * @param dbname
	 * @param sql
	 * @return int
	 */
	public static int excuteDelete(String dbname, String sql) throws Exception {
		int r = 0;
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getAppConn(dbname);
			ps = connection.prepareStatement(sql);
			r = ps.executeUpdate();
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		} finally {
			closeConn(null, connection, ps, null);
		}
		return r;
	}

	/**
	 * 删除数据
	 *
	 * @param session
	 * @param sql
	 * @return int
	 */
	public static int excuteDelete(SqlSession session, String sql) throws Exception {
		try {
			int r = session.update(UtilsDao.update, sql);
			return r;
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		}
	}

	/**
	 * 更新数据 并自动提交
	 *
	 * @param dbname
	 * @param sql
	 * @return int
	 */
	public static int excuteUpdate(String dbname, String sql) throws Exception {
		int r = 0;
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = getAppConn(dbname);
			ps = connection.prepareStatement(sql);
			r = ps.executeUpdate();
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		} finally {
			closeConn(null, connection, ps, null);
		}
		return r;
	}

	/**
	 * 更新数据
	 *
	 * @param session
	 * @param sql
	 * @return int
	 */
	public static int excuteUpdate(SqlSession session, String sql) throws Exception {
		try {
			int r = session.update(UtilsDao.update, sql);
			return r;
		} catch (Exception e) {
			Sys.printErr(e);
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		}
	}

	/**
	 * 数据操作 -自动提交 -带参数
	 *
	 * @param dbname
	 * @param sql
	 * @param params
	 * @return int
	 */
	public static int excuteUpdate(String dbname, String sql, List<Object> params) throws Exception {
		int r = -1;
		Connection conn = null;
		PreparedStatement ps = null;
		boolean aucommit = false;
		try {
			logger.debug(dbname);
			conn = getAppConn(dbname);
			aucommit = conn.getAutoCommit();
			conn.setAutoCommit(false);
			logger.debug(sql);
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.size(); i++) {
				ps.setObject(i + 1, params.get(i));
			}
			r = ps.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			logger.error(e.toString());
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		} finally {
			conn.setAutoCommit(aucommit);
			closeConn(null, conn, ps, null);
		}
		return r;
	}

	/**
	 * 数据操作 -非自动提交(需程序自己提交) -带参数 适合用于统一事物操作
	 *
	 * @param session
	 * @param sql
	 * @param params
	 * @return int
	 */
	public static int excuteUpdate(SqlSession session, String sql, List<Object> params) throws Exception {
		int r = -1;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = session.getConnection();
			logger.debug(sql);
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.size(); i++) {
				ps.setObject(i + 1, params.get(i));
			}
			r = ps.executeUpdate();
		} catch (Exception e) {
			logger.error(e.toString());
			throw new SQLException(RegexUtil.getSubOraex(e.getMessage()));
		}
		return r;
	}

	/**
	 * 调用存储过程; aParams为分号分割的字符串参数值列表, 所有参数只能是字符串类型, 且只能是in类型
	 *
	 * @param dbkey
	 * @param sql
	 * @return String
	 */
	public static String executeCommand(String dbkey, String sql) throws Exception {
		String result;
		result = "执行命令";
		logger.debug(String.format("dbkey:%s, sql:%s", dbkey, sql));
		try {
			Connection conn = getAppConn(dbkey);
			CallableStatement proc = null;
			try {
				proc = conn.prepareCall(sql);
				proc.registerOutParameter(3, Types.VARCHAR);
				proc.execute();
				result += "->" + proc.getString(3);
				logger.debug(result);
			} finally {
				closeConn(null, conn, proc, null);
			}
		} catch (Exception e) {
			throw new Exception(e);
		}
		return result;
	}

	public static void excuteDelete(Connection conn, String sql) throws Exception {
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} finally {
			closeConn(null, ps, null);
		}
	}

}