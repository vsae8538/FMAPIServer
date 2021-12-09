package com.github.vsae.fm.api.system.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;


@Data
public class SystemAdminLoginRequest {
    @ApiModelProperty(value = "後台管理員帳號", example = "userName")
    @NotEmpty(message = "帳號 不能為空")
    private String account;

    @ApiModelProperty(value = "後台管理員密碼", example = "userPassword")
    @NotEmpty(message = "密碼 不能為空")
    @Length(min = 6, max = 30)
    private String pwd;

    @ApiModelProperty(value = "key", required = true)
    @NotEmpty(message = "驗證碼key 不能為空")
    private String key;

    @ApiModelProperty(value = "code", required = true)
    @NotEmpty(message = "驗證碼 不能為空")
    private String code;
}
