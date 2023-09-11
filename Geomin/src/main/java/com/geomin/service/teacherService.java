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

	
	//그룹 가입 승인
	//public int updateJoinStatus(List<String> memberIds);
	public int updateJoinStatus(List<memberVO> memberidOutput_list);

	List<contentVO> getSubGroup();

	public void regStudyGroup(List<contentVO> groupData);

	
	//★그룹아이디 중복처리
	//public int checkGroupid(String groupid);
	public List<memberVO> checkGroupid(memberVO vo);

	
}
