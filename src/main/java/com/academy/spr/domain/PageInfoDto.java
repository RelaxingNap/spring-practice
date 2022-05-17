package com.academy.spr.domain;

import lombok.Data;

@Data
public class PageInfoDto {
	private int currentPage;
	private int endPage;
	
	public int getLeft() {
		return Math.max(1, currentPage - 2);
	}
	
	public int getRight() {
		return Math.min(endPage, currentPage + 2);
	}
}
