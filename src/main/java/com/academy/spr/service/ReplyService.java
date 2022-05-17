package com.academy.spr.service;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.spr.domain.ReplyDto;
import com.academy.spr.mapper.ReplyMapper;

@Service
public class ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
	
	public boolean writeReply(ReplyDto reply) {
		reply.setInserted(LocalDateTime.now());
		
		int cnt = replyMapper.insertReply(reply);
		return cnt == 1;
	}

}
