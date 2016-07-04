package com.web.adminstat;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.AdminStat;
import com.bean.TzParams;
import com.service.adminstat.IAdminStatService;
@Controller
@RequestMapping("/admin/adminstat")
public class AdminStatController {
	@Autowired 
	private IAdminStatService  adminservice;
	@RequestMapping("/list")
	public String  List(TzParams  params){
		return "adminstat/list";
	}
	@RequestMapping("/template")
	public ModelAndView  template(){
		ModelAndView  modelAndView=new ModelAndView();
		modelAndView.setViewName("adminstat/template");
		TzParams  params=new TzParams();
	     params.setIsDelete(0);
		int count=adminservice.count(params);
		List<AdminStat> adminstats=adminservice.findAdminStats(params);
		modelAndView.addObject("datas",adminstats);
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String  update(AdminStat adminstat){
		adminservice.update(adminstat);
		return "success";
	}
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String  delete(TzParams params){
		adminservice.delete(params);	
		return "success";
	}
	//用户统计列表查询
	@RequestMapping(value="/userlist")
	public  String userList(TzParams  params){
		return "adminstat/userlist";
	}
	//内容统计列表
	@RequestMapping(value="/contentlist")
	public  String contentList(TzParams  params){
		return "adminstat/contentlist";
	}
	@ResponseBody
    @RequestMapping(value="/groupContent",method=RequestMethod.POST)
    public List<HashMap<String,Object>> groupContent(TzParams params){
         List<HashMap<String,Object>> datas=adminservice.groupContent(params);
         return datas;
    }
	@ResponseBody
    @RequestMapping(value="/groupUsers",method=RequestMethod.POST)
    public List<HashMap<String,Object>> groupUsers(TzParams params){
         List<HashMap<String,Object>> datas=adminservice.groupUsers(params);
         return datas;
    }
}
