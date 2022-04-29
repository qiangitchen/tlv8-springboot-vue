package com.tlv8.api.pay.wxpay.conf;

import java.io.File;

import com.github.binarywang.wxpay.config.WxPayConfig;

public class WeixinPayConfig {
    public static String appid = "";// 公众账号ID/小程序ID

    public static String mch_id = "";// 商户号

    public static String notify_url = "https://host/api/pay/notify/WeiXinPayNotify";// http/https:// + host + /api/pay/notify/WeiXinPayNotify
    //public static String trade_type = "JSAPI";// JSAPI--JSAPI支付（或小程序支付）、NATIVE--Native支付、APP--app支付，MWEB--H5支付

    public static String key = "";// 微信商户平台(pay.weixin.qq.com)-->账户中心-->账户设置-->API安全-->设置API密钥


    public static WxPayConfig getWxPay() {
        WxPayConfig payConfig = new WxPayConfig();
        payConfig.setAppId(appid);
        payConfig.setMchId(mch_id);
        payConfig.setMchKey(key);
        File f = new File(WeixinPayConfig.class.getResource("/com/tlv8/pay/wxcer/apiclient_cert.p12").getPath());
        payConfig.setKeyPath(f.getAbsolutePath());
        return payConfig;
    }
}
