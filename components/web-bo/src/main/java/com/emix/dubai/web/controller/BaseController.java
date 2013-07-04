package com.emix.dubai.web.controller;

import com.emix.dubai.business.service.system.*;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author nikog
 */
public class BaseController {
    /****** *******/
    protected String redirect(String uri) {
        return String.format("redirect:%s", uri);
    }
}
