package com.academy.spr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.academy.spr.domain.BoardDto;
import com.academy.spr.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
		
	public boolean addBoard(BoardDto board) {
		
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

	public int searchCountBoard(String keyword) {
		if(keyword == null) {
			keyword = "";
		}
		
		keyword.trim();
		keyword = "%" + keyword + "%";
		
		return boardMapper.selectSearchCountBoard(keyword);
	}

	public List<BoardDto> searchListBoard(int page, int rowPerPage, String keyword) {
		if(keyword == null) {
			keyword = "";
		}
		
		keyword.trim();
		keyword = "%" + keyword + "%";
		int from = (page - 1) * rowPerPage;
		
		return boardMapper.selectSearchAllBoard(from, rowPerPage, keyword);
	}

}
