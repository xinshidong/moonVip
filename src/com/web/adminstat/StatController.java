package com.web.adminstat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.TzParams;
import com.service.adminstat.IStatService;
@Controller
@RequestMapping("/admin/stat")
public class StatController{
	@Autowired 
	private IStatService  statService;
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public   List<HashMap<String,Object>>  List(TzParams  params){
	  List<HashMap<String,Object>> datas=statService.groupContent(params);
		return datas;
	}

}
