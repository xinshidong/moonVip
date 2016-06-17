package com.web.content;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.bean.Content;
import com.bean.TzParams;
import com.service.content.IContentService;
import java.util.*;

@Controller
@RequestMapping("/admin/content")
public class ContentController {
	
	 @Autowired 
	 private IContentService  contentService;
	@RequestMapping("/list")
	public String  List(TzParams  params){
		return "content/list";
	}
	@RequestMapping("/template")
	public ModelAndView  template(){
		ModelAndView  modelAndView=new ModelAndView();
		modelAndView.setViewName("content/template");
		TzParams  params=new TzParams();
		int count=contentService.countContent(params);
		List<Content> contents=contentService.findContents(params);
		modelAndView.addObject("datas",contents);
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	
	

}
