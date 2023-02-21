package com.tlv8.doc.core.text.ppt;
import java.io.File;

import com.tlv8.doc.core.text.TextReader;
import org.apache.poi.hslf.extractor.QuickButCruddyTextExtractor;

public class PPTReader extends TextReader {

	public PPTReader(File file, String extName) {
		super(file, extName);
	}

	@Override
	public String readAll() {
		String result = "";
		try {
			result = new QuickButCruddyTextExtractor(file.getAbsolutePath()).getTextAsString();
		}catch (Exception e){
		}
		return result;
	}

}
