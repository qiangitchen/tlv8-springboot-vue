package com.tlv8.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;

/**
 * 日期处理公用类
 * 
 * @author chenqian
 *
 */
public class DateUtils extends org.apache.commons.lang3.time.DateUtils {
	private static String[] parsePatterns = { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM",
			"yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy/MM", "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss",
			"yyyy.MM.dd HH:mm", "yyyy.MM" };

	public static String date2str(Date date) {
		String result = "";
		try {
			SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			result = formater.format(date);
		} catch (Exception e) {
			try {
				SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
				result = formater.format(date);
			} catch (Exception e1) {
			}
		}
		return result;
	}

	public static String date2str(Date date, String formatstr) {
		String result = "";
		try {
			SimpleDateFormat formater = new SimpleDateFormat(formatstr);
			result = formater.format(date);
		} catch (Exception e) {
		}
		return result;
	}

	public static Date str2date(String datestr) {
		Date result = null;
		try {
			SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			result = formater.parse(datestr);
		} catch (Exception e) {
			try {
				SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
				result = formater.parse(datestr);
			} catch (Exception e1) {
			}
		}
		return result;
	}

	public static Date str2date(String datestr, String formatstr) {
		Date result = null;
		try {
			SimpleDateFormat formater = new SimpleDateFormat(formatstr);
			result = formater.parse(datestr);
		} catch (Exception e) {
		}
		return result;
	}

	public static final String parseDateToStr(final String format, final Date date) {
		return new SimpleDateFormat(format).format(date);
	}

	/**
	 * 日期路径 即年/月/日 如2018/08/08
	 */
	public static final String datePath() {
		Date now = new Date();
		return date2str(now, "yyyy/MM/dd");
	}

	/**
	 * 日期型字符串转化为日期 格式
	 */
	public static Date parseDate(Object str) {
		if (str == null) {
			return null;
		}
		try {
			return parseDate(str.toString(), parsePatterns);
		} catch (ParseException e) {
			return null;
		}
	}

	public static Date toDate(LocalDateTime temporalAccessor) {
		ZonedDateTime zdt = temporalAccessor.atZone(ZoneId.systemDefault());
		return Date.from(zdt.toInstant());
	}

	public static Date toDate(LocalDate temporalAccessor) {
		LocalDateTime localDateTime = LocalDateTime.of(temporalAccessor, LocalTime.of(0, 0, 0));
		ZonedDateTime zdt = localDateTime.atZone(ZoneId.systemDefault());
		return Date.from(zdt.toInstant());
	}
}
