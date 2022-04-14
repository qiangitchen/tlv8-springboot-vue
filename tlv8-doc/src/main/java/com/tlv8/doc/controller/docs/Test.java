package com.tlv8.doc.controller.docs;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

public class Test {
	public static void main(String[] args) {
//		try {
//			InputStream ins = new FileInputStream("d:\\11.doc");
//			OutputStream outs = new FileOutputStream("d:\\11.pdf");
//			Converter converter = new DocToPDFConverter(ins, outs, false, false);
//			converter.convert();
//			ins.close();
//			outs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		try {
			InputStream ins = new FileInputStream("d:\\11.docx");
			OutputStream outs = new FileOutputStream("d:\\11.pdf");
			Converter converter = new DocxToPDFConverter(ins, outs, false, false);
			converter.convert();
			ins.close();
			outs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
//		try {
//			InputStream ins = new FileInputStream("d:\\11.docx");
//			OutputStream outs = new FileOutputStream("d:\\11.html");
//			Converter converter = new DocxToHTMLConverter(ins, outs, false, false);
//			converter.convert();
//			ins.close();
//			outs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		try {
//			InputStream ins = new FileInputStream("d:\\2.pptx");
//			OutputStream outs = new FileOutputStream("d:\\2.pdf");
//			Converter converter = new PptxToPDFConverter(ins, outs, false,
//					false);
//			converter.convert();
//			ins.close();
//			outs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		try {
//			InputStream ins = new FileInputStream("d:\\3.docx");
//			OutputStream outs = new FileOutputStream("d:\\3.pdf");
//			Converter converter = new DocxToPDFConverter(ins, outs, false,
//					false);
//			converter.convert();
//			ins.close();
//			outs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		try {
//			InputStream ins = new FileInputStream("d:\\4.ppt");
//			OutputStream outs = new FileOutputStream("d:\\4.pdf");
//			Converter converter = new PptToPDFConverter(ins, outs, false,
//					false);
//			converter.convert();
//			ins.close();
//			outs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
}
