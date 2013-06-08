package com.emix.dubai.web.account;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author nikog
 */
@Controller
@RequestMapping(value = "/account/settings")
public class SettingsController {

    @RequestMapping(method = RequestMethod.GET)
    public String view(Model model) {
        return "redirect:/account/settings/profile";
    }
}
