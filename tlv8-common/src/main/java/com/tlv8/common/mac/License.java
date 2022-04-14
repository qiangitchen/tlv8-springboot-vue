package com.tlv8.common.mac;

import com.tlv8.common.mac.utils.CryptUtils;

public class License {
	public static String getMachineCode() {
		return CryptUtils.getMachineCode();
	}
}
