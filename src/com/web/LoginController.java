package com.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.TzParams;
import com.bean.AdminUser;
import com.core.BaseController;
import com.service.user.IAdminUserService;
import com.util.TmStringUtils;
import static com.util.TzConstant.*;

@Controller
public class LoginController extends BaseController{
	@Autowired
	IAdminUserService services;
	
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
								  session.setAttribute("session_user",user);
						    	  session.setAttribute("session_user_username", user.getUsername());
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

