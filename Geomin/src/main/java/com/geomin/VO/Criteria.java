package com.geomin.VO;

import lombok.Data;

@Data
public class Criteria {
	
	private String searchField; // 검색 조건
	private String searchWord;	// 검색어
	private String groupid;
	
	int pageNo = 1;		// 요청 페이지 번호
	int amount = 10;	// 한페이지당 게시물 수
	
	int startNo = 1;
	int endNo = 10;
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		if(pageNo>0) {
			endNo = pageNo * amount;
			
			startNo = pageNo * amount - (amount-1);
		}
	}
}
