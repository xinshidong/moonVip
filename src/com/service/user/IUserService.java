package com.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.AdminUser;
import com.bean.TzParams;

@Service
public interface IUserService {
	@Autowired
	public AdminUser getLogin(TzParams params);
	public int saveBatch(List<AdminUser> adminUsers);

}
