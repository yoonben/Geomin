package com.geomin.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.groupstudentVO;
import com.geomin.VO.packageVO;

@Service
public interface studentService {

	// 그룹조회
	public List<packageVO> groupList();
	
	// 그룹조회
		public List<packageVO> teacherGroupList(packageVO pkg);
	
	public packageVO groupOne(packageVO pkg);
	
	// 그룹가입 신청
	public int groupjoin(groupstudentVO groupstudent);
}
