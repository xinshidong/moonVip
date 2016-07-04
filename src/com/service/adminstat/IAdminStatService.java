package com.service.adminstat;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bean.AdminStat;
import com.bean.TzParams;

@Service
public interface IAdminStatService {

	List<AdminStat> findAdminStats(TzParams params);

	AdminStat getAdminStat(Integer id);
	public int 	count(TzParams params);

	int Save(AdminStat adminstat);

	int delete(TzParams params);

	int update(AdminStat  adminstat);
	
    public List<HashMap<String,Object>> groupContent(TzParams params);
	
	/*@Autowired
	public List<AdminStat> findAdminStat(TzParams params);
	*/
    public List<HashMap<String,Object>> groupUsers(TzParams params);

}

