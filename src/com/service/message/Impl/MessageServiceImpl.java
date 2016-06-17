package com.service.message.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.filter.AutoLoad;
import com.bean.Message;
import com.bean.TzParams;
import com.dao.message.IMessageMapper;
import com.service.message.IMessageService;
import com.util.TmStringUtils;

@Service
public class MessageServiceImpl implements IMessageService {
	@Autowired
	private IMessageMapper MessageMapper;
	
	@Override
	public List<Message> findMessages(TzParams params){
		if(TmStringUtils.isEmpty(params.getOrder()))params.setOrder("create_time desc");
		return MessageMapper.findMessage(params);
	}

	@Override
	public Message getMessage(Integer id) {
		return MessageMapper.getMessage(id);
	}

	@Override
	public int save(Message message) {
		return MessageMapper.Save(message);
	}

	@Override
	public int update(Message message) {
		return MessageMapper.Update(message);
	}

	@Override
	public int delete(TzParams params) {
		return MessageMapper.Delete(params);
	}

}
