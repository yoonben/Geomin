package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.contentVO;
import com.geomin.VO.groupstudentVO;
import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;

public interface teacherMapper {
	
	// 그룹조회
	public List<packageVO> contentList(String memberid);
	
	//그룹 선택
	public List<memberVO> contentOne(memberVO vo);
	
	public int totalGroupStu(String groupid);
	
	public int totalgroupmem(String groupid);
	
	public int curpersonnelUP(String pkgid);
	
	public int curpersonnelDown(String pkgid);
	
	public groupstudentVO groupjoinstatusOne(String studentid);
	
	public List<contentVO> regSubinfo();
	
	//그룹가입 승인
	public int updateJoinStatus(String studentid);

	List<contentVO> getSubGroup();

	void regStudyGroup(List<contentVO> groupData);
	
	
	//★그룹아이디 중복처리
	//public int checkGroupid(String groupid);
	public int checkGroupid(String groupid);

	
	
}
