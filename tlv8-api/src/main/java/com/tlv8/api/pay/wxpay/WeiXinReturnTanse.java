package com.tlv8.api.pay.wxpay;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tlv8.api.pay.wxpay.conf.WeixinPayConfig;
import com.tlv8.api.utils.HttpClientUtil;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class WeiXinReturnTanse {

    @SuppressWarnings("unchecked")
	public static Map<String, String> pase(InputStream input, String charset) {
        Map<String, String> map = new HashMap<String, String>();
        try {
            String res = HttpClientUtil.readData(input, charset);
            Document document = DocumentHelper.parseText(res);
            Element element = document.getRootElement();
            List<Element> elist = element.elements();
            for (int i = 0; i < elist.size(); i++) {
                map.put(elist.get(i).getName(), elist.get(i).getText());
            }
        } catch (Exception e) {
        }
        return map;
    }

    public static boolean verify(Map<String, String> params) {
        return WeixinPayConfig.appid.equals(params.get("appid"));
    }

}
