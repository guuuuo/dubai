package com.emix.dubai.web.form.passport;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * @author nikog
 */
public class ForgotPasswordForm {
    @NotEmpty
    private String loginName;
    @NotEmpty
    @Email
    private String email;
    @NotEmpty
    private String captcha;

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
}
