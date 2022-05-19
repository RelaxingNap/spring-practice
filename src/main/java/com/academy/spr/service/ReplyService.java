package com.academy.spr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.spr.domain.ReplyDto;
import com.academy.spr.mapper.ReplyMapper;

@Service
public class ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
	
	public boolean writeReply(ReplyDto reply) {
				
		int cnt = replyMapper.insertReply(reply);
		return cnt == 1;
	}

	public List<ReplyDto> listReply(int boardId) {
		
		return replyMapper.selectAllReply(boardId);
	}

	public boolean modifyReply(ReplyDto reply) {
		int cnt = replyMapper.updateReply(reply);
		return cnt == 1;
	}

	public boolean removeReply(ReplyDto reply) {
		int cnt = replyMapper.deleteReply(reply);
		return cnt == 1;
	}

	public void removeAllReply(int boardId) {
		replyMapper.deleteAllReply(boardId);	
	}

}
