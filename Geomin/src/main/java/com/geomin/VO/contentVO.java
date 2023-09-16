package com.geomin.VO;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class contentVO {
	private String pkgId;
	private String pkgName;
	private int personnel;
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
	
	private int curGroup;
	
	private int groupMem;
	private int totalgroupMem;
	private int possiblegroupMem;

	//모든 학습 컨텐츠 출력
	public contentVO(String pkgId, String pkgName, int personnel, String fixedPrice, String finalPrice, String difficulty, String pkgContent
			) {
		this.pkgId = pkgId;
		this.pkgName = pkgName;
		this.personnel = personnel;
		this.fixedPrice = fixedPrice;
		this.finalPrice = finalPrice;
		this.difficulty = difficulty;
		this.pkgContent = pkgContent;
	}
	
	//선택된 학습 컨텐츠 처리
	public contentVO(String pkgId, String memberID, String pkgName, Date subsDate, int personnel, String finalPrice) {
		this.pkgId = pkgId;
		this.memberID = memberID;
		this.pkgName = pkgName;
		this.subsDate = subsDate;
		this.personnel = personnel;
		this.finalPrice = finalPrice;
	}

	//구독한 학습 컨텐츠 출력
	public contentVO(String pkgName, int personnel, String difficulty, String pkgContent, Date subsDate, String groupid, String buyCheck) {
		this.pkgName = pkgName;
		this.personnel = personnel;
		this.difficulty = difficulty;
		this.pkgContent = pkgContent;
		this.subsDate = subsDate;
		this.groupid = groupid;
		this.buyCheck = buyCheck;
	}
	
	//
//	public contentVO() {
//		
//	}

}
