package com.academy.spr.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.spr.domain.BoardDto;
import com.academy.spr.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	public List<BoardDto> listBoard(int page, int rowPerPage) {
		int from = (page - 1) * rowPerPage;
		
		return boardMapper.selectAllBoard(from, rowPerPage);
	}

	public int countBoard() {
		return boardMapper.countBoard();
	}

	public boolean addBoard(BoardDto board) {
		board.setInserted(LocalDateTime.now());
		int cnt = boardMapper.insertBoard(board);
		
		return cnt == 1;
	}

	public BoardDto getBoard(int id) {
		return boardMapper.selectBoard(id);
	}

	public boolean modifyBoard(BoardDto board) {
		int cnt = boardMapper.updateBoard(board);
		
		return cnt == 1;
	}

	public boolean removeBoard(int id) {
		int cnt = boardMapper.deleteBoard(id);
		return cnt == 1;
	}

}