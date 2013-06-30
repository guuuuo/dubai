package com.emix.core.utils;

/**
 * @author nikog
 */
public class StringUtil {
    public static final boolean isEmpty(String string) {
        return string == null || string.equals("");
    }

    public static final boolean isNotEmpty(String string) {
        return string != null && !string.equals("");
    }
}
