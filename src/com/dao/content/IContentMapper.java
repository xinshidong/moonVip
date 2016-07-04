package com.dao.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bean.Content;
import com.bean.TzParams;

public interface IContentMapper {
  
	/**查找所有的内容
	 * 
	 * @param params
	 * @return
	 */
	@Autowired
	public List<Content> findContent(TzParams params);
	//求总数
    public int 	count(TzParams params);
	
	public Content getContent(Integer id);
	/**保存内容
	 * 
	 * @param params
	 * @return
	 */
	public int Save(Content content);
	/**更新内容
	 * 
	 * @param params
	 * @return
	 */
	public int  update(Content content);
	/**删除  内容
	 * 
	 * @param params
	 * @return
	 */
	public int  delete(TzParams params);
	
    public  Content  get(Integer id);
	
	
}
