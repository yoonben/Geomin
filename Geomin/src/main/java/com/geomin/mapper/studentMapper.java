package com.geomin.mapper;



import java.util.List;

import com.geomin.VO.groupstudentVO;
import com.geomin.VO.packageVO;

public interface studentMapper {

	// 그룹조회
	public List<packageVO> groupList();
	
	public packageVO groupOne(packageVO pkg);
	
	// 그룹가입 신청
	public int groupjoin(groupstudentVO groupstudent);
}
