package com.geomin.VO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class contentVO {
	private String pkgId;
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
	
	private String groupid;
	
	private Date studyStartDate;
	private Date studyEndDate;
	
	private int curGuoup;
	
	private int groupMem;
	
	//모든 학습 컨텐츠 출력
	public contentVO(String pkgId, String pkgName, int Personnel, String fixedPrice, String finalPrice, String difficulty,String pkgContent
			) {
		this.pkgId = pkgId;
		this.pkgName = pkgName;
		this.Personnel = Personnel;
		this.fixedPrice = fixedPrice;
		this.finalPrice = finalPrice;
		this.difficulty = difficulty;
		this.pkgContent = pkgContent;
	}
	
	//선택된 학습 컨텐츠 처리
	public contentVO(String pkgId, String memberID, String pkgName, Date subsDate, int Personnel, String finalPrice) {
		this.pkgId = pkgId;
		this.memberID = memberID;
		this.pkgName = pkgName;
		this.subsDate = subsDate;
		this.Personnel = Personnel;
		this.finalPrice = finalPrice;
	}

	//구독한 학습 컨텐츠 출력
	public contentVO(String pkgName, int personnel, String difficulty, String pkgContent, Date subsDate, String groupid) {
		this.pkgName = pkgName;
		this.Personnel = personnel;
		this.difficulty = difficulty;
		this.pkgContent = pkgContent;
		this.subsDate = subsDate;
		this.groupid = groupid;
	}
	
	//
//	public contentVO() {
//		
//	}

}
