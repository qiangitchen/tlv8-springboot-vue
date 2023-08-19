package com.tlv8.common.utils;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.xwpf.usermodel.*;
import org.apache.xmlbeans.XmlObject;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTRow;

/**
 * word模板处理
 *
 * @author chenqian
 * @update 2022-11-09
 */
public class Docx4jUtil {

    public static Builder of(String path) throws FileNotFoundException, IOException {
        return new Builder(path);
    }

    public static class Builder {
        private XWPFDocument document = null;
        // 占位符参数map
        private Map<String, String> params = new HashMap<>();

        private Builder(String path) throws FileNotFoundException, IOException {
            if (path != null && !path.isEmpty()) {
                // 转成word
                document = new XWPFDocument(new FileInputStream(path));
            }
        }

        /**
         * 增加文本占位符参数(一个)
         *
         * @param key   键
         * @param value 值
         * @return Builder对象
         */
        public Builder addParam(String key, String value) {
            Builder builder = this;
            if (key != null && !key.isEmpty()) {
                params.put(key, value);
            }
            return builder;
        }

        /**
         * 增加参数(多个)
         *
         * @param params 多个参数的map
         * @return Builder对象
         */
        public Builder addParams(Map<String, String> params) {
            this.params.putAll(params);
            return this;
        }


        /**
         * 增加一个表格（适合模板行在表格中间的情况，就是表格处理有模板行，还有表头和表脚）
         *
         * @param tablePlaceholderIndex 指定模板表格的下标位置
         * @param placeholderLocation   指定模板行的下标位置
         * @param placeholderRows       指定模板行占几行
         * @param list                  集合数据
         * @return this
         */
        public Builder addTable(int tablePlaceholderIndex, int placeholderLocation, int placeholderRows, List<Map<String, String>> list) {
            List<XWPFTable> tables = document.getTables();

            //找到指定表格
            XWPFTable table = tables.get(tablePlaceholderIndex);

            //获取模板行
            List<XWPFTableRow> temRows = new ArrayList<>();
            for (int i = 0; i < placeholderRows; i++) {
                temRows.add(table.getRow(placeholderLocation + i));
            }

            for (int i = 0; i < list.size(); i++) {
                //当前行数据集
                Map<String, String> map = list.get(i);

                //复制模板行
//                List<XWPFTableRow> copyRows = new ArrayList<>();
                for (XWPFTableRow temRow : temRows) {
                    //复制模板行得到新行
                    XmlObject copy = temRow.getCtRow().copy();
                    XWPFTableRow newRow = new XWPFTableRow((CTRow) copy, table);
                    //替换新行中的展位符
                    List<XWPFTableCell> cells = newRow.getTableCells();
                    for (XWPFTableCell cell : cells) {
                        List<XWPFParagraph> cellParagraphs = cell.getParagraphs();
                        WordUtil.replaceParagraphsText(cellParagraphs, map);
                    }
                    //把新行插入表格，插入下标为（模板行下标 + 模板行数 + 当前遍历下标）
                    table.addRow(newRow, placeholderLocation + placeholderRows + i);

                }
            }

            //最后移除模板行
            for (int i = 0; i < placeholderRows; i++) {
                table.removeRow(placeholderLocation + i);
            }
            return this;
        }

        public byte[] get() {
            ByteArrayOutputStream stream = new ByteArrayOutputStream();
            WordUtil.changeText(document, params);
            try {
                document.write(stream);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return stream.toByteArray();
        }

    }

}
