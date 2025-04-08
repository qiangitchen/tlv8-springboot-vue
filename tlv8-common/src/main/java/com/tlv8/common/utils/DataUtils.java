package com.tlv8.common.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.nio.ByteBuffer;

/**
 * 数据类型转换公用类
 * 
 * @author 陈乾
 *
 */
public class DataUtils {
	private static final char[] HEX_CHAR = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E',
			'F' };

	public static byte[] intToByteArray(int i) throws Exception {
		ByteArrayOutputStream buf = new ByteArrayOutputStream();
		DataOutputStream dos = new DataOutputStream(buf);
		dos.writeInt(i);
		byte[] b = buf.toByteArray();
		dos.close();
		buf.close();
		return b;
	}

	public static int ByteArrayToInt(byte b[]) throws Exception {
		ByteArrayInputStream buf = new ByteArrayInputStream(b);
		DataInputStream dis = new DataInputStream(buf);
		return dis.readInt();
	}

	public static short byteArrayToShort(byte[] bytes) {
		if (bytes.length != 2) {
			throw new IllegalArgumentException("Byte array length must be 2");
		}
		ByteBuffer buffer = ByteBuffer.allocate(2);
		buffer.put(bytes);
		buffer.flip();
		return buffer.getShort();
	}

	/**
	 * byte[]转int
	 * 
	 * @param res
	 * @return int
	 */
	public static int byte2int(byte[] res) {
		if (res.length == 1) {
			return res[0];
		}
		if (res.length == 2) {
			return (res[0] & 0xff) | ((res[1] << 8) & 0xff00);
		}
		// 一个byte数据左移24位变成0x??000000，再右移8位变成0x00??0000
		int targets = (res[0] & 0xff) | ((res[1] << 8) & 0xff00) // | 表示安位或
				| ((res[2] << 24) >>> 8) | (res[3] << 24);
		return targets;
	}

	public static long byteArrayToLong(byte[] bytes) {
		ByteBuffer buffer = ByteBuffer.wrap(bytes);
		return buffer.getLong();
	}

	/**
	 * int转byte[2]
	 * 
	 * @param paramInt
	 * @return
	 */
	public static byte[] int2bytes(int paramInt) {
		byte[] arrayOfByte = new byte[2];
		arrayOfByte[0] = (byte) paramInt;
		arrayOfByte[1] = (byte) (paramInt >> 8);
		return arrayOfByte;
	}

	/**
	 * int转byte[4]
	 * 
	 * @param paramInt
	 * @return
	 */
	public static byte[] int4bytes(int paramInt) {
		byte[] arrayOfByte = new byte[4];
		arrayOfByte[0] = (byte) paramInt;
		arrayOfByte[1] = (byte) (paramInt >> 8);
		arrayOfByte[2] = (byte) (paramInt >> 16);
		arrayOfByte[3] = (byte) (paramInt >> 24);
		return arrayOfByte;
	}

	/**
	 * char转byte[8]
	 * 
	 * @param paramChar
	 * @return
	 */
	public static byte[] char2bytes(char paramChar) {
		byte[] arrayOfByte = new byte[8];
		arrayOfByte[0] = (byte) (paramChar >>> '\b');
		arrayOfByte[1] = (byte) paramChar;
		return arrayOfByte;
	}

	/**
	 * byte[]转十六进制
	 * 
	 * @param bytes
	 * @return
	 */
	public static String bytesTohex(byte[] bytes) {
		char[] buf = new char[bytes.length * 2];
		int a = 0;
		int index = 0;
		for (byte b : bytes) {
			if (b < 0) {
				a = 256 + b;
			} else {
				a = b;
			}
			buf[index++] = HEX_CHAR[a / 16];
			buf[index++] = HEX_CHAR[a % 16];
		}
		return new String(buf);
	}

	/**
	 * 十六进制转byte[]
	 * 
	 * @param hex
	 * @return
	 */
	public static byte[] hexTobytes(String str) {
		if (str == null || str.trim().equals("")) {
			return new byte[0];
		}
		byte[] bytes = new byte[str.length() / 2];
		for (int i = 0; i < str.length() / 2; i++) {
			String subStr = str.substring(i * 2, i * 2 + 2);
			bytes[i] = (byte) Integer.parseInt(subStr, 16);
		}
		return bytes;
	}

	/**
	 * @功能: BCD码转为10进制串(阿拉伯数据)
	 * @参数: BCD码
	 * @结果: 10进制串
	 */
	public static String bcd2Str(byte[] bcd) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < bcd.length; i++) {
			int high = (bcd[i] & 0xf0) >>> 4;
			int low = bcd[i] & 0x0f;
			sb.append((char) (high + '0')).append((char) (low + '0'));
		}
		return sb.toString();
	}

	/**
	 * @功能: 10进制串转为BCD码
	 * @参数: 10进制串
	 * @结果: BCD码
	 */
	public static byte[] str2Bcd(String asc) {
		int len = asc.length();
		int mod = len % 2;
		if (mod != 0) {
			asc = "0" + asc;
			len = asc.length();
		}
		byte abt[] = new byte[len];
		if (len >= 2) {
			len = len / 2;
		}
		byte bbt[] = new byte[len];
		abt = asc.getBytes();
		int j, k;
		for (int p = 0; p < asc.length() / 2; p++) {
			if ((abt[2 * p] >= '0') && (abt[2 * p] <= '9')) {
				j = abt[2 * p] - '0';
			} else if ((abt[2 * p] >= 'a') && (abt[2 * p] <= 'z')) {
				j = abt[2 * p] - 'a' + 0x0a;
			} else {
				j = abt[2 * p] - 'A' + 0x0a;
			}
			if ((abt[2 * p + 1] >= '0') && (abt[2 * p + 1] <= '9')) {
				k = abt[2 * p + 1] - '0';
			} else if ((abt[2 * p + 1] >= 'a') && (abt[2 * p + 1] <= 'z')) {
				k = abt[2 * p + 1] - 'a' + 0x0a;
			} else {
				k = abt[2 * p + 1] - 'A' + 0x0a;
			}
			int a = (j << 4) + k;
			byte b = (byte) a;
			bbt[p] = b;
		}
		return bbt;
	}

	/**
	 * HHmm时间格式转byte[]
	 * 
	 * @param str
	 * @return
	 */
	public static byte[] hmstr2Bcd(String str) {
		String hh = str.substring(0, 2);
		String mm = str.substring(2, 4);
		int hhi = Integer.parseInt(hh, 10);
		int mmi = Integer.parseInt(mm, 10);
		byte[] res = new byte[2];
		res[0] = (byte) hhi;
		res[1] = (byte) mmi;
		return res;
	}

	/**
	 * 去掉byte[]中填充的0 转为String
	 * 
	 * @param buffer
	 * @return
	 */
	public static String byteToStr(byte[] buffer) {
		try {
			int length = 0;
			for (int i = 0; i < buffer.length; ++i) {
				if (buffer[i] == 0) {
					length = i;
					break;
				}
			}
			if (length == 0) {
				return "";
			}
			return new String(buffer, 0, length, "UTF-8");
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * byte[]转float
	 * 
	 * @param bytes
	 * @return
	 */
	public static float byteArrayToFloat(byte[] bytes) {
		ByteBuffer buffer = ByteBuffer.wrap(bytes);
		return buffer.getFloat();
	}

	public static int sumByte(byte[] data, int ln) {
		int s = 0;
		for (int i = 0; i < ln; i++) {
			s += data[i];
		}
		return s;
	}
	
	public static byte[] sumBytea(byte[] data, int ln) {
		int s = sumByte(data, ln);
		return int2bytes(s);
	}

}
