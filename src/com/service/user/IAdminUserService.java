package com.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.TzParams;
import com.bean.AdminUser;

@Service
public interface IAdminUserService {
	@Autowired
	public AdminUser getLogin(TzParams params);
	public int saveBatch(List<AdminUser> adminUsers);

}
