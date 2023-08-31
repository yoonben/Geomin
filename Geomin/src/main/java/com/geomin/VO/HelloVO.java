package com.geomin.VO;

import lombok.Data;

@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class HelloVO {
	private String pkgID;
	private String pkgName;
	private int Personnel;
	private String fixedPrice;
	private String finalPrice;
	private String difficulty;
	private String pkgContent;

	private String memberID;
	private String subsDate;

	private String mType;
	private String buyCheck;

	public HelloVO() {
		super();
	}
	
	public HelloVO(String pkgID, String pkgName, int Personnel, String fixedPrice, String finalPrice, String difficulty,
			String pkgContent) {
		super();
		this.pkgID = pkgID;
		this.pkgName = pkgName;
		this.Personnel = Personnel;
		this.fixedPrice = fixedPrice;
		this.finalPrice = finalPrice;
		this.difficulty = difficulty;
		this.pkgContent = pkgContent;
	}

	public HelloVO(String pkgID, String memberID, String pkgName, String subsDate, int Personnel, String finalPrice) {
		super();
		this.pkgID = pkgID;
		this.memberID = memberID;
		this.pkgName = pkgName;
		this.subsDate = subsDate;
		this.Personnel = Personnel;
		this.finalPrice = finalPrice;
	}


}
