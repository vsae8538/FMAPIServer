package com.github.vsae.fm.api.authorization.controller;

import com.github.vsae.fm.api.system.model.SystemAdminLoginRequest;
import com.github.vsae.fm.api.system.model.SystemAdminResponse;
import com.github.vsae.fm.api.system.service.SystemAdminService;
import com.github.vsae.fm.api.system.service.impl.SystemAdminServiceImpl;
import com.github.vsae.fm.common.CommonResult;
import com.github.vsae.fm.utils.CommonUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("/admin")
@RestController
public class AdminController {

    @Autowired
    SystemAdminService systemAdminService;

    @ApiOperation(value="PC登入")
    @PostMapping(value = "/login", produces = "application/json")
    public CommonResult<SystemAdminResponse> SystemAdminLogin(@RequestBody @Validated SystemAdminLoginRequest systemAdminLoginRequest, HttpServletRequest request) throws Exception {
        String ip = CommonUtils.getClientIp(request);
        SystemAdminResponse systemAdminResponse = systemAdminService.login(systemAdminLoginRequest, ip);

        return CommonResult.success(systemAdminResponse, "login success");
    }

}
