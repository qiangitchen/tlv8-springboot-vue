package com.tlv8.doc.clt.doc;

import java.io.ByteArrayInputStream;

public class Doc extends AbstractDoc {
	private static final long serialVersionUID = -376713417848199769L;

	public Doc(DocDBHelper docDBHelper) {
		super(docDBHelper);
	}

	public boolean deleteFile() {
		StringBuffer sb = new StringBuffer();
		sb.append("<data>");
		sb.append(createDeleteLogItem());
		sb.append("</data>");
		String host = docDBHelper.queryDocHost();
		String url = host + "/repository/file/cache/commit";
		try {
			DocUtils.excutePostAction(url, new ByteArrayInputStream(sb.toString().getBytes("UTF-8")));
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
