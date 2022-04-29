package com.tlv8.doc.core.inter;

import java.io.IOException;

public interface IFileReader {
	String getCharset() throws IOException;

	String readAll();
}
