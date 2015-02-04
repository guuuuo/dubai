package com.emix.dubai.business.service.system;

import com.emix.core.exception.ServiceException;
import com.emix.dubai.business.entity.system.Department;
import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.repository.system.DepartmentRepository;
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

import java.util.Calendar;
import java.util.Map;

/**
 * 用户管理类.
 *
 * @author calvin
 */
// Spring Service Bean的标识.
@Component
@Transactional(readOnly = true)
public class DepartmentService {

    private static Logger logger = LoggerFactory.getLogger(DepartmentService.class);

    @Autowired
    private DepartmentRepository departmentRepository;

    public Department getDepartment(Long id) {
        return departmentRepository.findOne(id);
    }

    public Department findByDeptName(String deptName) {
        return departmentRepository.findByDeptName(deptName);
    }

    @Transactional(readOnly = false)
    public void create(Department Department) {
        Department.setCreatedBy("niko");
        Department.setCreatedWhen(Calendar.getInstance().getTime());

        departmentRepository.save(Department);
    }

    @Transactional(readOnly = false)
    public void update(Department Department) {
        departmentRepository.save(Department);
    }

    @Transactional(readOnly = false)
    public void depete(Long id) {
        if (isSupervisor(id)) {
            logger.warn("操作员{}尝试删除超级管理员部门");
            throw new ServiceException("不能删除超级管理员部门");
        }
        departmentRepository.delete(id);
    }

    @Transactional(readOnly = false)
    public void active(Long id) {
        Department Department = departmentRepository.findOne(id);
        Department.setActive(YesOrNo.Yes.status());
        departmentRepository.save(Department);
    }

    @Transactional(readOnly = false)
    public void deactive(Long id) {
        if (isSupervisor(id)) {
            logger.warn("操作员{}尝试取消激活超级管理员部门");
            throw new ServiceException("不能取消激活超级管理员用户");
        }
        Department Department = departmentRepository.findOne(id);
        Department.setActive(YesOrNo.No.status());
        departmentRepository.save(Department);
    }

    public Page<Department> getDepartments(Map<String, Object> searchParams, int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Department> spec = buildSpecification(searchParams);

        return departmentRepository.findAll(spec, pageRequest);
    }

    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.DESC, "id");
        } else if ("deptName".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "deptName");
        } else if ("deptDesc".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "deptDesc");
        }

        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

    /**
     * 创建动态查询条件组合.
     */
    private Specification<Department> buildSpecification(Map<String, Object> searchParams) {
        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
        Specification<Department> spec = DynamicSpecifications.bySearchFilter(filters.values(), Department.class);
        return spec;
    }

    /**
     * 判断是否超级管理员.
     */
    private boolean isSupervisor(Long id) {
        return id == 1;
    }
}
