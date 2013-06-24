package com.emix.dubai.business.repository.system;

import com.emix.dubai.business.entity.system.Department;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface DepartmentRepository extends PagingAndSortingRepository<Department, Long>, JpaSpecificationExecutor<Department> {
	Department findByDeptName(String deptName);
    Department findByDeptDesc(String deptDesc);
}
