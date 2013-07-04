package com.emix.dubai.business.service.system;

import com.emix.dubai.business.entity.system.Module;
import com.emix.dubai.business.repository.system.ModuleRepository;
import com.emix.dubai.business.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author nikog
 */
@Component
@Transactional(readOnly = true)
public class ModuleService extends BaseService {
    @Autowired
    private ModuleRepository moduleRepository;

    private static Logger logger = LoggerFactory.getLogger(ModuleService.class);

    public Iterable<Module> loadAllModule() {
        Sort sort = new Sort("displayOrder");
        return moduleRepository.findAll(sort);
    }

    public Module findByModuleCode(String moduleCode) {
        return moduleRepository.findByModuleCode(moduleCode);
    }
}
