package com.emix.dubai.business.service.system;

import com.emix.dubai.business.entity.system.MenuGroup;
import com.emix.dubai.business.entity.system.Module;
import com.emix.dubai.business.repository.system.MenuGroupRepository;
import com.emix.dubai.business.repository.system.ModuleRepository;
import com.emix.dubai.business.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author nikog
 */
@Component
@Transactional(readOnly = true)
public class MenuGroupService extends BaseService {
    private static Logger logger = LoggerFactory.getLogger(MenuGroupService.class);

    @Autowired
    private ModuleRepository moduleRepository;
    @Autowired
    private MenuGroupRepository menuGroupRepository;

    public Iterable<MenuGroup> findByModuleCode(String moduleCode) {
        Module module = moduleRepository.findByModuleCode(moduleCode);
        return module.getMenuGroups();
    }
}
