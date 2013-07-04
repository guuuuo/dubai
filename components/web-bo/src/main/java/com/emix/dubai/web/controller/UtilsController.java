package com.emix.dubai.web.controller;

import com.emix.dubai.business.entity.system.Role;
import com.emix.dubai.web.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @author nikog
 */
@Controller
public class UtilsController extends BaseController {

    @RequestMapping(value = "/module/{moduleCode}", method = RequestMethod.GET)
    public String switchToModule(@PathVariable("moduleCode") String moduleCode, Model model, HttpServletRequest request) {
        request.getSession().setAttribute(Constants.CURRENT_MODULE_CODE, moduleCode);
        return redirect("/");
    }
}
