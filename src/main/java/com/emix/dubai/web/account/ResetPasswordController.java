package com.emix.dubai.web.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author nikog
 */
@Controller
@RequestMapping(value = "/account/reset-pwd")
public class ResetPasswordController {

    @RequestMapping(method = RequestMethod.GET)
    public String resetPwdForm() {
        return "account/reset-password";
    }
}
