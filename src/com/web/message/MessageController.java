package com.web.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Message;
import com.bean.TzParams;
import com.service.message.IMessageService;

@Controller
@RequestMapping("/admin/message")
public class MessageController {
	
	 @Autowired 
	 private IMessageService messageService;
	 @RequestMapping("/list")
	public String  List(TzParams  params){
			return "message/list";
		}
	@RequestMapping("/template")
	public ModelAndView  List(){
		ModelAndView  modelAndView=new ModelAndView();
		modelAndView.setViewName("message/template");
		TzParams  params=new TzParams();
		int count=messageService.count(params);
		List<Message> messages=messageService.findMessages(params);
		modelAndView.addObject("datas",messages );
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	
	

}
