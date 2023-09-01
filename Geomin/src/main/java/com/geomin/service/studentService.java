package com.geomin.service;



import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.packageVO;

@Service
public interface studentService {

	// 그룹조회
	public List<packageVO> groupList();
	
	// 학습자가 그룹신청시 그룹목록에 따른 정보 조회하는 메서드
	public List<packageVO> getGroup(packageVO pkg); 
	
	public packageVO groupOne(packageVO pkg);
}
