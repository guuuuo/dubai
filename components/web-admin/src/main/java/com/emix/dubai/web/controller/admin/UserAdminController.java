package com.emix.dubai.web.controller.admin;

import com.emix.core.web.BaseController;
import com.emix.dubai.constants.GlobalConstants;
import com.emix.dubai.business.entity.sys.User;
import com.emix.core.exception.ServiceException;
import com.emix.dubai.business.service.account.AccountService;
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
@RequestMapping(value = "/admin/user")
public class UserAdminController extends BaseController {

    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();

    static {
        sortTypes.put("auto", "自动");
        sortTypes.put("loginName", "登录名");
        sortTypes.put("name", "用户名");
    }

    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "")
    public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

        Page<User> users = accountService.getUsers(searchParams, pageNumber, GlobalConstants.PAGE_SIZE, sortType);

        model.addAttribute("users", users);
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        // 将搜索条件编码成字符串，用于排序，分页的URL
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "admin/userList";
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("action", "create");
        return "admin/userForm";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(@Valid User user, RedirectAttributes redirectAttributes) {
        accountService.createUser(user);
        redirectAttributes.addFlashAttribute("username", user.getLoginName());
        return redirect("/admin/user");
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", accountService.getUser(id));
        model.addAttribute("action", "update");
        return "admin/userForm";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("preloadUser") User user, RedirectAttributes redirectAttributes) {
        accountService.updateUser(user);
        redirectAttributes.addFlashAttribute("message", "更新用户" + user.getLoginName() + "成功");
        return redirect("/admin/user");
    }

    @RequestMapping(value = "delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        User user = accountService.getUser(id);
        try {
            accountService.deleteUser(id);
        } catch (ServiceException ex) {
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
            return redirect("/admin/user");
        }
        redirectAttributes.addFlashAttribute("message", "删除用户" + user.getLoginName() + "成功");
        return redirect("/admin/user");
    }

    @RequestMapping(value = "active/{id}")
    public String active(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        User user = accountService.getUser(id);
        accountService.activeUser(id);
        redirectAttributes.addFlashAttribute("message", "激活用户" + user.getLoginName() + "成功");
        return redirect("/admin/user");
    }

    @RequestMapping(value = "deactive/{id}")
    public String deactive(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        User user = accountService.getUser(id);
        try {
            accountService.deactiveUser(id);
        } catch (ServiceException ex) {
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
            return redirect("/admin/user");
        }
        redirectAttributes.addFlashAttribute("message", "取消激活用户" + user.getLoginName() + "成功");
        return redirect("/admin/user");
    }

    /**
     * 使用@ModelAttribute, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
     * 因为仅update()方法的form中有id属性，因此本方法在该方法中执行.
     */
    @ModelAttribute("preloadUser")
    public User getUser(@RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            return accountService.getUser(id);
        }
        return null;
    }

    /**
     * Ajax请求校验loginName是否唯一。
     */
    @RequestMapping(value = "checkLoginName")
    @ResponseBody
    public String checkLoginName(@RequestParam("loginName") String loginName) {
        if (accountService.findUserByLoginName(loginName) == null) {
            return "true";
        } else {
            return "false";
        }
    }
}
