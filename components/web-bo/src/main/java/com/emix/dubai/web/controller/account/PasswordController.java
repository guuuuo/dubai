package com.emix.dubai.web.controller.account;

import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.service.system.UserService;
import com.emix.dubai.business.service.system.ShiroDbRealm;
import com.emix.dubai.web.form.passport.UserForm;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @author nikog
 */
@Controller
@RequestMapping(value = "/account/settings/password")
public class PasswordController {

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String profileForm(Model model) {
        Long id = getCurrentUserId();
        model.addAttribute("user", userService.getUser(id));
        return "account/password";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String updateProfile(@ModelAttribute("preloadUser") UserForm userForm, RedirectAttributes redirectAttributes) {
        User user = userForm.getUser();
        String plainPassword = userForm.getPlainPassword();

        userService.updatePassword(user, plainPassword);

        redirectAttributes.addFlashAttribute("message", "更新密码成功。");
        return "redirect:/account/settings/password";
    }

    /**
     * 取出Shiro中的当前用户Id.
     */
    private Long getCurrentUserId() {
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return user.id;
    }
}
