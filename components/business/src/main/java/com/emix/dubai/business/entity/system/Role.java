package com.emix.dubai.business.entity.system;

import com.emix.dubai.business.entity.BaseEntity;
import org.hibernate.annotations.Type;

import javax.persistence.Column;
import javax.persistence.Table;

/**
 * @author niko
 */
@javax.persistence.Entity
@Table(name = "sys_role")
public class Role extends BaseEntity {
    private String roleName;
    private String roleDesc;
    @Column
    @Type(type="yes_no")
    private Boolean active;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}
