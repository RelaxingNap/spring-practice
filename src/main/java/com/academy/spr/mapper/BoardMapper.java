package com.academy.spr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.academy.spr.domain.BoardDto;

public interface BoardMapper {
	
	int insertBoard(BoardDto board);

	BoardDto selectBoard(int id);

	int updateBoard(BoardDto board);

	int deleteBoard(int id);

	int selectSearchCountBoard(String title); // 검색어 있는경우와 없는경우 상관없이 적용

	List<BoardDto> selectSearchAllBoard(@Param("from")int from, 
			@Param("rowPerPage")int rowPerPage, 
			@Param("title")String title); // 검색어 있는경우와 없는경우 상관없이 적용
}
