package com.service.adminstat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.TzParams;

@Service
public interface IStatService{
  
	/**查找日志管理
	 * 作者 smile
	 * 时间 2016年06月11日  18:22:14
	 * @param params
	 * @return
	 */
	@Autowired
	public List<HashMap<String,Object>> groupContent(TzParams params);
	
}
