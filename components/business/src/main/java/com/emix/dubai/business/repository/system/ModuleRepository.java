package com.emix.dubai.business.repository.system;

import com.emix.dubai.business.entity.system.Module;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ModuleRepository extends PagingAndSortingRepository<Module, Long>, JpaSpecificationExecutor<Module> {
    Module findByModuleCode(String moduleCode);
}
