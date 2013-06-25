package com.emix.dubai.business.entity.system;

import com.emix.dubai.business.entity.BaseEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author nikog
 */
@Entity
@Table(name = "sys_resource")
public class Resource extends BaseEntity {
    private String resource;
    private String permission;

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
}