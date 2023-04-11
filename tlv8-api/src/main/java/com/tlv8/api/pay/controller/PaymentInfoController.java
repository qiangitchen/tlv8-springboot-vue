package com.tlv8.api.pay.controller;

import com.tlv8.api.pay.pojo.PaymentInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api/pay")
public class PaymentInfoController {

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
