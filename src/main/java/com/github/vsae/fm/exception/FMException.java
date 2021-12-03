package com.github.vsae.fm.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 異常類
 */
@Slf4j
@RestControllerAdvice
public class FMException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public FMException() {}

    public FMException(String message) {
        super(message);
    }
}
