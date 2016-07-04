package com.service.message;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bean.Message;
import com.bean.TzParams;


@Service
public interface IMessageService {

	List<Message> findMessages(TzParams params);

	Message getMessage(Integer id);
	//求总数
	public int 	count(TzParams params);

	int save(Message message);

	int delete(TzParams params);

	int update(Message  message);
	
	/*@Autowired
	public List<Message> findMessage(TzParams params);
	*/

}

