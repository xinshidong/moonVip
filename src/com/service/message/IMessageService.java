package com.service.message;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bean.Message;
import com.bean.TzParams;


@Service
public interface IMessageService {

	List<Message> findMessages(TzParams params);

	Message getMessage(Integer id);

	int save(Message message);

	int delete(TzParams params);

	int update(Message  message);
	
	/*@Autowired
	public List<Message> findMessage(TzParams params);
	*/

}

