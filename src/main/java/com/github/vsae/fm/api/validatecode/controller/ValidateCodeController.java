package com.github.vsae.fm.api.validatecode.controller;



import com.github.vsae.fm.api.validatecode.model.ValidateCode;
import com.github.vsae.fm.api.validatecode.service.ValidateCodeService;
import com.github.vsae.fm.common.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@Slf4j
@RestController
@RequestMapping("api/admin/validate/code")
@Api(tags = "驗證碼服務")
public class ValidateCodeController {

    @Autowired
    private ValidateCodeService validateCodeService;

    /***
     * 獲取圖片驗證碼
     * @return
     */
    @ApiOperation(value="獲取驗證碼")
    @GetMapping(value = "/get")
    public CommonResult<ValidateCode> get() {
        ValidateCode validateCode = validateCodeService.get();
        return CommonResult.success(validateCode);
    }

    /**
     * 檢測驗證碼
     * @return
     */
    @ApiOperation(value="檢測驗證碼")
    @GetMapping(value = "/check")
    public CommonResult<Boolean> validateCode(@Validated ValidateCode validateCode) {
        boolean result  = validateCodeService.check(validateCode);
        return CommonResult.success(result);
    }
}



