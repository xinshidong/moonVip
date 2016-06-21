package com.dao.message;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.bean.Message;
import com.bean.TzParams;

public interface IMessageMapper{
  
	/**查找信息管理
	 * 作者 ksmile
	 * 时间 2016年05月31日  22:49:48
	 * @param params
	 * @return
	 */
	@Autowired
	public List<Message> findMessage(TzParams params);
	/**保存信息管理
	 * 作者 ksmile
	 * 时间 2016年05月31日  22:49:48
	 * @param params
	 * @return
	 */
	//求总数
    public int 	count(TzParams params);
	
	public int Save(Message message);
	/**更新信息管理
	 * 作者 ksmile
	 * 时间 2016年05月31日  22:49:48
	 * @param params
	 * @return
	 */
	public int  Update(Message message);
	/**删除 信息管理
	 * 作者 ksmile
	 * 时间 2016年05月31日  22:49:48
	 * @param params
	 * @return
	 */
	public int  Delete(TzParams params);
	/**查询 信息管理
	 * 作者 ksmile
	 * 时间 2016年05月31日  22:49:48
	 * @param params
	 * @return
	 */
	 public Message getMessage(Integer id);
	
	
}
