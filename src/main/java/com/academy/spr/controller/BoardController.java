package com.academy.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.academy.spr.domain.BoardDto;
import com.academy.spr.domain.PageInfoDto;
import com.academy.spr.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list")
	public void listBoard(@RequestParam(name = "page", defaultValue = "1")int page, Model model) {
		int rowPerPage = 5;
		List<BoardDto> list = boardService.listBoard(page, rowPerPage);
		int totalRecord = boardService.countBoard();
		int endPage = (totalRecord - 1) / rowPerPage + 1;
		
		PageInfoDto pageInfo = new PageInfoDto();
		pageInfo.setCurrentPage(page);
		pageInfo.setEndPage(endPage);
		
		model.addAttribute("boardList", list);
		model.addAttribute("pageInfo", pageInfo);
	}
	
	@GetMapping("write")
	public void writeBoard() {
		
	}
	
	@PostMapping("write")
	public String writeBoard(BoardDto board) {
		boolean success = boardService.addBoard(board);
			
		return "redirect:/board/" + board.getId();
	}
	
	@GetMapping("{id}")
	public String getBoard(@PathVariable("id")int id, Model model) {
		BoardDto board = boardService.getBoard(id);
		
		model.addAttribute("board", board);
		
		return "board/get";
	}
	
	@GetMapping("modify")
	public void modifyBoard() {
		
	}
	
	@PostMapping("modify")
	public String modifyBoard(BoardDto board) {
		boolean success = boardService.modifyBoard(board);
		
		return "redirect:/board/" + board.getId();
	}
	
	@PostMapping("remove")
	public String removeBoard(int id) {
		boolean success = boardService.removeBoard(id);
		
		return "redirect:/board/list";
	}
	
	
}
