package com.emix.dubai.business.entity.system;

import com.emix.dubai.business.entity.BaseEntity;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * @author niko
 */
@javax.persistence.Entity
@Table(name = "sys_dept")
public class Department extends BaseEntity {
    private String deptName;
    private String deptDesc;
    private Boolean active;
    private Set<Role> roles = new HashSet<Role>();

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptDesc() {
        return deptDesc;
    }

    public void setDeptDesc(String deptDesc) {
        this.deptDesc = deptDesc;
    }

    @Column
    @Type(type = "yes_no")
    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    @ManyToMany(cascade = CascadeType.REFRESH)
    @JoinTable(name = "sys_dept_role", inverseJoinColumns = @JoinColumn(name = "role_id"), joinColumns = @JoinColumn(name = "dept_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
