package com.geomin.VO;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class HelloVO {
	private String pkgName;
	private int personnel;
	private String fixedPrice;
	private String finalPrice;
	private String difficulty;
	private String pkgContent;
	
	private String memberID;
	private String subsDate;
	
	private String mType;
	private String buyCheck;
	
//	@JsonIgnore
//	private String memberID;
//	
//	@JsonIgnore
//	private String subsDate;
//	
//	@JsonIgnore
//    public String getMemberID() {
//        return memberID;
//    }
//	
//	@JsonIgnore
//    public String setMemberID() {
//        return memberID;
//    }
//	
//	@JsonIgnore
//    public String setSubsDate() {
//        return subsDate;
//    }
//	
//    @JsonIgnore
//    public String getSubsDate() {
//        return subsDate;
//    }
}
