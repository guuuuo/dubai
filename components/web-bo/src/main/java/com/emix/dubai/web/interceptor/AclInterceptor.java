package com.emix.dubai.web.interceptor;

import com.emix.dubai.business.pojo.ApplicationProperties;
import com.emix.dubai.business.service.system.MenuGroupService;
import com.emix.dubai.business.service.system.MenuItemService;
import com.emix.dubai.business.service.system.ModuleService;
import com.emix.dubai.web.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author nikog
 */
public class AclInterceptor implements HandlerInterceptor {

    @Autowired
    private ModuleService moduleService;
    @Autowired
    private MenuGroupService menuGroupService;
    @Autowired
    private MenuItemService menuItemService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (modelAndView != null && modelAndView.getModelMap() != null) {
            String currentModuleCode = getCurrentModuleCode(request);
            modelAndView.getModelMap().addAttribute("sys_currentModuleCode", currentModuleCode);
            modelAndView.getModelMap().addAttribute("sys_modules", moduleService.loadAllModule());
            modelAndView.getModelMap().addAttribute("sys_menuGroups", menuGroupService.findByModuleCode(currentModuleCode));
        }
    }

    private String getCurrentModuleCode(HttpServletRequest request) {
        Object objectCurrentModuleCode = request.getSession().getAttribute(Constants.CURRENT_MODULE_CODE);
        if (objectCurrentModuleCode != null) {
            return (String) objectCurrentModuleCode;
        }
        return "sys";
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
