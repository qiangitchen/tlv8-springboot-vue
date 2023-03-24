package com.tlv8.system.pojo;

public class SaMenuTree {
    private String sid;// 主键
    private String label;// 名称
    private String icon;// 图标
    private String layuiicon;// 样式图标
    private String url;// 功能路径
    private String process;// 功能模块
    private String activity;// 环节
    private String display;// 显示
    private String icon32;// 小图标
    private String icon64;// 大图标
    private String pid;// 父id
    private int sorts; // 序号
    private String code;// name

    private String i18n;// 多语言编号
    private int version; // 序号

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getLayuiicon() {
        return layuiicon;
    }

    public void setLayuiicon(String layuiicon) {
        this.layuiicon = layuiicon;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public String getIcon32() {
        return icon32;
    }

    public void setIcon32(String icon32) {
        this.icon32 = icon32;
    }

    public String getIcon64() {
        return icon64;
    }

    public void setIcon64(String icon64) {
        this.icon64 = icon64;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public int getSorts() {
        return sorts;
    }

    public void setSorts(int sorts) {
        this.sorts = sorts;
    }

    public String getI18n() {
        return i18n;
    }

    public void setI18n(String i18n) {
        this.i18n = i18n;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }
}
