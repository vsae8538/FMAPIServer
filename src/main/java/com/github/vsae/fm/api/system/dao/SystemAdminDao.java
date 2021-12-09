package com.github.vsae.fm.api.system.dao;

import com.github.vsae.fm.api.system.model.SystemAdmin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface SystemAdminDao {

    @Select("SELECT * FROM eb_user WHERE account = #{account} ")
    SystemAdmin getSystemAdminByAccount(String account);

    @Update("UPDATE eb_system_admin SET update_time = #{updateTime},last_ip = #{lastIp},login_count = #{loginCount}  ")
    int updateAdminInfoById(SystemAdmin systemAdmin);
}
