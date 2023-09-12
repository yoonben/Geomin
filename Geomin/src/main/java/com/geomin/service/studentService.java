package com.geomin.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.groupstudentVO;
import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;

@Service
public interface studentService {

	// 그룹조회
	public List<packageVO> groupList();
	
	// 선생님 검색
	public memberVO teacherSearch(String mname);
	
	// 그룹조회
	public List<packageVO> teacherGroupList(String memberid);
	
	public packageVO groupOne(packageVO pkg);
	
	// 그룹가입 신청
	public int groupjoin(groupstudentVO groupstudent);
}
