package com.emix.dubai.web.controller.passport;

import com.emix.core.utils.StringUtil;
import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.service.system.UserService;
import com.emix.dubai.web.form.passport.ForgotPasswordForm;
import com.emix.dubai.web.validator.passport.ForgotPasswordValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

/**
 * @author nikog
 */
@Controller
@RequestMapping(value = "/passport/forgot-password")
public class ForgotPasswordController extends PassportBaseController {
    @Autowired
    private ForgotPasswordValidator validator;
    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String forgotPasswordForm(Model model) {
        model.addAttribute("forgotPasswordForm", new ForgotPasswordForm());
        return "passport/forgotPasswordForm";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String forgotPassword(@Valid ForgotPasswordForm forgotPasswordForm, BindingResult result, Model model) {
        validator.validate(forgotPasswordForm, result);

        if (result.hasErrors()) {
            model.addAttribute("forgotPasswordForm", forgotPasswordForm);
            return "passport/forgotPasswordForm";
        }

        return "passport/forgotPasswordResult";
    }
}
