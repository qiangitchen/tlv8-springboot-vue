package com.tlv8.api.pay.wxpay.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tlv8.api.pay.enums.PayType;
import com.tlv8.api.pay.pojo.PaymentInfo;
import com.tlv8.api.pay.wxpay.WeiXinPay;
import com.tlv8.api.utils.ZxingBarCode;

@Controller
@RequestMapping("/pay/wxpay")
public class WeiXinPayController {

    /**
     * PC支付调用 返回二维码图片
     * @param response
     * @param orderCode
     * @throws Exception
     */
    @RequestMapping("/getBarCodeAction")
    public void execute(HttpServletResponse response, String orderCode) throws Exception {
        try {
            PaymentInfo paymentinfo = new PaymentInfo(orderCode);
            WeiXinPay wpay = new WeiXinPay();
            wpay.product_id = paymentinfo.getfOrderCode();
            wpay.body = paymentinfo.getfOrderName();
            wpay.total_fee = Integer.parseInt(String.valueOf(Math.round(paymentinfo.getMoney() * 100)));
            String content = (String) wpay.getActionResult(PayType.WECHATPAY_SWEEP_CODE);
            File file = ZxingBarCode.enCode(content, 300, 300);
            FileInputStream is = new FileInputStream(file);
            response.setContentType("image/png");
            response.addHeader("Content-Length", "" + file.length());
            OutputStream outs = response.getOutputStream();
            byte[] buffer = new byte[is.available()];
            is.read(buffer);
            is.close();
            // 清空response
            response.reset();
            outs.write(buffer);
            outs.flush();
            file.delete();// 删除临时文件
            outs.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }
    }

    /**
     * 获取支付状态
     * @param forderCode
     * @return
     * @throws Exception
     */
    @RequestMapping("/getPaymentSateAction")
    public Object execute(String forderCode) throws Exception {
        int fstate = 0;
        try {
            PaymentInfo payinfo = new PaymentInfo(forderCode);
            fstate = payinfo.getfState();
        } catch (Exception e) {
        }
        return fstate;
    }
}
