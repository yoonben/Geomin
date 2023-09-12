package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.contentVO;
import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;

@Service
public interface teacherService {

	// 그룹조회
	public List<packageVO> contentList(String memberid);
	
	//그룹 선택
	public List<memberVO> contentOne(memberVO vo);

	
	//그룹 가입 승인
	//public int updateJoinStatus(List<String> memberIds);
	public int updateJoinStatus(List<memberVO> memberidOutput_list);

	List<contentVO> getSubGroup();

	public void regStudyGroup(List<contentVO> groupData);

	
	//★그룹아이디 중복처리
	//public int checkGroupid(String groupid);
	//public List<contentVO> checkGroupid(contentVO vo);
	
	public int checkGroupid(contentVO groupid);

	
}
