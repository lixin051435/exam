package com.web.exam.enums;

public enum UserTypeEnum {
    ADMIN(0,"管理员"),
    TEACHER(1,"老师"),
    STUDENT(2,"学生");

    private Integer code;
    private String msg;

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    UserTypeEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
