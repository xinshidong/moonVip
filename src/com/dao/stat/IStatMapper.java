package com.dao.stat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bean.TzParams;
public interface IStatMapper{
  
	/**查找日志管理
	 * 作者 smile
	 * 时间 2016年06月11日  18:22:14
	 * @param params
	 * @return
	 */
	@Autowired
	public List<HashMap<String,Object>> groupContents(TzParams params);
	
}
