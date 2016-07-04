package com.dao.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bean.AdminUser;
import com.bean.TzParams;


public interface IUserMapper {
  	
	//根据账号和密码登录
	@Autowired
	public AdminUser getLogin(TzParams params);
	public int saveBatch(List<AdminUser> adminUsers);

}
