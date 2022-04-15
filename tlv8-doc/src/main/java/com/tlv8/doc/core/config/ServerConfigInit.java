package com.tlv8.doc.core.config;

import java.io.IOException;
import java.io.InputStream;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import com.tlv8.doc.core.TransePath;

public class ServerConfigInit {

	public static void init() {
		String docDir = "/tlv8-doc/data/doc";
		InputStream is = null;
		try {
			SAXReader reader = new SAXReader();
			Resource resource = new ClassPathResource("doc.xml");
			is = resource.getInputStream();
			Document doc = reader.read(is);
			Element element = doc.getRootElement();
			Element DirEl = element.element("doc-dir");
			if (DirEl != null) {
				docDir = DirEl.getTextTrim();
			}
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
		TransePath.setBaseDocPath(docDir);
	}
}
