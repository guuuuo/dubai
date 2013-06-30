package com.emix.dubai.web.controller.passport;

import com.emix.core.shiro.ShiroConstant;
import com.emix.core.utils.StringUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author niko
 */
public class PassportBaseController {

    @RequestMapping(value = "validateCaptcha")
    @ResponseBody
    public String validateCaptcha(@RequestParam("captcha") String captcha, HttpServletRequest request) {
        return isCaptchaValid(captcha, request).toString();
    }

    protected Boolean isCaptchaValid(String captcha, HttpServletRequest request) {
        String captchaInSession = (String) request.getSession().getAttribute(ShiroConstant.CAPTCHA_SESSION_KEY);
        return !StringUtil.isEmpty(captcha) && captcha.equalsIgnoreCase(captchaInSession);
    }
}
