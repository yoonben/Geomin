package com.geomin.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class packageVO {
	
	public int pkgid;
	public String pkgname;
	public String difficulty;
	public int personnel;
	public String fixedprice;
	public String discountrate;
	public String finalprice;
	public String pkgcontent;
	public String elimination;
	public int curpersonnel; 
	
	//추가
	public String period;
	public String mname;
	public String person;
	public String groupid;
	
	public packageVO(String pkgname, String difficulty, String pkgcontent, String mname, String person,
			String groupid, String period) {
		this.pkgname = pkgname;
		this.difficulty = difficulty;
		this.pkgcontent = pkgcontent;
		this.mname = mname;
		this.person = person;
		this.groupid = groupid;
		this.period = period;
	} 
	
	
	
	
	
	
}
