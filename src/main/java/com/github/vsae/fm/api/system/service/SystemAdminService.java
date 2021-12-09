package com.github.vsae.fm.api.system.service;

import com.github.vsae.fm.api.authorization.model.TokenResult;
import com.github.vsae.fm.api.system.model.SystemAdminLoginRequest;
import com.github.vsae.fm.api.system.model.SystemAdminResponse;

public interface SystemAdminService {

    public SystemAdminResponse login(SystemAdminLoginRequest systemAdminLoginRequest, String ip) throws Exception;

    public void logout(String token);


}
