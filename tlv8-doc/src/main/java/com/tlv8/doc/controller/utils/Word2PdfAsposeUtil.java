package com.tlv8.doc.controller.utils;

import com.aspose.words.Document;
import com.aspose.words.License;
import com.aspose.words.SaveFormat;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Word2PdfAsposeUtil {

	public static boolean getLicense() {
		boolean result = false;
		InputStream is = null;
		try {
			Resource resource = new ClassPathResource("license.xml");
			is = resource.getInputStream();
			License aposeLic = new License();
			aposeLic.setLicense(is);
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	public static boolean doc2pdf(InputStream in, OutputStream out) {
		if (!getLicense()) { // 验证License 若不验证则转化出的pdf文档会有水印产生
			return false;
		}
		try {
			long old = System.currentTimeMillis();
			Document doc = new Document(in); // Address是将要被转化的word文档
			doc.save(out, SaveFormat.PDF);// 全面支持DOC, DOCX, OOXML, RTF HTML, OpenDocument, PDF,
			// EPUB, XPS, SWF 相互转换
			long now = System.currentTimeMillis();
			System.out.println("pdf转换成功，共耗时：" + ((now - old) / 1000.0) + "秒"); // 转化用时
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static boolean doc2pdf(String inPath, String outPath) {
		if (!getLicense()) { // 验证License 若不验证则转化出的pdf文档会有水印产生
			return false;
		}
		FileOutputStream os = null;
		try {
			long old = System.currentTimeMillis();
			File file = new File(outPath); // 新建一个空白pdf文档
			os = new FileOutputStream(file);
			Document doc = new Document(inPath); // Address是将要被转化的word文档
			doc.save(os, SaveFormat.PDF);// 全面支持DOC, DOCX, OOXML, RTF HTML, OpenDocument, PDF,
			// EPUB, XPS, SWF 相互转换
			long now = System.currentTimeMillis();
			System.out.println("pdf转换成功，共耗时：" + ((now - old) / 1000.0) + "秒"); // 转化用时
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if (os != null) {
				try {
					os.flush();
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}

	public static void main(String[] arg) {
		String docPath = "D:\\SQL2008故障转移群集搭建.doc";
		String pdfPath = "D:\\SQL2008故障转移群集搭建.pdf";
		Word2PdfAsposeUtil.doc2pdf(docPath, pdfPath);
	}
}
