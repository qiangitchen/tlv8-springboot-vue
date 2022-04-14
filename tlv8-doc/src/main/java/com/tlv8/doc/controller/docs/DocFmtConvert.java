package com.tlv8.doc.controller.docs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComFailException;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
import com.tlv8.common.utils.IDUtils;

// 格式大全:前缀对应以下方法的fmt值 
// 0:Microsoft Word 97 - 2003 文档 (.doc) 
// 1:Microsoft Word 97 - 2003 模板 (.dot) 
// 2:文本文档 (.txt) 
// 3:文本文档 (.txt) 
// 4:文本文档 (.txt) 
// 5:文本文档 (.txt) 
// 6:RTF 格式 (.rtf) 
// 7:文本文档 (.txt) 
// 8:HTML 文档 (.htm)(带文件夹) 
// 9:MHTML 文档 (.mht)(单文件) 
// 10:MHTML 文档 (.mht)(单文件) 
// 11:XML 文档 (.xml) 
// 12:Microsoft Word 文档 (.docx) 
// 13:Microsoft Word 启用宏的文档 (.docm) 
// 14:Microsoft Word 模板 (.dotx) 
// 15:Microsoft Word 启用宏的模板 (.dotm) 
// 16:Microsoft Word 文档 (.docx) 
// 17:PDF 文件 (.pdf) 
// 18:XPS 文档 (.xps) 
// 19:XML 文档 (.xml) 
// 20:XML 文档 (.xml) 
// 21:XML 文档 (.xml) 
// 22:XML 文档 (.xml) 
// 23:OpenDocument 文本 (.odt) 
// 24:WTF 文件 (.wtf) 

/**
 * 使用jacob进行Word文档格式互转(例:doc2docx、docx2doc)
 * 
 * @author Harley Hong
 * @created 2017 /08/09 16:09:32
 */
public class DocFmtConvert {
	private static final int wdFormatPDF = 17;
	private static final int xlTypePDF = 0;
	private static final int ppSaveAsPDF = 32;
	/**
	 * doc格式
	 */
	public static final int DOC_FMT = 0;
	/**
	 * docx格式
	 */
	public static final int DOCX_FMT = 12;

	/**
	 * 描述 The entry point of application.
	 * 
	 * @param args the input arguments
	 * @author Harley Hong
	 * @created 2017 /08/09 16:14:44
	 */
	public static void main(String[] args) {
		try {
			System.out.println(System.getProperty("os.name"));
			wps2PDF("d:\\4.doc", "d:\\4.pdf");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据格式类型转换doc文件
	 * 
	 * @param srcPaththe doc path 源文件
	 * @param descPath   the docx path 目标文件
	 * @param fmtthe     fmt 所转格式
	 * @return the file
	 * @throws Exception the exception
	 * @author Harley Hong
	 * @created 2017 /08/09 16:14:07 Convert docx 2 doc file.
	 */
	public static void convertDocFmt(String srcPath, String desPath, int fmt) {
		ComThread.InitSTA();
		ActiveXComponent app = new ActiveXComponent("Word.Application");
		try {
			// 文档隐藏时进行应用操作
			app.setProperty("Visible", new Variant(false));// word不可见
			// app.setProperty("AutomationSecurity", new Variant(3)); // 禁用宏
			// 实例化模板Document对象
			Dispatch document = app.getProperty("Documents").toDispatch();
			// 打开Document进行另存为操作
			Dispatch doc = Dispatch.invoke(document, "Open", Dispatch.Method,
					new Object[] { srcPath, new Variant(true), new Variant(true) }, new int[1]).toDispatch();
			Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] { desPath, new Variant(fmt) }, new int[1]);
			Dispatch.call(doc, "Close", new Variant(false));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 释放线程与ActiveXComponent
			app.invoke("Quit", new Variant[] {});
			app.safeRelease();
			ComThread.Release();
		}
	}

	public static void word2PDF(String inputFile, String pdfFile) {
		ActiveXComponent app = null;
		Dispatch doc = null;
		try {
			ComThread.InitSTA();
			app = new ActiveXComponent("Word.Application"); // 打开word应用程序
			app.setProperty("Visible", false); // 设置word不可见
			// app.setProperty("AutomationSecurity", new Variant(3)); // 禁用宏
			Dispatch docs = app.getProperty("Documents").toDispatch(); // 获得word中所有打开的文档,返回Documents对象
			// 调用Documents对象中Open方法打开文档，并返回打开的文档对象Document
			doc = Dispatch.call(docs, "Open", inputFile, false, true).toDispatch();
			Dispatch.call(doc, "ExportAsFixedFormat", pdfFile, wdFormatPDF // word保存为pdf格式宏，值为17
			);
		} catch (ComFailException e) {

		} catch (Exception e) {

		} finally {
			if (doc != null) {
				Dispatch.call(doc, "Close", false); // 关闭文档
			}
			if (app != null) {
				app.invoke("Quit", 0); // 关闭word应用程序
				app.safeRelease();
			}
			ComThread.Release();
		}
	}

	public static void excel2PDF(String inputFile, String pdfFile) {
		ActiveXComponent app = null;
		Dispatch excel = null;
		try {
			ComThread.InitSTA();
			app = new ActiveXComponent("Excel.Application");
			app.setProperty("Visible", false);
			Dispatch excels = app.getProperty("Workbooks").toDispatch();
			excel = Dispatch.call(excels, "Open", inputFile, false, true).toDispatch();
			Dispatch.call(excel, "ExportAsFixedFormat", xlTypePDF, pdfFile);
		} catch (ComFailException e) {

		} catch (Exception e) {

		} finally {
			if (excel != null) {
				Dispatch.call(excel, "Close", false);
			}
			if (app != null) {
				app.invoke("Quit");
				app.safeRelease();
			}
			ComThread.Release();
		}
	}

	public static void ppt2PDF(String inputFile, String pdfFile) {
		ActiveXComponent app = null;
		Dispatch ppt = null;
		try {
			ComThread.InitSTA();
			app = new ActiveXComponent("PowerPoint.Application");
			Dispatch ppts = app.getProperty("Presentations").toDispatch();
			ppt = Dispatch.call(ppts, "Open", inputFile, true, // ReadOnly
					true, // Untitled指定文件是否有标题
					false// WithWindow指定文件是否可见
			).toDispatch();
			Dispatch.call(ppt, "SaveAs", pdfFile, ppSaveAsPDF);
		} catch (ComFailException e) {
			System.out.println(e.getMessage());
		} catch (Exception e) {

		} finally {
			if (ppt != null) {
				Dispatch.call(ppt, "Close");
			}
			if (app != null) {
				app.invoke("Quit");
				app.safeRelease();
			}
			ComThread.Release();
		}
	}

	public static void wps2PDF(String inputFile, String pdfFile) {
		ActiveXComponent wps = null;
		Dispatch doc = null;
		try {
			ComThread.InitSTA();
			wps = new ActiveXComponent("KWPS.Application");
			wps.setProperty("visible", new Variant(false));
			Dispatch docs = wps.getProperty("Documents").toDispatch();
			doc = Dispatch.call(docs, "Open", inputFile, false, true).toDispatch();
			Dispatch.call(doc, "SaveAs", pdfFile, 17);
			// ActiveXComponent doc =
			// wps.invokeGetComponent("Documents").invokeGetComponent("Open",
			// new Variant(sFile.getAbsolutePath()));
			// doc.invoke("ExportPdf", new Variant(tFile.getAbsolutePath()));
			// doc.invoke("Close");
			// doc.safeRelease();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (doc != null) {
				Dispatch.call(doc, "Close");
			}
			if (wps != null) {
				wps.invoke("Quit", 0);
				wps.safeRelease();
			}
			ComThread.Release();
		}
	}

	public static void img2PDF(String inputFile, String pdfFile) {
		Document doc = new Document(PageSize.A4, 20, 20, 20, 20);
		try {
			PdfWriter.getInstance(doc, new FileOutputStream(pdfFile));
			doc.open();
			doc.newPage();
			Image img = Image.getInstance(inputFile);
			float heigth = img.getHeight();
			float width = img.getWidth();
			int percent = getPercent(heigth, width);
			img.setAlignment(Image.MIDDLE);
			img.scalePercent(percent + 3);// 表示是原来图像的比例;
			doc.add(img);
			doc.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		File mOutputPdfFile = new File(pdfFile);
		if (!mOutputPdfFile.exists()) {
			mOutputPdfFile.deleteOnExit();
			return;
		}
	}

	public static int getPercent(float h, float w) {
		int p = 0;
		float p2 = 0.0f;
		p2 = 530 / w * 100;
		p = Math.round(p2);
		return p;
	}

	public static void wordConvertPDF(InputStream ins, OutputStream outs) throws Exception {
		wordConvertPDF(ins, outs, ".doc");
	}

	public static void wordConvertPDF(InputStream ins, OutputStream outs, String extname) throws Exception {
		String tempdir = System.getProperty("java.io.tmpdir");
		File sfile = new File(tempdir + File.separator + IDUtils.getGUID() + extname);
		File dfile = new File(tempdir + File.separator + IDUtils.getGUID() + ".pdf");
		FileOutputStream out = new FileOutputStream(sfile);
		byte[] arrayOfByte = new byte[2048];
		try {
			int i;
			while ((i = ins.read(arrayOfByte)) != -1)
				out.write(arrayOfByte, 0, i);
		} finally {
			if (out != null) {
				out.close(); // 关闭输出流
			}
		}
		try {
			wps2PDF(sfile.getAbsolutePath(), dfile.getAbsolutePath());
		} finally {
			try {
				sfile.delete();
			} catch (Exception e) {
			}
		}
		InputStream bins = new FileInputStream(dfile);
		try {
			int i;
			while ((i = bins.read(arrayOfByte)) != -1)
				outs.write(arrayOfByte, 0, i);
		}catch (Exception e) {
		} finally {
			try {
				bins.close();
			} catch (Exception e) {
			}
			try {
				dfile.delete();
			} catch (Exception e) {
			}
		}
	}

	public static void excelConvertPDF(InputStream ins, OutputStream outs, String extname) throws Exception {
		String tempdir = System.getProperty("java.io.tmpdir");
		File sfile = new File(tempdir + File.separator + IDUtils.getGUID() + extname);
		File dfile = new File(tempdir + File.separator + IDUtils.getGUID() + ".pdf");
		FileOutputStream out = new FileOutputStream(sfile);
		byte[] arrayOfByte = new byte[2048];
		try {
			int i;
			while ((i = ins.read(arrayOfByte)) != -1)
				out.write(arrayOfByte, 0, i);
		} finally {
			if (out != null) {
				out.close(); // 关闭输出流
			}
		}
		try {
			excel2PDF(sfile.getAbsolutePath(), dfile.getAbsolutePath());
		} finally {
			try {
				sfile.delete();
			} catch (Exception e) {
			}
		}
		InputStream bins = new FileInputStream(dfile);
		try {
			int i;
			while ((i = bins.read(arrayOfByte)) != -1)
				outs.write(arrayOfByte, 0, i);
		}catch (Exception e) {
		} finally {
			try {
				bins.close();
			} catch (Exception e) {
			}
			try {
				dfile.delete();
			} catch (Exception e) {
			}
		}
	}

	public static void pptConvertPDF(InputStream ins, OutputStream outs, String extname) throws Exception {
		String tempdir = System.getProperty("java.io.tmpdir");
		File sfile = new File(tempdir + File.separator + IDUtils.getGUID() + extname);
		File dfile = new File(tempdir + File.separator + IDUtils.getGUID() + ".pdf");
		FileOutputStream out = new FileOutputStream(sfile);
		byte[] arrayOfByte = new byte[2048];
		try {
			int i;
			while ((i = ins.read(arrayOfByte)) != -1)
				out.write(arrayOfByte, 0, i);
		} finally {
			if (out != null) {
				out.close(); // 关闭输出流
			}
		}
		try {
			ppt2PDF(sfile.getAbsolutePath(), dfile.getAbsolutePath());
		} finally {
			try {
				sfile.delete();
			} catch (Exception e) {
			}
		}
		InputStream bins = new FileInputStream(dfile);
		try {
			int i;
			while ((i = bins.read(arrayOfByte)) != -1)
				outs.write(arrayOfByte, 0, i);
		}catch (Exception e) {
		} finally {
			try {
				bins.close();
			} catch (Exception e) {
			}
			try {
				dfile.delete();
			} catch (Exception e) {
			}
		}
	}

	/*
	 * doc转pdf 由于doc直接转pdf效果太差 用docx做一次跳板，现将doc转docx再用docx转pdf
	 */
	public static void docConvertPDF(InputStream ins, OutputStream outs) throws Exception {
		String tempdir = System.getProperty("java.io.tmpdir");
		File sfile = new File(tempdir + File.separator + IDUtils.getGUID() + ".doc");
		File dfile = new File(tempdir + File.separator + IDUtils.getGUID() + ".docx");
		FileOutputStream out = new FileOutputStream(sfile);
		byte[] arrayOfByte = new byte[2048];
		try {
			int i;
			while ((i = ins.read(arrayOfByte)) != -1)
				out.write(arrayOfByte, 0, i);
		} finally {
			if (out != null) {
				out.close(); // 关闭输出流
			}
		}
		try {
			convertDocFmt(sfile.getAbsolutePath(), dfile.getAbsolutePath(), DOCX_FMT);
		} finally {
			try {
				sfile.delete();
			} catch (Exception e) {
			}
		}
		InputStream bins = new FileInputStream(dfile);
		try {
			Converter converter = new DocxToPDFConverter(bins, outs, false, false);
			converter.convert();
		} finally {
			try {
				bins.close();
			} catch (Exception e) {
			}
			try {
				dfile.delete();
			} catch (Exception e) {
			}
		}
	}

	public static void wpsConvertPDF(InputStream ins, OutputStream outs) throws Exception {
		String tempdir = System.getProperty("java.io.tmpdir");
		File sfile = new File(tempdir + File.separator + IDUtils.getGUID() + ".wps");
		File dfile = new File(tempdir + File.separator + IDUtils.getGUID() + ".pdf");
		FileOutputStream out = new FileOutputStream(sfile);
		byte[] arrayOfByte = new byte[2048];
		try {
			int i;
			while ((i = ins.read(arrayOfByte)) != -1)
				out.write(arrayOfByte, 0, i);
		} finally {
			if (out != null) {
				out.close(); // 关闭输出流
			}
		}
		try {
			wps2PDF(sfile.getAbsolutePath(), dfile.getAbsolutePath());
		} finally {
			try {
				sfile.delete();
			} catch (Exception e) {
			}
		}
		InputStream bins = new FileInputStream(dfile);
		try {
			int i;
			while ((i = bins.read(arrayOfByte)) != -1)
				outs.write(arrayOfByte, 0, i);
		} catch (Exception e) {
		} finally {
			try {
				bins.close();
			} catch (Exception e) {
			}
			try {
				dfile.delete();
			} catch (Exception e) {
			}
		}
	}
}
