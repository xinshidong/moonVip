
package com.dao.adminuser;

import java.util.List;

import com.bean.AdminUser;
import com.bean.TzParams;

/**
 * 日记管理Mapper
 * IAdminUserMapper
 * 创建人:smile
 * 时间：2015年12月14日 21:25:36
 * @version 1.0.0
 * 
 */
public interface IAdminUserMapper {

	public List<AdminUser> findAdminUsers(TzParams params);
	
	public int count(TzParams params);
	
	public AdminUser get(Integer id);
	
	public int save(AdminUser adminuser);

	public int update(AdminUser adminuser);

	public int delete(TzParams params);
	
}
