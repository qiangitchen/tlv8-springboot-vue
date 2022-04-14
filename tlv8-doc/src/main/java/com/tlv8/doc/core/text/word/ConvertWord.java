package com.tlv8.doc.core.text.word;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class ConvertWord {
	public static boolean WordtoHtml(String s, String s1) {
		ComThread.InitSTA();
		ActiveXComponent activexcomponent = new ActiveXComponent("Word.Application");
		String s2 = s;
		String s3 = s1;
		boolean flag = false;
		try {
			activexcomponent.setProperty("Visible", new Variant(false));
			Dispatch dispatch = activexcomponent.getProperty("Documents").toDispatch();
			Dispatch dispatch1 = Dispatch.invoke(dispatch, "Open", 1, new Object[] { s2, new Variant(false), new Variant(true) }, new int[1])
					.toDispatch();
			Dispatch.invoke(dispatch1, "SaveAs", 1, new Object[] { s3, new Variant(8) }, new int[1]);
			Variant variant = new Variant(false);
			Dispatch.call(dispatch1, "Close", variant);
			flag = true;
		} catch (Exception exception) {
			System.out.println(s);
			exception.printStackTrace();
		} finally {
			activexcomponent.invoke("Quit", new Variant[0]);
			ComThread.Release();
			ComThread.quitMainSTA();
		}
		return flag;
	}

	public static boolean PPttoHtml(String s, String s1) {
		ComThread.InitSTA();
		ActiveXComponent activexcomponent = new ActiveXComponent("PowerPoint.Application");
		String s2 = s;
		String s3 = s1;
		boolean flag = false;
		try {
			Dispatch dispatch = activexcomponent.getProperty("Presentations").toDispatch();
			Dispatch dispatch1 = Dispatch.call(dispatch, "Open", s2, new Variant(-1), new Variant(-1), new Variant(0)).toDispatch();
			Dispatch.call(dispatch1, "SaveAs", s3, new Variant(12));
			Dispatch.call(dispatch1, "Close");
			flag = true;
		} catch (Exception exception) {
			System.out.println("|||" + exception.toString());
		} finally {
			activexcomponent.invoke("Quit", new Variant[0]);
			ComThread.Release();
			ComThread.quitMainSTA();
		}
		return flag;
	}

	public static boolean ExceltoHtml(String s, String s1) {
		ComThread.InitSTA();
		ActiveXComponent activexcomponent = new ActiveXComponent("Excel.Application");
		String s2 = s;
		String s3 = s1;
		boolean flag = false;
		try {
			activexcomponent.setProperty("Visible", new Variant(false));
			Dispatch dispatch = activexcomponent.getProperty("Workbooks").toDispatch();
			Dispatch dispatch1 = Dispatch.invoke(dispatch, "Open", 1, new Object[] { s2, new Variant(false), new Variant(true) }, new int[1])
					.toDispatch();
			Dispatch.call(dispatch1, "SaveAs", s3, new Variant(44));
			Variant variant = new Variant(false);
			Dispatch.call(dispatch1, "Close", variant);
			flag = true;
		} catch (Exception exception) {
			System.out.println("|||" + exception.toString());
		} finally {
			activexcomponent.invoke("Quit", new Variant[0]);
			ComThread.Release();
			ComThread.quitMainSTA();
		}
		return flag;
	}
	
	public static void main(String []args){
		WordtoHtml("d:\\test.docx", "d:\\test.html");
	}
}
