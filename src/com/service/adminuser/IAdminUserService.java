
package com.service.adminuser;

import java.util.List;

import com.bean.AdminUser;
import com.bean.TzParams;
public interface IAdminUserService {

	public List<AdminUser> findAdminUsers(TzParams params);

	public int count(TzParams params);
	
	public AdminUser get(Integer id);
	
	public int save(AdminUser adminuser);
	
	public int update(AdminUser adminuser);
	
	public int delete(TzParams params);
}
