package com.emix.dubai.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author nikog
 */
@Controller

public class SystemErrorController {

    @RequestMapping(value = "/403")
    public String error403() {
        return "error/403";
    }

}
