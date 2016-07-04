
package com.service.role;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Role;
import com.bean.TzParams;

public interface IRoleService {



	public List<Role> findRoles(TzParams params);
	

	public int count(TzParams params);
	

	public Role get(Integer id);
	

	public int save(Role role);
	
	
	public int update(Role role);
	

	public int delete(TzParams params);
	

	public int saveRoleUser(Integer userId,Integer roleId);
	public int saveRolePermission(@Param("roleId")Integer roleId,@Param("permissionId")Integer permissionId);
	public int deleteRolePermission(@Param("roleId")Integer roleId);

	public List<HashMap<String,Object>> findFilterUsers(TzParams params);
	public int countFilterUsers(TzParams params);
	

	public HashMap<String, Object> findRolesByUserId(Integer userId);
}
