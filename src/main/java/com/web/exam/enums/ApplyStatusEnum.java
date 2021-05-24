package com.web.exam.enums;

public enum ApplyStatusEnum {
    COMMITED(0,"已提交"),
    APPROVED(1,"已通过"),
    REJECTES(-1,"未通过");

    private int code;
    private String msg;

    ApplyStatusEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
