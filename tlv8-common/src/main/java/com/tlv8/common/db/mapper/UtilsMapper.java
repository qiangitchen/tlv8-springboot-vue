package com.tlv8.common.db.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UtilsMapper {
	List<Map<String, Object>> selectSQL(String sql);

	int insertSQL(String sql);

	int deleteSQL(String sql);

	int updateSQL(String sql);
}
