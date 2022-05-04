package com.tlv8.api.pay.alipay.conf;

import com.alipay.api.*;
import com.tlv8.api.pay.wxpay.conf.WeixinPayConfig;
import io.netty.util.CharsetUtil;

import java.io.File;

public class AliPayConfig {

    public static String appid = "";
    public static String privateKey = "";
    public static String notifyUrl = "https://host/api/pay/notify/AliPayNotify";

    public static String alipayPublicCertPath = "";

    public static AlipayClient getAlipayClient() throws AlipayApiException {
        //构造client
        CertAlipayRequest certAlipayRequest = new CertAlipayRequest();
        //设置网关地址
        certAlipayRequest.setServerUrl("https://openapi.alipay.com/gateway.do");
        //设置应用Id
        certAlipayRequest.setAppId(appid);
        //设置应用私钥
        certAlipayRequest.setPrivateKey(privateKey);
        //设置请求格式，固定值json
        certAlipayRequest.setFormat("json");
        //设置字符集
        certAlipayRequest.setCharset(String.valueOf(CharsetUtil.UTF_8));
        //设置签名类型
        certAlipayRequest.setSignType(AlipayConstants.SIGN_TYPE_RSA2);

        //设置应用公钥证书路径
        File pubf = new File(WeixinPayConfig.class.getResource("/com/tlv8/pay/alicer/apiclient_cert.p12").getPath());
        certAlipayRequest.setCertPath(pubf.getAbsolutePath());
        //设置支付宝公钥证书路径
        certAlipayRequest.setAlipayPublicCertPath(alipayPublicCertPath);
        //设置支付宝根证书路径
        File rootf = new File(WeixinPayConfig.class.getResource("/com/tlv8/pay/alicer/apiclient_rcert.p12").getPath());
        certAlipayRequest.setRootCertPath(rootf.getAbsolutePath());
        //构造client
        return new DefaultAlipayClient(certAlipayRequest);
    }

}
