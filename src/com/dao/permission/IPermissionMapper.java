package com.dao.permission;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Permission;
import com.bean.TzParams;
public interface IPermissionMapper {
	public List<Permission> findPermissionRoot(TzParams params);
	public List<Permission> findPermissionChildren(@Param("id")Integer parentId);
	public int count(TzParams params);
	public Permission get(Integer id);
	public int save(Permission permission);
	
	/**
	 * 更新权限管理
	 * com.tz.dao.permission 
	 * 方法名：update
	 * 创建人：smile
	 * 手机号码:15074816437
	 * 时间：2015年12月14日 22:25:50
	 * @param permission
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int update(Permission permission);
	
	/**
	 * 删除权限管理
	 * com.tz.dao.permission 
	 * 方法名：delete
	 * 创建人：smile
	 * 手机号码:15074816437
	 * 时间：2015年12月14日 22:25:50 
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int delete(TzParams params);
	
}
