package com.service.content.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.filter.AutoLoad;
import com.bean.Content;
import com.bean.TzParams;
import com.dao.content.IContentMapper;
import com.service.content.IContentService;
import com.util.TmStringUtils;

@Service
public class ContentService implements IContentService {
	@Autowired
	private IContentMapper contentMapper;
	
	@Override
	public List<Content> findContents(TzParams params){
		if(TmStringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return contentMapper.findContent(params);
	}

	@Override
	public Content getContent(Integer id) {
		return contentMapper.getContent(id);
	}

	@Override
	public int save(Content content) {
		return contentMapper.Save(content);
	}

	@Override
	public int update(Content content) {
		return contentMapper.Update(content);
	}

	@Override
	public int delete(TzParams params) {
		return contentMapper.Delete(params);
	}

	@Override
	public int countContent(TzParams params) {
		
		return contentMapper.countContent(params);
	}

}
