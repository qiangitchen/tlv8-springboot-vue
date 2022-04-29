package com.tlv8.doc.core.inter;

import java.util.List;
import java.util.Map;

@SuppressWarnings("rawtypes")
public interface IFileDeleter {

	Map deleteVersion(String docID, long version);

	List<Map> delete(String docID);
}
