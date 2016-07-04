package com.dao.adminstat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bean.AdminStat;
import com.bean.TzParams;
public interface IAdminStatMapper{
  
	/**查找日志管理
	 * 作者 smile
	 * 时间 2016年06月11日  18:22:14
	 * @param params
	 * @return
	 */
	@Autowired
	public List<AdminStat> findAdminStat(TzParams params);
	public int 	count(TzParams params);
	/**保存日志管理
	 * 作者 smile
	 * 时间 2016年06月11日  18:22:14
	 * @param params
	 * @return
	 */
	public int Save(AdminStat adminstat);
	/**更新日志管理
	 * 作者 smile
	 * 时间 2016年06月11日  18:22:14
	 * @param params
	 * @return
	 */
	public int  Update(AdminStat adminstat);
	/**删除 日志管理
	 * 作者 smile
	 * 时间 2016年06月11日  18:22:14
	 * @param params
	 * @return
	 */
	public int Delete(TzParams params);
	/**查询 日志管理
	 * 作者 smile
	 * 时间 2016年06月11日  18:22:14
	 * @param params
	 * @return
	 */
	 public AdminStat getAdminStat(Integer id);
	 
		/**查询 日志内容
		 * 作者 smile
		 * 时间 2016年06月11日  18:22:14
		 * @param params
		 * @return
		 */
	 public List<HashMap<String,Object>> groupContent(TzParams params);
		/**统计每一天每一时刻的用户注册量
		 * 作者 smile
		 * 时间 2016年06月11日  18:22:14
		 * @param params
		 * @return
		 */
	 public List<HashMap<String,Object>> groupUsers(TzParams params);
	
	
}
