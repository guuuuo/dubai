package com.emix.dubai.web.controller;

import com.emix.core.shiro.ShiroConstant;
import com.emix.dubai.constants.GlobalConstants;
import com.emix.core.utils.CaptchaUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @author nikog
 */
@Controller
@RequestMapping(value = "/captcha")
public class CaptchaController {

    @RequestMapping(method = RequestMethod.GET)
    public void validateCode(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {

        httpServletResponse.setHeader("Cache-Control", "no-store");
        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setDateHeader("Expires", 0);

        String captchaString = CaptchaUtil.generateString(CaptchaUtil.TYPE_NUM_UPPER, 4, null);
        httpServletRequest.getSession().setAttribute(ShiroConstant.CAPTCHA_SESSION_KEY, captchaString);
        httpServletResponse.setContentType("image/jpeg");
        BufferedImage bim = CaptchaUtil.generateImage(captchaString, 90, 30, 3, true, Color.WHITE, null, null);
        ImageIO.write(bim, "JPEG", httpServletResponse.getOutputStream());
    }
}
