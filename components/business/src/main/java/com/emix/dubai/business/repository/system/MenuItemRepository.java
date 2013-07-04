package com.emix.dubai.business.repository.system;

import com.emix.dubai.business.entity.system.MenuItem;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface MenuItemRepository extends PagingAndSortingRepository<MenuItem, Long>, JpaSpecificationExecutor<MenuItem> {
}
