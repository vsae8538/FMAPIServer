package com.github.vsae.fm.exception;

/**
 * API錯誤碼
 *
 * **/
public interface ErrorCode {
    long getCode();

    String getMessage();
}
