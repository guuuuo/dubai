package com.emix.dubai.business.entity.system;

import com.emix.dubai.business.entity.BaseEntity;

import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.HashSet;
import java.util.Set;

@javax.persistence.Entity
@Table(name = "sys_module")
public class Module extends BaseEntity {

    private String moduleCode;
    private String moduleName;
    private String moduleDesc;
    private String url;
    private String i18nKey;
    private Boolean active;
    private Integer order;

    private Set<MenuGroup> menuGroups = new HashSet<MenuGroup>();

    public Module() {
    }

    public String getModuleCode() {
        return moduleCode;
    }

    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getModuleDesc() {
        return moduleDesc;
    }

    public void setModuleDesc(String moduleDesc) {
        this.moduleDesc = moduleDesc;
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

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    @OneToMany(mappedBy = "module", fetch = FetchType.LAZY)
    public Set<MenuGroup> getMenuGroups() {
        return menuGroups;
    }

    public void setMenuGroups(Set<MenuGroup> menuGroups) {
        this.menuGroups = menuGroups;
    }
}