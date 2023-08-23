package com.geomin.VO;

import lombok.Data;

@Data
public class RegionCri {
	private String megaregion; //검색조건
	private String smallregion;  //검색조건
	private String sort;  //검색조건
	
	private int pageNo = 1;		//요청 페이지 번호
	private int amount = 12;	//한 페이지당 게시물 수
	
	private int startNo = 1;
	private int endNo 	= 12;

	//pageNo 값만 바뀌어도 endNo,startNo가 같이 바뀜
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		if(pageNo>0) {
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount-1);
		}
	}
}
