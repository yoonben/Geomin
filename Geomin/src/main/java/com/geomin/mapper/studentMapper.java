package com.geomin.mapper;



import java.util.List;

import com.geomin.VO.groupstudentVO;
import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;

public interface studentMapper {

	// 그룹조회
	public List<packageVO> groupList();
	
	// 선생님 검색
	public memberVO teacherSearch(String mname);
	
	// 선생님이름으로 그룹조회
	public List<packageVO> teacherGroupList(String memberid);
		
	public packageVO groupOne(packageVO pkg);
	
	// 그룹가입 신청
	public int groupjoin(groupstudentVO groupstudent);
}
