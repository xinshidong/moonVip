package com.web.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Content;
import com.bean.TzParams;
import com.service.content.IContentService;

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
	     params.setIsDelete(0);
		int count=contentService.count(params);
		List<Content> contents=contentService.findContents(params);
		modelAndView.addObject("datas",contents);
		modelAndView.addObject("itemCount",count);
		return modelAndView;
	}
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String  update(Content content){
		contentService.update(content);
		return "success";
	}
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String  delete(TzParams params){
		contentService.delete(params);	
		return "success";
	}
	

}
