package com.emix.dubai.web.controller.system;

import com.emix.core.exception.ServiceException;
import com.emix.core.web.BaseController;
import com.emix.dubai.business.entity.system.Role;
import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.service.system.RoleService;
import com.emix.dubai.business.service.system.UserService;
import com.emix.dubai.constants.GlobalConstants;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.Map;

/**
 * 管理员管理用户的Controller.
 *
 * @author calvin
 */
@Controller
@RequestMapping(value = "/system/role")
public class RoleController extends BaseController {

    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();

    static {
        sortTypes.put("auto", "自动");
        sortTypes.put("roleName", "角色名称");
        sortTypes.put("roleDesc", "角色描述");
    }

    @Autowired
    private RoleService roleService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "")
    public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

        Page<Role> roles = roleService.getRoles(searchParams, pageNumber, GlobalConstants.PAGE_SIZE, sortType);

        model.addAttribute("roles", roles);
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        // 将搜索条件编码成字符串，用于排序，分页的URL
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "system/roleList";
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("role", new Role());
        model.addAttribute("action", "create");
        return "system/roleForm";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(@Valid Role role, RedirectAttributes redirectAttributes) {
        roleService.create(role);
        redirectAttributes.addFlashAttribute("roleName", role.getRoleName());
        return redirect("/system/role");
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("role", roleService.getRole(id));
        model.addAttribute("action", "update");
        return "system/roleForm";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("preloadRole") Role role, RedirectAttributes redirectAttributes) {
        roleService.update(role);
        redirectAttributes.addFlashAttribute("message", "更新角色" + role.getRoleName() + "成功");
        return redirect("/system/role");
    }

    @RequestMapping(value = "delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        Role role = roleService.getRole(id);
        if(role==null) {
            redirectAttributes.addFlashAttribute("error", String.format("不存在id为「%s」的角色", id));
            return redirect("/system/role");
        }
        try {
            roleService.deleteRole(id);
        } catch (ServiceException ex) {
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
            return redirect("/system/role");
        }
        redirectAttributes.addFlashAttribute("message", "删除角色『" + role.getRoleName() + "』成功");
        return redirect("/system/role");
    }

    @RequestMapping(value = "active/{id}")
    public String active(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        Role role = roleService.getRole(id);
        if(role==null) {
            redirectAttributes.addFlashAttribute("error", String.format("不存在id为「%s」的角色", id));
            return redirect("/system/role");
        }

        roleService.active(id);
        redirectAttributes.addFlashAttribute("message", "激活角色『" + role.getRoleName() + "』成功");
        return redirect("/system/role");
    }

    @RequestMapping(value = "deactive/{id}")
    public String deactive(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        Role role = roleService.getRole(id);
        if(role==null) {
            redirectAttributes.addFlashAttribute("error", String.format("不存在id为「%s」的角色", id));
            return redirect("/system/role");
        }
        try {
            roleService.deactive(id);
        } catch (ServiceException ex) {
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
            return redirect("/system/role");
        }
        redirectAttributes.addFlashAttribute("message", "禁用角色『" + role.getRoleName() + "』成功");
        return redirect("/system/role");
    }

    /**
     * 使用@ModelAttribute, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
     * 因为仅update()方法的form中有id属性，因此本方法在该方法中执行.
     */
    @ModelAttribute("preloadUser")
    public User getUser(@RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            return userService.getUser(id);
        }
        return null;
    }

    /**
     * Ajax请求校验loginName是否唯一。
     */
    @RequestMapping(value = "checkRoleName")
    @ResponseBody
    public String checkLoginName(@RequestParam("roleName") String roleName) {
        if (roleService.findByRoleName(roleName) == null) {
            return "true";
        } else {
            return "false";
        }
    }
}
