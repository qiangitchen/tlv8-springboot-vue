package com.tlv8.doc.controller.handlers;

public class SimpleFileDownloadHandler extends FileDownloadHandler {

	@Override
	public String getPathPattern() {
		return "/file/download/*";
	}

}
