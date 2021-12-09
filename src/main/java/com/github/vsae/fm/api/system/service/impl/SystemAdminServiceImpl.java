package com.github.vsae.fm.api.system.service.impl;

import com.github.vsae.fm.api.authorization.model.TokenResult;
import com.github.vsae.fm.api.system.dao.SystemAdminDao;
import com.github.vsae.fm.api.system.model.SystemAdmin;
import com.github.vsae.fm.api.system.model.SystemAdminLoginRequest;
import com.github.vsae.fm.api.system.model.SystemAdminResponse;
import com.github.vsae.fm.api.system.service.SystemAdminService;
import com.github.vsae.fm.api.validatecode.model.ValidateCode;
import com.github.vsae.fm.api.validatecode.service.ValidateCodeService;
import com.github.vsae.fm.constants.Constants;
import com.github.vsae.fm.exception.FMException;
import com.github.vsae.fm.utils.*;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SystemAdminServiceImpl implements SystemAdminService {

    @Autowired
    ValidateCodeService validateCodeService;

    @Autowired
    SystemAdminDao adminDao;

    private static final Logger logger = LoggerFactory.getLogger(SystemAdminServiceImpl.class);

    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    RedisUtils redisUtils = new RedisUtils();

    @Autowired
    Md5TokenGenerator tokenGenerator;

    @Override
    public SystemAdminResponse login(SystemAdminLoginRequest systemAdminLoginRequest, String ip) throws Exception {
        // 判斷驗證碼
//        ValidateCode validateCode = new ValidateCode(systemAdminLoginRequest.getKey(), systemAdminLoginRequest.getCode());
//        boolean codeCheckResult = validateCodeService.check(validateCode);
//        if(!codeCheckResult) throw new FMException("驗證碼不正確");
        String account = systemAdminLoginRequest.getAccount();
        String password = systemAdminLoginRequest.getPwd();

        SystemAdmin admin = adminDao.getSystemAdminByAccount(account);

        if(admin == null){
            throw new Exception("No account.");
        }

        logger.info("admin account login: " + account);

        TokenResult tokenResult = new TokenResult();

        if(admin != null && encoder.matches(password, admin.getPwd())){
            String token = (String) redisUtils.get(TokenResult.TOKEN_KEY + String.valueOf(admin.getId()));
            if(StringUtils.isNotBlank(token)){
                logout(token);
                logger.info("Repeat login adminName : {}", admin.getAccount());
            }
            tokenResult = createToken(admin.getAccount(), admin.getAccount(), admin.getId());
        }

        SystemAdminResponse systemAdminResponse = new SystemAdminResponse();
        systemAdminResponse.setToken(tokenResult.getToken());
//        BeanUtils.copyProperties(systemAdmin, systemAdminResponse);

        //更新最後登入信息
        admin.setLoginCount(admin.getLoginCount() + 1);
        admin.setLastIp(ip);
        adminDao.updateAdminInfoById(admin);

        return systemAdminResponse;
    }


    private TokenResult createToken(String account, String password, Integer adminId) {
        TokenResult tokenResult = new TokenResult();

        String token = tokenGenerator.generate(account, password);
        redisUtils.set(token, String.valueOf(adminId), Constants.TOKEN_EXPRESS_MINUTES );
        redisUtils.set(TokenResult.TOKEN_KEY + adminId, token,Constants.TOKEN_EXPRESS_MINUTES );

        tokenResult.setToken(token);
        tokenResult.setExpirationTime(redisUtils.getExpire(token));

        return tokenResult;
    }

    @Override
    public void logout(String token) {
        String adminId = (String) redisUtils.get(token);
        redisUtils.del(token);
        redisUtils.del(TokenResult.TOKEN_KEY + adminId);

        logger.info("admin logout token: " + token);
    }
}
