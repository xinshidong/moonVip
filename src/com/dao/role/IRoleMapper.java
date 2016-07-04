package com.dao.role;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Role;
import com.bean.TzParams;

/**
 * 角色管理Mapper
 * IRoleMapper
 * 创建人:smile
 * 时间：2016年5月18日 20:59:39
 * @version 1.0.0
 * 
 */
public interface IRoleMapper {

	
	public List<Role> findRoles(TzParams params);
	
	/**
	 * 求总数
	 * com.dao.role 
	 * 方法名：count
	 * 创建人：smile
	 * 手机号码:15074816437
	 * 时间：2015年12月18日 20:59:39
	 * @param id
	 * @return 
	 * 返回类型：List<Role>
	 * @exception 
	 * @since  1.0.0
	 */
	public int count(TzParams params);
	
	/**
	 * 
	 * com.tz.dao.role 
	 * 方法名：getRole
	 * 创建人：smile
	 * 手机号码:15074816437
	 * 时 时间：2016年5月18日 20:59:39
	 * @param id
	 * @return 
	 * 返回类型：List<Role>
	 * @exception 
	 * @since  1.0.0
	 */
	public Role get(Integer id);
	
	/**
	 * 保存角色管理
	 * com.tz.dao.role 
	 * 方法名：save
	 * 创建人：smile
	 * 手机号码:15074816437
	 * 时间：2015年12月18日 20:59:39
	 * @param role
	 * @return 
	 * 返回类型：Role
	 * @exception 
	 * @since  1.0.0
	 */
	public int save(Role role);
	
	/**
	 * 更新角色管理
	 * com.tz.dao.role 
	 * 方法名：update
	 * 创建人：smile
	 * 手机号码:15074816437
	 *  时间：2016年5月18日 20:59:39
	 * @param role
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int update(Role role);
	
	/**
	 * 删除角色管理
	 * com.tz.dao.role 
	 * 方法名：delete
	 * 创建人：柯柯 
	 * 手机号码:15074816437
	 * 时间：2015年12月18日 20:59:39 
	 * @param params
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int delete(TzParams params);
	
	/**
	 * 分配角色给用户
	 * com.tz.dao.role 
	 * 方法名：saveRoleUser
	 * 创建人：xuchengfei 
	 * 手机号码:15074816437
	 * 时间：2015年12月18日-下午10:10:25 
	 * @param userId
	 * @param roleId
	 * @return 
	 * 返回类型：int
	 * @exception 
	 * @since  1.0.0
	 */
	public int saveRoleUser(@Param("userId")Integer userId,@Param("roleId")Integer roleId);
	public int saveRolePermission(@Param("roleId")Integer roleId,@Param("permissionId")Integer permissionId);
	public int deleteRolePermission(@Param("roleId")Integer roleId);
	
	/**
	 * 过滤查询用户
	 * com.tz.dao.role 
	 * 方法名：findFilterUsers
	 * 创建人：xuchengfei 
	 * 手机号码:15074816437
	 *  时间：2016年5月18日 20:59:39
	 * @param params
	 * @return 
	 * 返回类型：List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String,Object>> findFilterUsers(TzParams params);
	public int countFilterUsers(TzParams params);
	
	
	/**
	 * 根据用户查询对应的角色
	 * com.tz.dao.role 
	 * 方法名：findRolesByUserId
	 * 创建人：xuchengfei 
	 * 手机号码:15074816437
	 *  时间：2016年5月18日 20:59:39
	 * @param userId
	 * @return 
	 * 返回类型：HashMap<String,Object>
	 * @exception 
	 * @since  1.0.0
	 */
	public HashMap<String, Object> findRolesByUserId(Integer userId);
	
}
