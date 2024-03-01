package com.tlv8.flw.expression;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import com.tlv8.common.db.DBUtils;

@SuppressWarnings({ "rawtypes" })
public class BusinessExpression {
	/**
	 * 获取表中字段的值
	 * 
	 * @concept【必填】： 表(视图)名称
	 * 
	 * @individual【必填】： 主键的值 fID/sID
	 * 
	 * @condition【可选】： 过虑条件， 例如：fName='system';
	 * 
	 * @orderRelation【可选】： 用来作排序的字段 例如：fCode,fName
	 * 
	 * @returnRelation【必填】： 要取哪个关系的值.
	 * 
	 * @dbkey【必填】：数据库连接标志。
	 */
	public static String getRelationValueString(String concept, String individual, String condition,
			String orderRelation, String returnRelation, String dbkey) {
		String result = "";
		String keyCel = ("system".equals(dbkey.toLowerCase()) ? "SID" : "FID");
		SQL qsql = new SQL().SELECT(returnRelation.toUpperCase());
		qsql.FROM(concept);
		qsql.WHERE(keyCel + "=?");
		if (condition != null && !"".equals(condition.trim())) {
			qsql.WHERE(condition);
		}
		if (orderRelation != null && !"".equals(orderRelation.trim())) {
			qsql.ORDER_BY(orderRelation);
		}
		try {
			List<Object> param = new ArrayList<>();
			param.add(individual);
			List<Map<String, String>> list = DBUtils.selectStringList(dbkey, qsql.toString(), param, true);
			if (list.size() > 0) {
				Map m = list.get(0);
				result = String.valueOf(m.get(returnRelation.toUpperCase()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
