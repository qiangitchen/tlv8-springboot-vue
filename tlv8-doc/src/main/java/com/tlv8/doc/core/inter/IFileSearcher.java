package com.tlv8.doc.core.inter;

import java.util.List;

import com.tlv8.doc.core.io.atr.DocQueryParam;
import com.tlv8.doc.core.io.atr.FileAttribute;

public interface IFileSearcher {
	public List<FileAttribute> searchByParam(DocQueryParam param);

	public List<FileAttribute> searchByKeyWords(String keywords)
			throws Exception;
}
