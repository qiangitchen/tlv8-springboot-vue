package com.tlv8.common.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.xwpf.usermodel.*;

/**
 * word文件模板操作
 * 
 * @author 陈乾
 *
 */
public class WordUtil {
	private final static String pattern = "\\$\\{[^}]+}";
	private static final Pattern compile = Pattern.compile(pattern);

	/**
	 * 替换段落文本
	 *
	 * @param document docx解析对象
	 * @param textMap  需要替换的信息集合
	 */
	public static void changeText(XWPFDocument document, Map<String, String> textMap) {
		// 获取段落集合
		List<XWPFParagraph> paragraphs = document.getParagraphs();
		replaceParagraphsText(paragraphs, textMap);

		// 表格中的站位符也要处理
		// 得到word中的表格
		Iterator<XWPFTable> it = document.getTablesIterator();
		while (it.hasNext()) {
			XWPFTable table = it.next();
			List<XWPFTableRow> rows = table.getRows();
			// 读取每一行数据
			for (XWPFTableRow row : rows) {
				// 读取每一列数据
				List<XWPFTableCell> cells = row.getTableCells();
				for (XWPFTableCell cell : cells) {
					List<XWPFParagraph> cellParagraphs = cell.getParagraphs();
					replaceParagraphsText(cellParagraphs, textMap);
					/*
					 * //输出当前的单元格的数据 String stext = cell.getText(); // 替换模板原来位置 Matcher m =
					 * compile.matcher(stext); if (m.find()) { String key = m.group();
					 * cell.setText(textMap.get(getKey(key))); }
					 */
				}
			}
		}
	}

	/**
	 * 替换段落占位符的值
	 *
	 * @param paragraphs 段落
	 * @param textMap    数据集
	 */
	public static void replaceParagraphsText(List<XWPFParagraph> paragraphs, Map<String, String> textMap) {
		for (XWPFParagraph paragraph : paragraphs) {
			// 获取到段落中的所有文本内容
			String text = paragraph.getText();
			// 判断此段落中是否有需要进行替换的文本
			if (checkText(text)) {
				List<XWPFRun> runs = paragraph.getRuns();
				for (XWPFRun run : runs) {
					// 原值
					String rtext = run.text();
					// 替换模板原来位置
					Matcher m = compile.matcher(rtext);
					if (m.find()) {
						String key = m.group();
						run.setText(rtext.replace(key, textMap.get(getKey(key))), 0);
					}
				}
			}
		}
	}

	public static String getKey(String g) {
		return g.substring(2, g.length() - 1);
	}

	/**
	 * 判断文本中是否包含$
	 *
	 * @param text 文本
	 * @return 包含返回true, 不包含返回false
	 */
	public static boolean checkText(String text) {
		boolean check = false;
		if (text.contains("$")) {
			check = true;
		}
		return check;
	}

	/**
	 * 替换${.}文本
	 * 
	 * @param ins
	 * @param textMap
	 * @return
	 * @throws IOException
	 */
	public static XWPFDocument changeText(InputStream ins, Map<String, String> textMap) throws IOException {
		XWPFDocument document = new XWPFDocument(ins);
		changeText(document, textMap);
		return document;
	}

	/**
	 * 替换${.}文本
	 * 
	 * @param ins
	 * @param textMap
	 * @param ous
	 * @throws IOException
	 */
	public static void changeText(InputStream ins, Map<String, String> textMap, OutputStream ous) throws IOException {
		XWPFDocument document = changeText(ins, textMap);
		document.write(ous);
	}

}
