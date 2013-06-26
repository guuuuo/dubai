package com.emix.dubai.business.repository.system;

import com.emix.dubai.business.entity.system.User;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface UserRepository extends PagingAndSortingRepository<User, Long>, JpaSpecificationExecutor<User> {
	User findByLoginName(String loginName);
    User findByActKey(String actKey);
    User findByEmail(String email);
}
