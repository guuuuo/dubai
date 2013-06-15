package com.emix.core.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * @author nikog
 */
public class CaptchaUsernamePasswordToken extends UsernamePasswordToken {

    private String captcha;

    public CaptchaUsernamePasswordToken(String username, String password, boolean rememberMe, String host, String captcha) {
        super(username, password, rememberMe, host);
        this.captcha = captcha;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
}