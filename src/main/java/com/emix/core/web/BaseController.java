package com.emix.core.web;

/**
 * @author nikog
 */
public class BaseController {
    protected String redirect(String uri) {
        return String.format("redirect:%s", uri);
    }
}
