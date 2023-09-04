package com.geomin.VO;

import lombok.Data;

@Data
public class homeworkVO {

	private String homeworkno;
	private String studentid;
	private String groupid;
	private String pkgid;
	private String memberid;
	private String deadlinedate;
	private String homeworkcont;
	private String submitdate;
	private String studycont;
	private String evaluation; 
	
	//추가
	private String person;
	private String groupResDate;
	private String joinStatus;
	
	// 숙제 전송 페이지 추가
	private String sname; 
	private String mphone; 
	private String memail; 
	private String mbirthdate; 
}
