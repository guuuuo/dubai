package com.emix.dubai.web.validator.passport;

import com.emix.dubai.business.entity.system.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
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
        ValidationUtils.rejectIfEmpty(errors, "name", "field.required");
    }
}
