package com.emix.dubai.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author nikog
 */
@Controller
@RequestMapping(value = "/home")
public class HomeAction {
    @RequestMapping(method = RequestMethod.GET)
    public String dashboard() {
        return "redirect:/dashboard";
    }
}
