package com.emix.dubai.business.entity.system;

import com.emix.dubai.business.entity.BaseEntity;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@javax.persistence.Entity
@Table(name = "sys_menu_item")
public class MenuItem extends BaseEntity {
    private String menuItemName;
    private String menuItemDesc;
    private String url;
    private String i18nKey;
    private Boolean active;
    private Integer displayOrder;

    private MenuGroup menuGroup;

    public MenuItem() {
    }

    public String getMenuItemName() {
        return menuItemName;
    }

    public void setMenuItemName(String menuItemName) {
        this.menuItemName = menuItemName;
    }

    public String getMenuItemDesc() {
        return menuItemDesc;
    }

    public void setMenuItemDesc(String menuItemDesc) {
        this.menuItemDesc = menuItemDesc;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getI18nKey() {
        return i18nKey;
    }

    public void setI18nKey(String i18nKey) {
        this.i18nKey = i18nKey;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Integer getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(Integer displayOrder) {
        this.displayOrder = displayOrder;
    }

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "menu_group_id", nullable = false)
    public MenuGroup getMenuGroup() {
        return menuGroup;
    }

    public void setMenuGroup(MenuGroup menuGroup) {
        this.menuGroup = menuGroup;
    }
}