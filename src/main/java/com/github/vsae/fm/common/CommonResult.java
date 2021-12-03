package com.github.vsae.fm.common;


import com.github.vsae.fm.exception.ErrorCode;
import com.github.vsae.fm.exception.HttpExceptionCodeEnum;

public class CommonResult<T> {
    private T data;
    private String message;
    private long code;

    public CommonResult() {
    }

    public CommonResult(long code, String message, T data){
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public CommonResult(HttpExceptionCodeEnum code, String message, T data){
        this(code.getCode(), message, data);
    }

    public CommonResult(long code, T data) {
        this(code, null, data);
    }

    /**
     * 成功返回結果
     * @param data 獲取資料
     */
    public static <T> CommonResult<T> success(T data) {
        return new CommonResult<T>(HttpExceptionCodeEnum.SUCCESS.getCode(), HttpExceptionCodeEnum.SUCCESS.getMessage(), data);
    }

    /**
     * 成功返回結果
     * @param data 獲取資料
     * @param message 提示訊息
     */
    public static <T> CommonResult<T> success(T data, String message) {
        return new CommonResult<T>(HttpExceptionCodeEnum.SUCCESS.getCode(), message, data);
    }

    /**
     * 失敗返回結果
     * @param errorCode 錯誤碼
     */
    public static <T> CommonResult<T> failed(ErrorCode errorCode) {
        return new CommonResult<T>(errorCode.getCode(), errorCode.getMessage(), null);
    }

    /**
     * 失敗返回結果
     * @param errorCode 錯誤碼
     * @param message 錯誤訊息
     */
    public static <T> CommonResult<T> failed(ErrorCode errorCode, String message) {
        return new CommonResult<T>(errorCode.getCode(), message, null);
    }

    /**
     * 失敗返回結果
     * @param errorCode 錯誤碼
     * @param data json物件
     */
    public static <T> CommonResult<T> failed(ErrorCode errorCode, T data) {
        return new CommonResult<T>(errorCode.getCode(), null, data);
    }

    /**
     * 失敗返回結果
     * @param message 提示訊息
     */
    public static <T> CommonResult<T> failed(String message) {
        return new CommonResult<T>(HttpExceptionCodeEnum.FAILED.getCode(), message, null);
    }

    /**
     * 失敗返回結果
     */
    public static <T> CommonResult<T> failed() {
        return failed(HttpExceptionCodeEnum.FAILED);
    }

    /**
     * 參數驗證失敗返回結果
     */
    public static <T> CommonResult<T> validateFailed() {
        return failed(HttpExceptionCodeEnum.VALIDATE_FAILED);
    }

    /**
     * 參數驗證失敗返回結果
     * @param message 提示信息
     */
    public static <T> CommonResult<T> validateFailed(String message) {
        return new CommonResult<T>(HttpExceptionCodeEnum.VALIDATE_FAILED.getCode(), message, null);
    }

    /**
     * 未登入返回結果
     */
    public static <T> CommonResult<T> unauthorized(T data) {
        return new CommonResult<T>(HttpExceptionCodeEnum.UNAUTHORIZED.getCode(), HttpExceptionCodeEnum.UNAUTHORIZED.getMessage(), data);
    }

    /**
     * 未授權返回結果
     */
    public static <T> CommonResult<T> forbidden(T data) {
        return new CommonResult<T>(HttpExceptionCodeEnum.FORBIDDEN.getCode(), HttpExceptionCodeEnum.FORBIDDEN.getMessage(), data);
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public long getCode() {
        return code;
    }

    public void setCode(long code) {
        this.code = code;
    }
}
