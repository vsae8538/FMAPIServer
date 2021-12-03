package com.github.vsae.fm.exception;

/**
 * Http返回碼
 */
public enum HttpExceptionCodeEnum implements ErrorCode {

    SUCCESS(20000, "操作成功"),
    FAILED(50000, "操作失敗"),
    VALIDATE_FAILED(40400, "參數校驗失敗"),
    UNAUTHORIZED(40100, "未登入或token已經過期"),
    FORBIDDEN(40300, "沒有相關權限");

    private long code;

    private String message;

    private HttpExceptionCodeEnum(long code, String message) {
        this.code = code;
        this.message = message;
    }

    public long getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
