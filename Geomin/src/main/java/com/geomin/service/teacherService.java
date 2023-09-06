package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.contentVO;
import com.geomin.VO.memberVO;

@Service
public interface teacherService {

	// 그룹조회
	public List<memberVO> contentList();
	//public String contentList1(String memberID);
	
	//그룹 선택
	public List<memberVO> contentOne(memberVO vo);

	public List<contentVO> regSubinfo();
	
	//그룹 가입 승인
	public int updateJoinStatus(memberVO vo);
	
}