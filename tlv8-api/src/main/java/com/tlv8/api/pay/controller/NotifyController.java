package com.tlv8.api.pay.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayConstants;
import com.alipay.api.internal.util.AlipaySignature;
import com.tlv8.api.pay.alipay.conf.AliPayConfig;
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
	public void WeiXinPayNotify(HttpServletRequest request, HttpServletResponse response) throws Exception {
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

	/**
	 * 支付宝支付返回通知
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/AliPayNotify")
	public void AliPayNotify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//获取支付宝POST过来反馈信息
		Map<String, String> params = parseAliNotifyAndGetResult(request);
		PrintWriter out = response.getWriter();
		if (Objects.equals(params.get("trade_status"), "TRADE_SUCCESS")) {
			String out_trade_no = params.get("out_trade_no");// 自定义订单号
			String transaction_id = params.get("trade_no");// 返回订单号
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
			out.println("success");
		}else {
			out.println("fail");
		}
		out.close();
	}

	//获取支付宝POST过来反馈信息
	private Map<String, String> parseAliNotifyAndGetResult(HttpServletRequest request) throws UnsupportedEncodingException, AlipayApiException {
		//乱码解决，这段代码在出现乱码时使用
		request.setCharacterEncoding("utf-8");
		//获取支付宝POST过来反馈信息
		Map<String,String> params = new HashMap<>(16);
		Map<String,String[]> requestParams = request.getParameterMap();
		for(String name :requestParams.keySet()){
			String[] values = requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			params.put(name, valueStr);
		}
		//调用SDK验证签名
		boolean signVerified = AlipaySignature.rsaCertCheckV1(params, AliPayConfig.alipayPublicCertPath, cn.hutool.core.util.CharsetUtil.UTF_8, AlipayConstants.SIGN_TYPE_RSA2);

		if(!signVerified) {
			throw new AlipayApiException("验签失败");
		}
		return params;
	}

}
