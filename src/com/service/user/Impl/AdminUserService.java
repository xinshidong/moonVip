package com.service.user.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.TzParams;
import com.bean.AdminUser;
import com.dao.user.IAdminUserMapper;
import com.service.user.IAdminUserService;

@Service
public class AdminUserService implements IAdminUserService{
    
	@Autowired
	private IAdminUserMapper userMapper;
	
	public AdminUser getLogin(TzParams params) {
		
		return  userMapper.getLogin(params);
	}

	@Override
	public int saveBatch(List<AdminUser> adminUsers) {
		
		return 0;
	}
	
}
