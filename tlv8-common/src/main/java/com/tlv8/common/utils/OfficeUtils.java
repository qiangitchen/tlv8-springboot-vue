package com.tlv8.common.utils;

/**
 * Office办公文件公用方法
 * 
 * @author 陈乾
 *
 */
public class OfficeUtils {
	public static boolean isOffice(String extnm) {
		return (".doc".equals(extnm) || ".docx".equals(extnm) || ".ppt".equals(extnm) || ".pptx".equals(extnm)
				|| ".xls".equals(extnm) || ".xlsx".equals(extnm) || ".wps".equals(extnm));
	}
}
