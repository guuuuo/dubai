package com.emix.dubai.web.controller.passport;

import com.emix.core.utils.StringUtil;
import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.service.system.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * @author nikog
 */
@Controller
@RequestMapping(value = "/passport/forgot-password")
public class ForgotPasswordController extends PassportBaseController {
    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String forgotPasswordForm() {
        return "passport/forgotPasswordForm";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String forgotPassword(@RequestParam("loginName") String loginName,
                                 @RequestParam("email") String email,
                                 @RequestParam("captcha") String captcha,
                                 HttpServletRequest request) {
        if (!isCaptchaValid(captcha, request)) {
            //　TODO 验证码错误
            return "passport/forgotPasswordForm";
        }

        User user = null;
        if (StringUtil.isNotEmpty(loginName)) {
            user = userService.findUserByLoginName(loginName);
        }
        if (StringUtil.isNotEmpty(email)) {
            if (user != null && !email.equalsIgnoreCase(user.getEmail())) {
                // TODO 用户名与邮件地址不一致
                return "passport/forgotPasswordForm";
            }
            user = userService.findUserByEmail(email);
        }

        userService.sendResetPwdEmail(user);

        return "passport/forgotPasswordResult";
    }
}
