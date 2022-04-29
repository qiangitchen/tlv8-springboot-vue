package com.tlv8.api.pay.enums;

public enum PayType {
    /** 余额支付 */
    SCOREPAY(0, "余额支付"),

    /** 微信支付 */
    WECHATPAY(1, "小程序支付"),

    /** 支付宝 */
    ALIPAY(2, "支付宝"),

    /** 微信扫码支付 */
    WECHATPAY_SWEEP_CODE(3, "微信扫码支付"),

    /** 微信H5支付 */
    WECHATPAY_H5(4, "微信H5支付"),

    /** 微信公众号 */
    WECHATPAY_MP(5, "微信公众号支付"),

    /** 支付宝H5支付 */
    ALIPAY_H5(6, "支付宝H5支付");

    private final Integer num;

    private final String payTypeName;

    public Integer value() {
        return num;
    }

    public String getPayTypeName() {
        return payTypeName;
    }

    PayType(Integer num, String payTypeName) {
        this.num = num;
        this.payTypeName = payTypeName;
    }

    public static PayType instance(Integer value) {
        PayType[] enums = values();
        for (PayType statusEnum : enums) {
            if (statusEnum.value().equals(value)) {
                return statusEnum;
            }
        }
        return null;
    }
}
