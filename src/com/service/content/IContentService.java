package com.service.content;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bean.Content;
import com.bean.TzParams;

@Service
public interface IContentService {

	List<Content> findContents(TzParams params);
	
	//求总数
    public int 	count(TzParams params);

	Content getContent(Integer id);

	int save(Content content);

	int delete(TzParams params);

	int update(Content content);
	
	/*@Autowired
	public List<Content> findContent(TzParams params);
	*/

}
