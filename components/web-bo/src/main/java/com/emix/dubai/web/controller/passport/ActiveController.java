package com.emix.dubai.web.controller.passport;

import com.emix.core.exception.ServiceException;
import com.emix.core.web.BaseController;
import com.emix.dubai.business.service.system.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @author niko
 */
@Controller
@RequestMapping(value = "/passport/active")
public class ActiveController extends BaseController {

    private final Logger logger = LoggerFactory.getLogger(ActiveController.class);

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String doActive(@RequestParam(value = "key") String key, RedirectAttributes redirectAttributes) {

        try {
            userService.activeUser(key);
        } catch (ServiceException sex) {
            logger.error(sex.getMessage(), sex);
            redirectAttributes.addFlashAttribute("error", sex.getMessage());
            return redirect("/passport/active/fail");
        }
        redirectAttributes.addFlashAttribute("message", "成功激活账号，请登录。");
        return redirect("/passport/active/success");
    }

    @RequestMapping(value = "success", method = RequestMethod.GET)
    public String success() {
        return "passport/activeResult";
    }

    @RequestMapping(value = "fail", method = RequestMethod.GET)
    public String fail() {
        return "passport/activeResult";
    }
}
