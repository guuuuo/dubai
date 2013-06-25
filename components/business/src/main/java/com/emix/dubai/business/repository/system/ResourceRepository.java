package com.emix.dubai.business.repository.system;

import com.emix.dubai.business.entity.system.Resource;
import com.emix.dubai.business.entity.system.Role;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ResourceRepository extends PagingAndSortingRepository<Resource, Long>, JpaSpecificationExecutor<Resource> {
}
