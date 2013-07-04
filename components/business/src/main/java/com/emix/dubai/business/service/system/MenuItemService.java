package com.emix.dubai.business.service.system;

import com.emix.dubai.business.service.BaseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author nikog
 */
@Component
@Transactional(readOnly = true)
public class MenuItemService extends BaseService {

    private static Logger logger = LoggerFactory.getLogger(MenuItemService.class);

}
