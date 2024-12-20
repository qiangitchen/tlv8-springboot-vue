package com.tlv8.api.pay.alipay.controller;

import com.tlv8.api.pay.alipay.AliPay;
import com.tlv8.api.pay.enums.PayType;
import com.tlv8.api.pay.pojo.PaymentInfo;
import com.tlv8.api.utils.ZxingBarCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

@Controller
@RequestMapping("/pay/alipay")
public class AliPayController {

    /**
     * PC支付调用 返回二维码图片
     * @param response
     * @param orderCode
     * @throws Exception
     */
    @RequestMapping("/getPayBarCodeAction")
    public void execute(HttpServletResponse response, String orderCode) throws Exception {
        try {
            PaymentInfo paymentinfo = new PaymentInfo(orderCode);
            AliPay pay = new AliPay();
            pay.payno = paymentinfo.getfOrderCode();
            pay.body = paymentinfo.getfOrderName();
            pay.payAmount = String.valueOf(paymentinfo.getMoney());
            String content = (String) pay.getActionResult(PayType.WECHATPAY_SWEEP_CODE);
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

}
