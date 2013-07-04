package com.emix.dubai.business.entity.system;

import com.emix.dubai.business.entity.BaseEntity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@javax.persistence.Entity
@Table(name = "sys_menu_group")
public class MenuGroup extends BaseEntity {
    private String menuGroupName;
    private String menuGroupDesc;
    private String url;
    private String i18nKey;
    private Boolean active;
    private Integer displayOrder;

    private Module module;
    private Set<MenuItem> menuItems = new HashSet<MenuItem>();

    public MenuGroup() {
    }

    public String getMenuGroupName() {
        return menuGroupName;
    }

    public void setMenuGroupName(String menuGroupName) {
        this.menuGroupName = menuGroupName;
    }

    public String getMenuGroupDesc() {
        return menuGroupDesc;
    }

    public void setMenuGroupDesc(String menuGroupDesc) {
        this.menuGroupDesc = menuGroupDesc;
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
    @JoinColumn(name = "module_id", nullable = false)
    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    @OneToMany(mappedBy = "menuGroup", fetch = FetchType.LAZY)
    @OrderBy("displayOrder ASC")
    public Set<MenuItem> getMenuItems() {
        return menuItems;
    }

    public void setMenuItems(Set<MenuItem> menuItems) {
        this.menuItems = menuItems;
    }
}