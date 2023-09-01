package com.geomin.VO;

import lombok.Data;

@Data
public class PackagepriceVO {

	public String salesdate;
	public String pkgid;
	public String transactioncnt;
	public String datetotalsales;
	
	public String pkgname; 
	// 차트 년도를 위해 사용한 VO 
	public String year;
	public String month;
	public String day;
	public String day1;
	public String day2;
}
