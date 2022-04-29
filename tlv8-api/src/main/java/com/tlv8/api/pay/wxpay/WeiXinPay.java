package com.tlv8.api.pay.wxpay;

import java.util.Date;
import java.util.Objects;

import com.alibaba.fastjson.JSON;
import com.github.binarywang.wxpay.bean.order.WxPayMpOrderResult;
import com.github.binarywang.wxpay.bean.order.WxPayMwebOrderResult;
import com.github.binarywang.wxpay.bean.order.WxPayNativeOrderResult;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.constant.WxPayConstants;
import com.github.binarywang.wxpay.service.WxPayService;
import com.github.binarywang.wxpay.service.impl.WxPayServiceImpl;

import com.tlv8.api.pay.enums.PayType;
import com.tlv8.api.pay.wxpay.conf.WeixinPayConfig;
import com.tlv8.common.utils.IDUtils;

public class WeiXinPay {

    public String time_stamp = "" + new Date().getTime() / 1000;//
    // 时间戳(系统时间秒)
    public String nonce_str = IDUtils.getGUID();// 随机字符串
    public String product_id = "" + Math.round(Math.random() * 100000) + 1;// 商品ID(订单号)
    public String body = "测试";
    public int total_fee = 1;// 支付金额 {单位为【分】}
    public String openid = "";// 微信id
    public String spbill_create_ip = "";// ip

    public Object getActionResult(PayType payType) throws Exception {
        WxPayConfig payConfig = WeixinPayConfig.getWxPay();
        payConfig.setSignType(WxPayConstants.SignType.MD5);

        WxPayService wxPayService = new WxPayServiceImpl();

        wxPayService.setConfig(payConfig);

        WxPayUnifiedOrderRequest orderRequest = new WxPayUnifiedOrderRequest();
        orderRequest.setBody(body);
        orderRequest.setOutTradeNo(product_id);
        orderRequest.setTotalFee(total_fee);
        orderRequest.setSpbillCreateIp(spbill_create_ip);
        orderRequest.setOpenid(openid);

        orderRequest.setNotifyUrl(WeixinPayConfig.notify_url);

        // 微信小程序支付
        if (Objects.equals(payType, PayType.WECHATPAY)) {
            orderRequest.setTradeType(WxPayConstants.TradeType.JSAPI);
            WxPayMpOrderResult wxPayMpOrderResult = wxPayService.createOrder(orderRequest);
            return wxPayMpOrderResult;
//			return ResponseEntity.ok(wxPayMpOrderResult);
        }
        // 微信网页支付
        else if (Objects.equals(payType, PayType.WECHATPAY_SWEEP_CODE)) {
            orderRequest.setProductId(product_id);
            // 生成微信二维码
            orderRequest.setTradeType(WxPayConstants.TradeType.NATIVE);
            WxPayNativeOrderResult wxPayNativeOrderResult = wxPayService.createOrder(orderRequest);
            return wxPayNativeOrderResult.getCodeUrl();
//			return ResponseEntity.ok(wxPayNativeOrderResult.getCodeUrl());
        }
        // 微信H5支付
        else if (Objects.equals(payType, PayType.WECHATPAY_H5)) {
            // 生成微信二维码
            orderRequest.setTradeType(WxPayConstants.TradeType.MWEB);
            String s = "{\"h5_info\": {\"type\":\"Wap\",\"wap_url\": \"\",\"wap_name\": \"\"}}";
            orderRequest.setSceneInfo(s);
            WxPayMwebOrderResult wxPayMwebOrderResult = wxPayService.createOrder(orderRequest);
            return wxPayMwebOrderResult;
//			return ResponseEntity.ok(wxPayMwebOrderResult.getMwebUrl());
        }
        // 微信公众号支付
        else if (Objects.equals(payType, PayType.WECHATPAY_MP)) {
            orderRequest.setTradeType(WxPayConstants.TradeType.JSAPI);
            WxPayMpOrderResult wxPayMpOrderResult = wxPayService.createOrder(orderRequest);
            return wxPayMpOrderResult;
//			return ResponseEntity.ok(wxPayMpOrderResult);
        } else {
            return null;
        }
    }

    public static void main(String[] args) {
        try {
            WxPayMpOrderResult wxpr = (WxPayMpOrderResult) new WeiXinPay().getActionResult(PayType.WECHATPAY);
            System.out.println(JSON.toJSONString(wxpr));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
