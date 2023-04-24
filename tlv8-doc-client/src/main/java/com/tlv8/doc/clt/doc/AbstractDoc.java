package com.tlv8.doc.clt.doc;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.methods.multipart.PartSource;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.tlv8.doc.clt.pojo.SaDocnode;

/**
 * 
 */
public class AbstractDoc extends SaDocnode {
	private static final long serialVersionUID = 5265471957103685278L;
	protected DocDBHelper docDBHelper;

	private String commentFileContent;

	public AbstractDoc(DocDBHelper docDBHelper) {
		this.docDBHelper = docDBHelper;
	}

	protected String getHost() {
		return docDBHelper.queryDocHost();
	}

	private void upload(String host, Part[] parts) throws Exception {
		String url = host + "/repository/file/cache/upload" + "?" + DocUtils.getBizSecureParams();
		DocUtils.registHttps(url);
		HttpClient httpClient = new HttpClient();
		PostMethod postMethod = new PostMethod(DocUtils.addBsessionId(DocUtils.getUrlAssign(url)));
		MultipartRequestEntity multipartRequestEntity = new MultipartRequestEntity(parts, postMethod.getParams());
		postMethod.setRequestEntity(multipartRequestEntity);
		int statusCode = httpClient.executeMethod(postMethod);
		if (statusCode != HttpStatus.SC_OK) {
			throw new DocRTException("Failed to send request to DocServer: " + postMethod.getStatusLine());
		} else {
			InputStream is = postMethod.getResponseBodyAsStream();
			SAXReader reader = new SAXReader();
			Document responseDoc = null;
			try {
				responseDoc = reader.read(is);
				postMethod.releaseConnection();
			} catch (DocumentException e) {
				e.printStackTrace();
			}
			Element fe = responseDoc.getRootElement().element("file");
			setSkind(fe.attributeValue("mediatype"));
			setScachename(fe.attributeValue("file-name"));
			if (fe.attributeValue("fileSize") == null)
				setSsize(0d);
			else
				setSsize(Double.valueOf(fe.attributeValue("fileSize")));
		}
	}

	private void upload(String host, InputStream inputStream) throws Exception {
		String sDocName = getSdocname();
		InputStreamPartSource bps = new InputStreamPartSource(inputStream, sDocName);
		Part[] parts = { new FilePart("file", bps) };
		upload(host, parts);
	}

	private void upload(String host, File file) throws Exception {
		Part[] parts = { new FilePart("file", file) };
		upload(host, parts);
	}

	public void upload(boolean isHttps, InputStream inputStream) throws Exception {
		upload(getHost(), inputStream);
	}

	public void upload(boolean isHttps, File file) throws Exception {
		upload(getHost(), file);
	}

	private class InputStreamPartSource implements PartSource {
		private InputStream in = null;
		private String fileName = null;

		public InputStreamPartSource(InputStream in, String fileName) {
			this.in = in;
			this.fileName = fileName;
		}

		public InputStream createInputStream() throws IOException {
			return in;
		}

		public String getFileName() {
			return fileName;
		}

		public long getLength() {
			try {
				return this.in.available();
			} catch (IOException e) {
				e.printStackTrace();
				return -1;
			}
		}
	}

	/**
	 * 提交文件信息
	 * 
	 * @throws UnsupportedEncodingException
	 * @throws DocumentException
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public void commitFile() throws UnsupportedEncodingException, DocumentException, Exception {
		StringBuffer sb = new StringBuffer();
		sb.append("<data>");
		sb.append(createChangeLogItem());
		sb.append("</data>");
		String host = docDBHelper.queryDocHost();
		String url = host + "/repository/file/cache/commit";
		Document result = DocUtils.excutePostAction(url, new ByteArrayInputStream(sb.toString().getBytes("UTF-8")));
		List itemList = result.selectNodes("//item");
		for (Iterator localIterator2 = itemList.iterator(); localIterator2.hasNext();) {
			Object litem = localIterator2.next();
			Element item = (Element) litem;
			String docID = item.selectSingleNode("doc-id").getText();
			String fileID = item.selectSingleNode("file-id").getText();
			String docVersionID = item.selectSingleNode("doc-version-id").getText();
			this.setSid(docID);
			this.setSfileid(fileID);
			this.setSrevisioncachename(docVersionID);
		}
	}

	public String getCommentFileContent() {
		return commentFileContent;
	}

	public void setCommentFileContent(String commentFileContent) {
		this.commentFileContent = commentFileContent;
	}

	/**
	 * 创建修改参数
	 * 
	 * @return
	 */
	public StringBuffer createChangeLogItem() {
		StringBuffer result = new StringBuffer();
		result.append("<item>");
		result.append("<operation-type>new</operation-type>");
		result.append("<process></process>");
		result.append("<activity></activity>");
		result.append("<person>" + this.getSlastwriterfid() + "</person>");
		result.append("<person-name>" + this.getSlastwritername() + "</person-name>");
		result.append("<dept-name>" + DocUtils.getValue(getSlastwriterdeptname(), "") + "</dept-name>");
		result.append("<bill-id></bill-id>");
		result.append("<doc-id>" + getSid() + "</doc-id>");
		result.append("<version>" + String.valueOf(this.getVersion()) + "</version>");
		result.append("<file-id>" + DocUtils.getValue(this.getSfileid(), "") + "</file-id>");
		result.append("<doc-version-id>" + String.valueOf(this.getSdocliveversionid()) + "</doc-version-id>");
		result.append("<doc-name><![CDATA[" + this.getSdocname() + "]]></doc-name>");
		result.append("<kind>" + this.getSkind() + "</kind>");
		result.append("<size>" + String.valueOf(this.getSsize()) + "</size>");
		result.append("<parent-id>" + this.getSparentid() + "</parent-id>");
		result.append("<doc-path>/root</doc-path>");
		result.append("<doc-display-path>/文档中心</doc-display-path>");
		result.append("<description>" + DocUtils.getValue(this.getSdescription(), "") + "</description>");
		result.append("<classification>" + DocUtils.getValue(this.getSclassification(), "") + "</classification>");
		result.append("<keywords><![CDATA[" + DocUtils.getValue(this.getSkeywords(), "") + "]]></keywords>");
		result.append("<finish-time></finish-time>");
		result.append("<serial-number></serial-number>");
		result.append("<doc-type>document</doc-type>");
		result.append("<cache-name>" + this.getScachename() + "</cache-name>");
		result.append("<revision-cache-name>" + this.getSrevisioncachename() + "</revision-cache-name>");
		result.append("<comment-file-content><![CDATA[" + this.getCommentFileContent() + "]]></comment-file-content>");
		result.append("<link-id></link-id>");
		result.append("<access-record-id></access-record-id>");
		result.append("</item>");
		return result;
	}

	/**
	 * 创建删除参数
	 * 
	 * @return
	 */
	public StringBuffer createDeleteLogItem() {
		StringBuffer result = new StringBuffer();
		result.append("<item>");
		result.append("<operation-type>delete</operation-type>");
		result.append("<process></process>");
		result.append("<activity></activity>");
		result.append("<person>" + this.getSlastwriterfid() + "</person>");
		result.append("<person-name>" + this.getSlastwritername() + "</person-name>");
		result.append("<dept-name>" + DocUtils.getValue(this.getSlastwriterdeptname(), "") + "</dept-name>");
		result.append("<bill-id></bill-id>");
		result.append("<doc-id>" + this.getSid() + "</doc-id>");
		result.append("<version>" + String.valueOf(this.getVersion()) + "</version>");
		result.append("<file-id>" + DocUtils.getValue(this.getSfileid(), "") + "</file-id>");
		result.append("<doc-version-id>" + String.valueOf(this.getSdocliveversionid()) + "</doc-version-id>");
		result.append("<doc-name><![CDATA[" + this.getSdocname() + "]]></doc-name>");
		result.append("<kind>" + this.getSkind() + "</kind>");
		result.append("<size>" + String.valueOf(this.getSsize()) + "</size>");
		result.append("<parent-id>" + this.getSparentid() + "</parent-id>");
		result.append("<doc-path>/root</doc-path>");
		result.append("<doc-display-path>/文档中心</doc-display-path>");
		result.append("<description>" + DocUtils.getValue(this.getSdescription(), "") + "</description>");
		result.append("<classification>" + DocUtils.getValue(this.getSclassification(), "") + "</classification>");
		result.append("<keywords><![CDATA[" + DocUtils.getValue(this.getSkeywords(), "") + "]]></keywords>");
		result.append("<finish-time></finish-time>");
		result.append("<serial-number></serial-number>");
		result.append("<doc-type>document</doc-type>");
		result.append("<cache-name>" + this.getScachename() + "</cache-name>");
		result.append("<revision-cache-name>" + this.getSrevisioncachename() + "</revision-cache-name>");
		result.append("<comment-file-content><![CDATA[" + this.getCommentFileContent() + "]]></comment-file-content>");
		result.append("<link-id></link-id>");
		result.append("<access-record-id></access-record-id>");
		result.append("</item>");
		return result;
	}

}
