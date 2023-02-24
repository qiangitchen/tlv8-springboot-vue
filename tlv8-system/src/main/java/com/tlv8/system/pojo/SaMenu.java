package com.tlv8.system.pojo;

/**
 * 系统菜单
 *
 * @author 陈乾
 */
public class SaMenu {
    private String id;
    private String parent;
    private String path;
    private String name;
    private String type;
    private String icon;
    private String title;
    private int sort;
    private String link;
    private boolean hidden;
    private boolean status;
    private String i18n;

    public void setId(String id) {
        this.id = id;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setHidden(boolean hidden) {
        this.hidden = hidden;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setI18n(String i18n) {
        this.i18n = i18n;
    }

    public String getId() {
        return id;
    }

    public String getParent() {
        return parent;
    }

    public String getPath() {
        return path;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getIcon() {
        return icon;
    }

    public String getTitle() {
        return title;
    }

    public int getSort() {
        return sort;
    }

    public String getLink() {
        return link;
    }

    public boolean isHidden() {
        return hidden;
    }

    public boolean isStatus() {
        return status;
    }

    public String getI18n() {
        return i18n;
    }
}
