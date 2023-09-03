package com.geomin.mapper;



import java.util.List;

import com.geomin.VO.groupstudentVO;
import com.geomin.VO.packageVO;

public interface studentMapper {

	// 그룹조회
	public List<packageVO> groupList();
	
	// 학습자가 그룹신청시 그룹목록에 따른 정보 조회하는 메서드
	public List<packageVO> getGroup(packageVO pkg); 
	
	public packageVO groupOne(packageVO pkg);
	
	// 그룹가입 신청
	public int groupjoin(groupstudentVO groupstudent);
}
