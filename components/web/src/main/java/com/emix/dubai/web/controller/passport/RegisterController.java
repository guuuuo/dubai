package com.emix.dubai.web.controller.passport;

import com.emix.dubai.business.entity.User;
import com.emix.dubai.business.service.account.AccountService;
import com.emix.dubai.business.service.common.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

/**
 * @author nikog
 */
@Controller
@RequestMapping(value = "/passport/register")
public class RegisterController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private NotificationService notificationService;

    @RequestMapping(method = RequestMethod.GET)
    public String registerForm() {
        return "passport/registerForm";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String register(@Valid User user, RedirectAttributes redirectAttributes) {
        accountService.registerUser(user);
        notificationService.sendRegisterNotification(user);
        redirectAttributes.addFlashAttribute("user", user);
        return "passport/registerResult";
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
