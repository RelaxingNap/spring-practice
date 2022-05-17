package com.academy.spr.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class BoardDto {
	
	private int replyNum;
	private int id;
	private String title;
	private String content;
	private LocalDateTime inserted;
}
