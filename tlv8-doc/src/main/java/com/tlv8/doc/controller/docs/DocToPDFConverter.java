package com.tlv8.doc.controller.docs;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;

import org.docx4j.Docx4J;
import org.docx4j.convert.in.Doc;
import org.docx4j.convert.out.FOSettings;
import org.docx4j.fonts.IdentityPlusMapper;
import org.docx4j.fonts.Mapper;
import org.docx4j.fonts.PhysicalFont;
import org.docx4j.fonts.PhysicalFonts;
import org.docx4j.jaxb.Context;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.wml.RFonts;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class DocToPDFConverter extends Converter {

	/**
	 * doc格式
	 */
	protected static final int DOC_FMT = 0;
	/**
	 * docx格式
	 */
	protected static final int DOCX_FMT = 12;

	// 17:PDF 文件 (.pdf)
	protected static final int PDF_FMT = 17;

	public DocToPDFConverter(InputStream inStream, OutputStream outStream,
			boolean showMessages, boolean closeStreamsWhenComplete) {
		super(inStream, outStream, showMessages, closeStreamsWhenComplete);
	}

	@Override
	public void convert() throws Exception {
		loading();

		InputStream instream = inStream;

		processing();

		WordprocessingMLPackage wordMLPackage = getMLPackage(instream);
		Mapper fontMapper = new IdentityPlusMapper();
		String fontFamily = "SimSun";

		Resource fileRource = new ClassPathResource("simsun.ttf");
		PhysicalFonts.addPhysicalFont(fileRource.getURL());

		PhysicalFont simsunFont = PhysicalFonts.get(fontFamily);
		fontMapper.put(fontFamily, simsunFont);

		RFonts rfonts = Context.getWmlObjectFactory().createRFonts(); // 设置文件默认字体
		rfonts.setAsciiTheme(null);
		rfonts.setAscii(fontFamily);
		wordMLPackage.getMainDocumentPart().getPropertyResolver()
				.getDocumentDefaultRPr().setRFonts(rfonts);

		wordMLPackage.setFontMapper(fontMapper);
		FOSettings foSettings = Docx4J.createFOSettings();
		foSettings.setWmlPackage(wordMLPackage);
		Docx4J.toFO(foSettings, outStream, Docx4J.FLAG_EXPORT_PREFER_XSL);

		finished();
	}

	protected WordprocessingMLPackage getMLPackage(InputStream iStream)
			throws Exception {
		PrintStream originalStdout = System.out;

		// Disable stdout temporarily as Doc convert produces alot of output
		System.setOut(new PrintStream(new OutputStream() {
			public void write(int b) {
				// DO NOTHING
			}
		}));

		WordprocessingMLPackage mlPackage = Doc.convert(iStream);

		System.setOut(originalStdout);

		return mlPackage;
	}

}