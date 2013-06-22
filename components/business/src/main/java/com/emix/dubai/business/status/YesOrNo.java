package com.emix.dubai.business.status;

/**
 * @author niko
 */
public enum YesOrNo {
    Yes(true, "Y"),No(false, "N");

    Boolean status;
    String code;

    YesOrNo(Boolean status, String code) {
        this.status = status;
        this.code = code;
    }

    public Boolean status() {
        return this.status;
    }

    public String code() {
        return this.code;
    }
}
