package com.academy.spr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.academy.spr.domain.ReplyDto;
import com.academy.spr.service.ReplyService;

@Controller
@RequestMapping("reply")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@PostMapping("write")
	public String writeReply(ReplyDto reply) {
		boolean success = replyService.writeReply(reply);
		
		return "redirect:/board/" + reply.getBoardId();
	}
	
	@PostMapping("modify")
	public String modifyReply(ReplyDto reply) {
		
		boolean success = replyService.modifyReply(reply);
		
		return "redirect:/board/"+ reply.getBoardId();
	}
	
	@PostMapping("remove")
	public String removeReply(ReplyDto reply) {
		
		boolean success = replyService.removeReply(reply);
		
		return "redirect:/board/" + reply.getBoardId();
	}
	
}
