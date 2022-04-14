package com.tlv8.doc.controller.docs;

import java.awt.Color;

import java.io.InputStream;
import java.io.OutputStream;

import org.apache.poi.xwpf.converter.pdf.PdfConverter;
import org.apache.poi.xwpf.converter.pdf.PdfOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import com.lowagie.text.Font;
import com.lowagie.text.pdf.BaseFont;

import fr.opensagres.xdocreport.itext.extension.font.ITextFontRegistry;

public class DocxToPDFConverter extends Converter {

	private boolean isw;

	public DocxToPDFConverter(InputStream inStream, OutputStream outStream, boolean showMessages,
			boolean closeStreamsWhenComplete) {
		super(inStream, outStream, showMessages, closeStreamsWhenComplete);
		isw = isWin();
	}

	@Override
	public void convert() throws Exception {
		loading();

		XWPFDocument document = new XWPFDocument(inStream);

		PdfOptions options = PdfOptions.create();
		// 支持中文字体
		options.fontProvider(new ITextFontRegistry() {
			public Font getFont(String familyName, String encoding, float size, int style, Color color) {
				if (isChinese(familyName) && isw) {
					return ITextFontRegistry.getRegistry().getFont(familyName, encoding, size, style, color);
				}
				try {
					if ("Wingdings".equals(familyName)) {
						Resource fileRource = new ClassPathResource("Wingdings.ttf");
						String path = fileRource.getFile().getAbsolutePath();

						BaseFont bfChinese = BaseFont.createFont(path, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
						Font fontChinese = new Font(bfChinese, size, style, color);
						if (familyName != null)
							fontChinese.setFamily(familyName);
						return fontChinese;
					} else {
						Resource fileRource = new ClassPathResource("simsun.ttf");
						String path = fileRource.getFile().getAbsolutePath();

						BaseFont bfChinese = BaseFont.createFont(path, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
						Font fontChinese = new Font(bfChinese, size, style, color);
						if (familyName != null)
							fontChinese.setFamily(familyName);
						return fontChinese;
					}
				} catch (Throwable e) {
					return ITextFontRegistry.getRegistry().getFont(familyName, encoding, size, style, color);
				}
			}

		});

		processing();
		PdfConverter.getInstance().convert(document, outStream, options);

		finished();

	}

}
