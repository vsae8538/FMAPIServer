package com.github.vsae.fm.api.authorization.model;

import com.github.vsae.fm.api.system.model.SystemAdmin;

import java.util.Locale;

public class TokenResult {

    private static final long serialVersionUID = 4903514237492573024L;
    // 加密後的token key
    public static final String TOKEN_KEY = "TOKEN";
    // Redis 存儲的key
    public static final String TOKEN_REDIS = "TOKEN:ADMIN:";
    // 用戶號
    private String userNo;
    private Integer userId;
    private String token;
    // 最後訪問時間
    private long lastAccessedTime = System.currentTimeMillis();
    // 過期時間
    private long expirationTime;
    // 客戶端類型
    private String clienttype;
    // 客戶端語言
    private Locale locale;
    // 客戶端ip
    private String host;
    // 當前登錄用戶信息
    private SystemAdmin systemAdmin;

    public TokenResult() {

    }

    public TokenResult(String userNo, Integer userId) {
        this.userNo = userNo;
        this.userId = userId;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public long getLastAccessedTime() {
        return lastAccessedTime;
    }

    public void setLastAccessedTime(long lastAccessedTime) {
        this.lastAccessedTime = lastAccessedTime;
    }

    public long getExpirationTime() {
        return expirationTime;
    }

    public void setExpirationTime(long expirationTime) {
        this.expirationTime = expirationTime;
    }

    public String getClienttype() {
        return clienttype;
    }

    public void setClienttype(String clienttype) {
        this.clienttype = clienttype;
    }

    public Locale getLocale() {
        return locale;
    }

    public void setLocale(Locale locale) {
        this.locale = locale;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public SystemAdmin getSystemAdmin() {
        return systemAdmin;
    }

    public void setSystemAdmin(SystemAdmin systemAdmin) {
        this.systemAdmin = systemAdmin;
    }
}
