package com.emix.dubai.web.controller;

/**
 * @author nikog
 */
public class BaseController {
    /****** *******/
    protected String redirect(String uri) {
        return String.format("redirect:%s", uri);
    }
}
