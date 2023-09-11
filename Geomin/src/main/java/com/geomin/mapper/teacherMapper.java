package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.contentVO;
import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;

public interface teacherMapper {

	// 그룹조회
	public List<memberVO> contentList();
	
	
	// public String contentList1(String memberID);
	
	//그룹 선택
	public List<memberVO> contentOne(memberVO vo);
	

	public List<contentVO> regSubinfo();
	
	//그룹가입 승인
	//public int updateJoinStatus(List<String> memberIds);
	public int updateJoinStatus(List<memberVO> memberidOutput_list);

	List<contentVO> getSubGroup();

	void regStudyGroup(List<contentVO> groupData);

	
	//★그룹아이디 중복처리
	//public int checkGroupid(String groupid);
	public List<memberVO> checkGroupid(memberVO vo);

	
	
}
