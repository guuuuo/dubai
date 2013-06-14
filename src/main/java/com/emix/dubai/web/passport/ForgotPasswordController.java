package com.emix.dubai.web.passport;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author nikog
 */
@Controller
@RequestMapping(value = "/passport/forgot-password")
public class ForgotPasswordController {

    @RequestMapping(method = RequestMethod.GET)
    public String forgotPasswordForm() {
        return "passport/forgotPasswordForm";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String forgotPassword() {
        // TODO
        return "passport/forgotPasswordResult";
    }
}
