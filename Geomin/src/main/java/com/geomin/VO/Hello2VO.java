package com.geomin.VO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Hello2VO {
	private String pkgID;
	private String memberID;
	private String pkgName;
	private String subsDate;
	private int Personnel;
	private String finalPrice;
	
//	public Hello2VO(String pkgID, String memberID, String pkgName, String subsDate, int Personnel, String finalPrice) {
//		super();
//		this.pkgID = pkgID;
//		this.memberID = memberID;
//		this.pkgName = pkgName;
//		this.subsDate = subsDate;
//		this.Personnel = Personnel;
//		this.finalPrice = finalPrice;
//	}
}
