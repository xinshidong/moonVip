package com.web;

import javax.annotation.security.RolesAllowed;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
@RequestMapping("/admin")
public class IndexController {
	
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	
	
	

}
