package com.academy.spr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.academy.spr.domain.BoardDto;

public interface BoardMapper {

	List<BoardDto> selectAllBoard(@Param("from")int from, @Param("rowPerPage")int rowPerPage);

	int countBoard();

	int insertBoard(BoardDto board);

	BoardDto selectBoard(int id);

	int updateBoard(BoardDto board);

	int deleteBoard(int id);

	int selectSearchCountBoard(String title);

	List<BoardDto> searchAllBoard(@Param("from")int from, @Param("rowPerPage")int rowPerPage, @Param("title")String title);

}
