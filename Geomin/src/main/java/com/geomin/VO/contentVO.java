package com.geomin.VO;

import java.sql.Date;

import lombok.Data;

@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class contentVO {
	private String pkgID;
	private String pkgName;
	private int Personnel;
	private String fixedPrice;
	private String finalPrice;
	private String difficulty;
	private String pkgContent;

	private String memberID;
	private Date subsDate;

	private String mType;
	private String buyCheck;

	private int curPersonnel;
	
	public contentVO() {
		super();
	}
	
	public contentVO(String pkgID, String pkgName, int Personnel, String fixedPrice, String finalPrice, String difficulty,
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

	public contentVO(String pkgID, String memberID, String pkgName, Date subsDate, int Personnel, String finalPrice) {
		super();
		this.pkgID = pkgID;
		this.memberID = memberID;
		this.pkgName = pkgName;
		this.subsDate = subsDate;
		this.Personnel = Personnel;
		this.finalPrice = finalPrice;
	}


}
