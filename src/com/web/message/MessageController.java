package com.web.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.bean.Message;
import com.bean.TzParams;
import com.service.message.IMessageService;
import java.util.*;

@Controller
@RequestMapping("/admin/Message")
public class MessageController {
	
	 @Autowired 
	 private IMessageService messageService;
	 @RequestMapping("/list")
	public ModelAndView  List(){
		ModelAndView  modelAndView=new ModelAndView();
		modelAndView.setViewName("message/list");
		TzParams  params=new TzParams();
		List<Message> messages=messageService.findMessages(params);
		modelAndView.addObject("datas",messages );
		return modelAndView;
	}
	
	

}
