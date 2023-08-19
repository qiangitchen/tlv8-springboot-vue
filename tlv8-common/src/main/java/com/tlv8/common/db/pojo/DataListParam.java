package com.tlv8.common.db.pojo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataListParam {
    private String tableName;
    private String keyField;
    private String searchValue;

    private String dataOrder;
    private List<String> columns = new ArrayList<>();
    private Map<String, String> pagination = new HashMap<>();
    private Map<String, String> eqParam = new HashMap<>();

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getKeyField() {
        return keyField;
    }

    public void setKeyField(String keyField) {
        this.keyField = keyField;
    }

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public List<String> getColumns() {
        return columns;
    }

    public void setColumns(List<String> columns) {
        this.columns = columns;
    }

    public Map<String, String> getPagination() {
        return pagination;
    }

    public void setPagination(Map<String, String> pagination) {
        this.pagination = pagination;
    }

    public String getDataOrder() {
        return dataOrder;
    }

    public void setDataOrder(String dataOrder) {
        this.dataOrder = dataOrder;
    }

	public Map<String, String> getEqParam() {
		return eqParam;
	}

	public void setEqParam(Map<String, String> eqParam) {
		this.eqParam = eqParam;
	}
}
