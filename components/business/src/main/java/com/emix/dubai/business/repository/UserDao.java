package com.emix.dubai.business.repository;

import com.emix.dubai.business.entity.User;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface UserDao extends PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<User> {
	User findByLoginName(String loginName);
}
