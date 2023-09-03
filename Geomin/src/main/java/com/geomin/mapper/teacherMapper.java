package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;

public interface teacherMapper {

	// 그룹조회
	public List<memberVO> contentList();
	
	//그룹 선택
	public memberVO contentOne(memberVO vo);
}
