package com.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.AdminUser;
import com.bean.TzParams;
import com.core.BaseController;
import com.service.role.IRoleService;
import com.service.user.IUserService;
import com.util.TmStringUtils;

@Controller
public class LoginController extends BaseController{
	@Autowired
	IUserService services;
	
	@Autowired
	IRoleService  roleService;
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	//登录方法
	@ResponseBody
	@RequestMapping(value="/logined",method=RequestMethod.POST)
	public  String logined(TzParams params){
		if(params!=null){
			 if(TmStringUtils.isNotEmpty(params.getEmail())&&TmStringUtils.isNotEmpty(params.getPassword())){
					 params.setPassword(TmStringUtils.md5Base64(params.getPassword()));
					 /*System.out.println(params.getAccount()+"=++++++++="+params.getPassword());*/
					  AdminUser  user=services.getLogin(params);
				      if(user!=null){
				    		 if(user.getForbiden()==0){
								 return "forbiden";
							 }else{
								  //获取当前的用户角色
//								  HashMap<String, Object> roleMap=roleService.findRolesByUserId(user.getId());
//								  session.setAttribute("SESSION_USER_ROLE",roleMap);
								  session.setAttribute("session_user",user); 
						    	  session.setAttribute("session_user_username", user.getUsername());
//								  session.setAttribute("SESSION_USER",user); 
//						    	  session.setAttribute("SESSION_USER_USERNAME", user.getUsername());
						    	  //日记监控用户行为和获取请求参数
								   request.getServletContext().setAttribute("user_log", user);
								   request.getServletContext().setAttribute("request_log", request);
						    	  return "success";
							 }
				      }else{
				    	   return "fail";  
				      } 
			    }else{
			    	return "null";
			    	
			    } 
		}else{	
			
			return "error";
		}
		  
	      
	}
	//退出
	@RequestMapping("/logout")
	public String logout(){
		 session.invalidate();
		return "redirect:login";
		
	}
	

}

