package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;

public interface teacherMapper {

	// 그룹조회
	public List<memberVO> contentList();
	
	
	// public String contentList1(String memberID);
	
	//그룹 선택
	public List<memberVO> contentOne();
}
