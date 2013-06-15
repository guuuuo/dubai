package com.emix.dubai.business.status;

/**
 * @author nikog
 */
public enum UserStatus {
    Active(1),
    Inactive(-1),
    Pending(0);

    private Integer code;

    UserStatus(Integer code) {
        this.code = code;
    }

    public Integer code() {
        return code;
    }
}
