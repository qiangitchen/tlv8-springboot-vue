package com.tlv8.doc.controller.docs;

import java.io.InputStream;
import java.io.OutputStream;

import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

public class DocxToHTMLConverter extends Converter {

	public DocxToHTMLConverter(InputStream inStream, OutputStream outStream,
			boolean showMessages, boolean closeStreamsWhenComplete) {
		super(inStream, outStream, showMessages, closeStreamsWhenComplete);
	}

	@Override
	public void convert() throws Exception {
		loading();

		XWPFDocument document = new XWPFDocument(inStream);

		XHTMLOptions options = XHTMLOptions.create();

		processing();
		XHTMLConverter.getInstance().convert(document, outStream, options);

		finished();

	}

}
