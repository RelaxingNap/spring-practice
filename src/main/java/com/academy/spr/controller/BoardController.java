package com.academy.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.academy.spr.domain.BoardDto;
import com.academy.spr.domain.PageInfoDto;
import com.academy.spr.domain.ReplyDto;
import com.academy.spr.service.BoardService;
import com.academy.spr.service.ReplyService;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("list")
	public void listBoard(@RequestParam(name = "page", defaultValue = "1")int page, 
			@RequestParam(name = "keyword", required = false) String keyword, Model model) {
		int rowPerPage = 0;
		
		if(keyword != null) {
			rowPerPage = 5;
		} else {
			rowPerPage = 7;
		}
				
		List<BoardDto> list = boardService.searchListBoard(page, rowPerPage, keyword);
		int totalRecord = boardService.searchCountBoard(keyword);
		
		int endPage = (totalRecord - 1) / rowPerPage + 1;
		
		PageInfoDto pageInfo = new PageInfoDto();
		pageInfo.setCurrentPage(page);
		pageInfo.setEndPage(endPage);
		
		model.addAttribute("keyword", keyword);
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
		List<ReplyDto> list = replyService.listReply(id);
		
		model.addAttribute("board", board);
		model.addAttribute("replyList", list);
		
		return "board/get";
	}
		
	@PostMapping("modify")
	public String modifyBoard(BoardDto board) {
		boolean success = boardService.modifyBoard(board);
		
		return "redirect:/board/" + board.getId();
	}
	
	@PostMapping("remove")
	@Transactional
	public String removeBoard(int id) {
		
		replyService.removeAllReply(id);
				
		boolean success = boardService.removeBoard(id);
		
		return "redirect:/board/list";
	}
		
}
