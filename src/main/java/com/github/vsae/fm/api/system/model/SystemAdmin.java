package com.github.vsae.fm.api.system.model;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;


@ApiModel(value="SystemAdmin對象", description="後台管理員表")
public class SystemAdmin implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "後台管理員表ID")
    private Integer id;

    @ApiModelProperty(value = "後台管理員賬號")
    private String account;

    @ApiModelProperty(value = "後台管理員密碼")
    private String pwd;

    @ApiModelProperty(value = "後台管理員姓名")
    private String realName;

    @ApiModelProperty(value = "後台管理員權限(menus_id)")
    private String roles;

    @ApiModelProperty(value = "後台管理員最後一次登錄ip")
    private String lastIp;

    @ApiModelProperty(value = "後台管理員最後一次登錄時間")
    private Date updateTime;

    @ApiModelProperty(value = "後台管理員添加時間")
    private Date createTime;

    @ApiModelProperty(value = "後台管理員級別")
    private Integer level;

    @ApiModelProperty(value = "後台管理員狀態 1有效0無效")
    private Boolean status;

    @ApiModelProperty(value = "是否刪除 1是0否")
    private Boolean isDel;

    @ApiModelProperty(value = "登錄次數")
    private Integer loginCount;

    @ApiModelProperty(value = "手機號碼")
    private String phone;

    @ApiModelProperty(value = "是否接收簡訊")
    private Boolean isSms;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getLastIp() {
        return lastIp;
    }

    public void setLastIp(String lastIp) {
        this.lastIp = lastIp;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Boolean getDel() {
        return isDel;
    }

    public void setDel(Boolean del) {
        isDel = del;
    }

    public Integer getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean getSms() {
        return isSms;
    }

    public void setSms(Boolean sms) {
        isSms = sms;
    }
}
