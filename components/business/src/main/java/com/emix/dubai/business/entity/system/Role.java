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
@Table(name = "sys_role")
public class Role extends BaseEntity {
    private String roleName;
    private String roleDesc;
    private Boolean active;
    private Set<Department> departments = new HashSet<Department>();

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

    @Column
    @Type(type = "yes_no")
    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    @ManyToMany(cascade = CascadeType.REFRESH)
    @JoinTable(name = "sys_dept_role", inverseJoinColumns = @JoinColumn(name = "dept_id"), joinColumns = @JoinColumn(name = "role_id"))
    public Set<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(Set<Department> departments) {
        this.departments = departments;
    }
}
