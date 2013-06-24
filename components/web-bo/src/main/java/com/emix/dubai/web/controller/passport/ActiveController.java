package com.emix.dubai.web.controller.passport;

import com.emix.dubai.business.service.system.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author niko
 */
@Controller
@RequestMapping(value = "/passport/active")
public class ActiveController {

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String doActive(@RequestParam(value="key")String key) {
        userService.activeUser(key);
        return "passport/activeResult";
    }
}
