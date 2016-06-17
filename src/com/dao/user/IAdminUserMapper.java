package com.dao.user;

import com.bean.TzParams;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bean.AdminUser;


public interface IAdminUserMapper {
  	
	//根据账号和密码登录
	@Autowired
	public AdminUser getLogin(TzParams params);
	public int saveBatch(List<AdminUser> adminUsers);

}
