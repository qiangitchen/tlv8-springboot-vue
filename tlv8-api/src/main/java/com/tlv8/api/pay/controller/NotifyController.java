package com.tlv8.api.pay.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tlv8.api.pay.pojo.PaymentInfo;
import com.tlv8.api.pay.wxpay.WeiXinReturnTanse;

@Controller
@RequestMapping("/pay/notify")
public class NotifyController {

	/**
	 * 微信支付返回通知
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/WeiXinPayNotify")
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> params = WeiXinReturnTanse.pase(request.getInputStream(), "utf-8");
		PrintWriter out = response.getWriter();
		if ("SUCCESS".equals(params.get("result_code")) && "SUCCESS".equals(params.get("return_code"))) {
			// 验证成功
			if (WeiXinReturnTanse.verify(params)) {
				String out_trade_no = params.get("out_trade_no");// 自定义订单号
				String transaction_id = params.get("transaction_id");// 返回订单号
				try {
					PaymentInfo paymentinfo = new PaymentInfo(out_trade_no);
					paymentinfo.setfReturnText(transaction_id);
					paymentinfo.setfState(1);// 支付成功
					paymentinfo.Update();
					if (paymentinfo.getfEledeId() != null) {
						// 业务扩展（根据业务id更新业务状态）
					}
				} catch (Exception e) {
				}
				out.print("SUCCESS");
			} else {
				out.print("FAIL");
			}
		} else {
			out.print("FAIL");
		}
		out.close();
	}

}
