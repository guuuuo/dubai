package com.emix.dubai.web.form.passport;

import com.emix.dubai.business.entity.system.User;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.Valid;

/**
 * @author nikog
 */
public class UserForm {
    @Valid
    private User user = new User();
    @NotBlank
    private String plainPassword;
    @NotBlank
    private String confirmPassword;
    @NotBlank
    private String captcha;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPlainPassword() {
        return plainPassword;
    }

    public void setPlainPassword(String plainPassword) {
        this.plainPassword = plainPassword;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
}
