package com.tlv8.doc.core.config;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.tlv8.doc.core.TransePath;

public class ServerConfigInit {

	public static void init() {
		String docDir = "/tlv8-doc/data/doc";
		try {
			SAXReader reader = new SAXReader();
			Document doc = reader.read(ServerConfigInit.class.getResourceAsStream("doc.xml"));
			Element element = doc.getRootElement();
			Element DirEl = element.element("doc-dir");
			if (DirEl != null) {
				docDir = DirEl.getTextTrim();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		TransePath.setBaseDocPath(docDir);
	}
}
