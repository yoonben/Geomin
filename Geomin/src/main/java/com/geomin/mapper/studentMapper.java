package com.geomin.mapper;

import java.awt.List;

import com.geomin.VO.packageVO;

public interface studentMapper {

	// 그룹조회
	public List groupSearch(String groupid);
	
	// 학습자가 그룹신청시 그룹목록에 따른 정보 조회하는 메서드
	public packageVO getGroup(packageVO pkg); 
}
