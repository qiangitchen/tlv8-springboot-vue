package com.tlv8.common.utils;

import com.tlv8.common.db.DBUtils;
import org.apache.ibatis.session.SqlSession;

import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CodeUtils {
	/**
	 * 特殊字符编码
	 */
	public static String encodeSpechars(String str) {
		str = str.replaceAll("<", "#lt;");
		str = str.replaceAll(">", "#gt;");
		str = str.replaceAll("&nbsp;", "#160;");
		str = str.replaceAll("'", "#apos;");
		return str;
	}

	/**
	 * 特殊字符反编码
	 */
	public static String decodeSpechars(String str) {
		str = str.replaceAll("&lt;", "<");
		str = str.replaceAll("&gt;", ">");
		str = str.replaceAll("#lt;", "<");
		str = str.replaceAll("#gt;", ">");
		str = str.replaceAll("#quot;", "\"");
		str = str.replaceAll("#160;", "&nbsp;");
		str = str.replaceAll("#amp;", "&");
		// str = str.replaceAll("#apos;", "'");
		return str;
	}

	/**
	 * 获取指定关键字的流水号
	 * 
	 * @param key
	 * @return
	 */
	public static String getSquare(String key) {
		long square = 1L;
		SqlSession session = DBUtils.getSqlSession();
		Connection connection = null;
		String sql = "select V+1 as V from SA_KVSEQUENCE where K='" + key + "'";
		// 构建树的json
		try {
			connection = session.getConnection();
			ResultSet reslut = connection.createStatement().executeQuery(sql);
			if (reslut.next()) {
				square = reslut.getLong("V");
				String sql_update = "update SA_KVSEQUENCE set V=V+1 where K ='" + key + "'";
				DBUtils.execUpdateQuery("system", sql_update);
			} else {
				String sql_insert = "insert into SA_KVSEQUENCE(K,V) values('" + key + "',1)";
				DBUtils.execInsertQuery("system", sql_insert);
				square = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.closeConn(session, connection, null, null);
		}
		return key + formatNumber("0000", square);
	}

	/**
	 * 格式化数字
	 * 
	 * @param format
	 * @param num
	 * @return
	 */
	public static String formatNumber(String format, long num) {
		DecimalFormat df2 = new DecimalFormat(format);
		return df2.format(num);
	}

	/**
	 * 获取支付订单流水号
	 * 
	 * @return
	 */
	public static String getOrderCode() {
		return getSquare("pay" + new SimpleDateFormat("yyyyMMdd").format(new Date()));
	}

	/**
	 * 获取自定义订单流水号
	 * 
	 * @param bs
	 * @return
	 */
	public static String getOrderCode(String bs) {
		return getSquare(bs + new SimpleDateFormat("yyyyMMdd").format(new Date()));
	}

	/**
	 * UTF-8解码
	 * 
	 * @param str
	 * @return
	 */
	public static String getDecode(String str) {
		try {
			return URLDecoder.decode(str, "UTF-8");
		} catch (Exception e) {
		}
		if (str != null)
			return str;
		return "";
	}

	/**
	 * 两次UTF-8解码
	 * 
	 * @param str
	 * @return
	 */
	public static String getDoubleDecode(String str) {
		return getDecode(getDecode(str));
	}
}
