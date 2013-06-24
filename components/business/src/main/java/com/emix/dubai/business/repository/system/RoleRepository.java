package com.emix.dubai.business.repository.system;

import com.emix.dubai.business.entity.system.Role;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface RoleRepository extends PagingAndSortingRepository<Role, Long>, JpaSpecificationExecutor<Role> {
	Role findByRoleName(String roleName);
    Role findByRoleDesc(String roleDesc);
}
