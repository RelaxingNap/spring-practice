package com.academy.spr.mapper;

import java.util.List;

import com.academy.spr.domain.ReplyDto;

public interface ReplyMapper {

	int insertReply(ReplyDto reply);

	List<ReplyDto> selectAllReply(int boardId);

	int updateReply(ReplyDto reply);

	int deleteReply(ReplyDto reply);

	void deleteAllReply(int boardId);

}
