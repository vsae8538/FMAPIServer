package com.github.vsae.fm.api.validatecode.service;

import com.github.vsae.fm.api.validatecode.model.ValidateCode;

public interface ValidateCodeService {

    ValidateCode get();

    boolean check(ValidateCode validateCode);
}