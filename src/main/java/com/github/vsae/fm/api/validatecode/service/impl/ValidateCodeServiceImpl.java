package com.github.vsae.fm.api.validatecode.service.impl;


import com.github.vsae.fm.api.validatecode.model.ValidateCode;
import com.github.vsae.fm.api.validatecode.service.ValidateCodeService;
import com.github.vsae.fm.constants.Constants;
import com.github.vsae.fm.exception.FMException;
import com.github.vsae.fm.utils.CommonUtils;
import com.github.vsae.fm.utils.RedisUtils;
import com.github.vsae.fm.utils.ValidateCodeUtil;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;


@Service
public class ValidateCodeServiceImpl implements ValidateCodeService {

    @Resource
    private RedisUtils redisUtil;

    /**
     * 獲取驗證碼
     */
    @Override
    public ValidateCode get() {
        ValidateCodeUtil.Validate randomCode = ValidateCodeUtil.getRandomCode();
        if(randomCode == null){
            return null;
        }

        String value = randomCode.getValue().toLowerCase();
        String md5Key = DigestUtils.md5Hex(value);
        String redisKey = getRedisKey(md5Key);
        redisUtil.set(redisKey, value, 5L, TimeUnit.MINUTES);
        String base64Str = randomCode.getBase64Str();
        return new ValidateCode(md5Key, CommonUtils.getBase64Image(base64Str));
    }

    /**
     * 獲取redis key
     * @param md5Key value的md5加密值
     * 
     * 
     */
    public String getRedisKey(String md5Key){
        return Constants.VALIDATE_REDIS_KEY_PREFIX + md5Key;
    }

    /**
     * 驗證
     * @param validateCode
     * 
     * 
     */
    public boolean check(ValidateCode validateCode){
        if(!redisUtil.exists(getRedisKey(validateCode.getKey()))) throw new FMException("驗證碼錯誤");
        Object redisValue = redisUtil.get(getRedisKey(validateCode.getKey()));
        if(!redisValue.equals(validateCode.getCode().toLowerCase())){
            return false;
        }
        return true;
    }

    public static String st = "fmZc8AgVI3jwYdL+RRLyL5e9Yl6SzD92";
    public static String sk = "0b7…）*#~Nel4MGKdoEaRagoxQ";
}

