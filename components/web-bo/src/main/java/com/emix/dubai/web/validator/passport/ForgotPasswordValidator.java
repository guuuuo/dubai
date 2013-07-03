package com.emix.dubai.web.validator.passport;

import com.emix.core.shiro.ShiroConstant;
import com.emix.core.utils.StringUtil;
import com.emix.dubai.web.form.passport.ForgotPasswordForm;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import javax.servlet.http.HttpServletRequest;

/**
 * @author nikog
 */
@Component
public class ForgotPasswordValidator {

    public void validate(ForgotPasswordForm forgotPasswordForm, HttpServletRequest request, Errors errors) {
        if (StringUtil.isEmpty(forgotPasswordForm.getLoginName()) && StringUtil.isEmpty(forgotPasswordForm.getEmail())) {
            errors.rejectValue("loginName", "", "");
            errors.rejectValue("email", "", "");
            errors.reject("", "用户名和电子邮件至少需要填写一项！");
        }

        String captcha = forgotPasswordForm.getCaptcha();
        String captchaInSession = (String) request.getSession().getAttribute(ShiroConstant.CAPTCHA_SESSION_KEY);
        if (!StringUtil.isEmpty(captcha) && !captcha.equalsIgnoreCase(captchaInSession)) {
            errors.rejectValue("captcha", "", "验证码错误！");
        }
    }
}
