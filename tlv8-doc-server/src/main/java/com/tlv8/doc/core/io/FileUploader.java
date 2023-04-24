package com.tlv8.doc.core.io;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

import com.tlv8.common.utils.MD5Util;
import com.tlv8.doc.core.TransePath;
import com.tlv8.doc.core.inter.IDoc;
import com.tlv8.doc.core.io.centent.FileIOContent;
import com.tlv8.doc.core.utils.FileExtArray;

public class FileUploader {
	/*
	 * 文件上传{将文件流写入指定的位置}
	 */
	public static void upload(InputStream inputstream, String fileID, String docPath) throws Exception {
		String dirPath = TransePath.docPath2FilePath(docPath);
		File fileDir = new File(dirPath);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		File file = new File(dirPath, MD5Util.encode(fileID));
		if (!file.exists()) {
			file.createNewFile();
		}
		FileOutputStream fos = new FileOutputStream(file);
		byte[] b = new byte[1024];
		int n = 0;
		while ((n = inputstream.read(b)) != -1) {
			fos.write(b, 0, n);
		}
		fos.close();
		inputstream.close();
	}

	public static FileIOContent fileUpload(MultipartFile file, IDoc doc) throws Exception {
		FileIOContent content = new FileIOContent();
		String fileID = doc.getNewDocID();
		String docPath = doc.getNewDocPath();
		content.setFileID(fileID);
		content.setFilePath(docPath);
		String path = TransePath.docPath2FilePath(docPath);
		File fileDir = new File(path);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		String filename = file.getOriginalFilename();
		content.setFileName(filename);
		content.setFileSize(file.getSize());
		String contentType = file.getContentType();
		if (contentType.indexOf(";") > 0) {
			contentType = contentType.substring(0, contentType.indexOf(";"));
		}
		content.setFileType(contentType);
		content.setExtName(FileExtArray.getExtName(filename));
		File ofile = new File(path, MD5Util.encode(fileID));
		if (!ofile.exists()) {
			ofile.createNewFile();
		}
		OutputStream out = new FileOutputStream(ofile);
		InputStream in = file.getInputStream();
		int length = 0;
		byte[] buf = new byte[1024];
		while ((length = in.read(buf)) != -1) {
			out.write(buf, 0, length);
		}
		in.close();
		out.close();
		return content;
	}

	public static void ChangeFileID(String nfileID, String ofileID, String docPath) {
		String dirPath = TransePath.docPath2FilePath(docPath);
		File file = new File(dirPath, MD5Util.encode(ofileID));
		File nfile = new File(dirPath, MD5Util.encode(nfileID));
		if (file.exists()) {
			file.renameTo(nfile);
		}
	}
}
