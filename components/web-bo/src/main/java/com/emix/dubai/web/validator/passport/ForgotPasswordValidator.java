package com.emix.dubai.web.validator.passport;

import com.emix.core.utils.StringUtil;
import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.web.form.passport.ForgotPasswordForm;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * @author nikog
 */
@Component
public class ForgotPasswordValidator implements Validator {
    @SuppressWarnings("unchecked")
    @Override
    public boolean supports(Class clazz) {
        return User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object object, Errors errors) {
        ForgotPasswordForm forgotPasswordForm = (ForgotPasswordForm) object;

        if (StringUtil.isEmpty(forgotPasswordForm.getLoginName()) && StringUtil.isEmpty(forgotPasswordForm.getEmail())) {
            //注意这里的code.error和message_en.properties里的设置对应的.
            errors.rejectValue("loginName", "common.field.required");
            errors.rejectValue("email", "common.field.required");
        }
    }
}
