package com.tlv8.api.pay.alipay;

import com.alipay.api.domain.AlipayTradePagePayModel;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.tlv8.api.pay.alipay.conf.AliPayConfig;
import com.tlv8.api.pay.enums.PayType;
import com.tlv8.common.utils.IDUtils;

import java.util.Objects;

public class AliPay {

    //返回页面地址
    public String returnUrl = "";

    //支付订单号
    public String payno = IDUtils.getGUID();// 随机字符串

    public String body = "测试";//订单描述

    public String payAmount = "0.01";//支付金额

    public Object getActionResult(PayType payType) throws Exception {
        if (Objects.equals(payType, PayType.ALIPAY)) {
            //创建API对应的request
            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();

            //在公共参数中设置回跳和通知地址
            alipayRequest.setNotifyUrl(AliPayConfig.notifyUrl);
            alipayRequest.setReturnUrl(returnUrl);
            AlipayTradePagePayModel alipayTradePagePayModel = new AlipayTradePagePayModel();
            alipayTradePagePayModel.setOutTradeNo(payno);
            alipayTradePagePayModel.setBody(body);
            alipayTradePagePayModel.setSubject(body);
            alipayTradePagePayModel.setTotalAmount(payAmount);
            alipayTradePagePayModel.setProductCode("FAST_INSTANT_TRADE_PAY");
            alipayRequest.setBizModel(alipayTradePagePayModel);
            return AliPayConfig.getAlipayClient().pageExecute(alipayRequest).getBody();
        }else if (Objects.equals(payType, PayType.ALIPAY_H5)) {
            AlipayTradeWapPayRequest alipayRequest = new AlipayTradeWapPayRequest();
            alipayRequest.setNotifyUrl(AliPayConfig.notifyUrl);
            alipayRequest.setReturnUrl(returnUrl);

            AlipayTradeWapPayModel alipayTradeWapPayModel = new AlipayTradeWapPayModel();
            alipayTradeWapPayModel.setOutTradeNo(payno);
            alipayTradeWapPayModel.setSubject(body);
            alipayTradeWapPayModel.setTotalAmount(payAmount);
            alipayTradeWapPayModel.setProductCode("QUICK_WAP_PAY");
            alipayRequest.setBizModel(alipayTradeWapPayModel);
            return AliPayConfig.getAlipayClient().pageExecute(alipayRequest).getBody();
        }
        return null;
    }

    public static void main(String[] args) {
        try {
            String re = (String)new AliPay().getActionResult(PayType.ALIPAY_H5);
            System.out.println(re);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
