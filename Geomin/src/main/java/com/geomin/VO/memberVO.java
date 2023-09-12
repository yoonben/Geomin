package com.geomin.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class memberVO {

	private String memberid;
	private String mname;
	private String mpassword;
	private String mtype;
	private String mphone;
	private String memail;
	private String maddr;
	private String mbirthdate;
	private String mgender;
	private String adminyn;
	private String marketingagree;
	
	//추가 (teacherMapper)에서 사용
	private String sname;
	private String pkgname;
	private String groupid;
	private String person;
	private String joinStatus;
	private String groupResDate;
	private String studentid;
	private String groupjoinstatus;
	private String groupmem;
	
}

