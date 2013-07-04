package com.emix.dubai.business.repository.system;

import com.emix.dubai.business.entity.system.MenuGroup;
import com.emix.dubai.business.entity.system.Module;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface MenuGroupRepository extends PagingAndSortingRepository<MenuGroup, Long>, JpaSpecificationExecutor<MenuGroup> {
    Iterable<MenuGroup> findByModule(Module module);
}
