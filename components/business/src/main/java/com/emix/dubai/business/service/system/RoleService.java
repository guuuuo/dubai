package com.emix.dubai.business.service.system;

import com.emix.core.exception.ServiceException;
import com.emix.dubai.business.entity.system.Role;
import com.emix.dubai.business.repository.system.RoleRepository;
import com.emix.dubai.business.status.YesOrNo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.utils.DateProvider;

import java.util.Map;

/**
 * 用户管理类.
 *
 * @author calvin
 */
// Spring Service Bean的标识.
@Component
@Transactional(readOnly = true)
public class RoleService {

    private static Logger logger = LoggerFactory.getLogger(RoleService.class);

    @Autowired
    private RoleRepository roleRepository;
    private DateProvider dateProvider = DateProvider.DEFAULT;

    public Role getRole(Long id) {
        return roleRepository.findOne(id);
    }

    @Transactional(readOnly = false)
    public void create(Role role) {
        role.setCreatedBy("niko");
        role.setCreatedWhen(dateProvider.getDate());

        roleRepository.save(role);
    }

    @Transactional(readOnly = false)
    public void update(Role role) {
        roleRepository.save(role);
    }

    @Transactional(readOnly = false)
    public void deleteUser(Long id) {
        if (isSupervisor(id)) {
            logger.warn("操作员{}尝试删除超级管理员角色");
            throw new ServiceException("不能删除超级管理员角色");
        }
        roleRepository.delete(id);
    }

    @Transactional(readOnly = false)
    public void active(Long id) {
        Role role = roleRepository.findOne(id);
        role.setActive(YesOrNo.Yes.status());
        roleRepository.save(role);
    }

    @Transactional(readOnly = false)
    public void deactive(Long id) {
        if (isSupervisor(id)) {
            logger.warn("操作员{}尝试取消激活超级管理员角色");
            throw new ServiceException("不能取消激活超级管理员用户");
        }
        Role role = roleRepository.findOne(id);
        role.setActive(YesOrNo.No.status());
        roleRepository.save(role);
    }

    public Page<Role> getRoles(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Role> spec = buildSpecification(searchParams);

        return roleRepository.findAll(spec, pageRequest);
    }

    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("roleName".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "roleName");
        } else if ("roleDesc".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "roleDesc");
        }

        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

    /**
     * 创建动态查询条件组合.
     */
    private Specification<Role> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<Role> spec = DynamicSpecifications.bySearchFilter(filters.values(), Role.class);
        return spec;
    }

    /**
     * 判断是否超级管理员.
     */
    private boolean isSupervisor(Long id) {
        return id == 1;
    }
}
