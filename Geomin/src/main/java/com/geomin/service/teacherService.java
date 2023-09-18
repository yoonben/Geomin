package com.geomin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.geomin.VO.contentVO;
import com.geomin.VO.groupstudentVO;
import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;

@Service
public interface teacherService {

	// 그룹조회
	public List<packageVO> contentList(String memberid);
	
	//그룹 선택
	public List<memberVO> contentOne(memberVO vo);
	
	public int totalGroupStu(String groupid);
	
	public int totalgroupmem(String groupid);
	
	public int updateJoinStatus(@Param("studentid") String studentid,@Param("groupid") String groupid);
	
	public int curpersonnelUP(String pkgid);
	
	public int curpersonnelDown(String pkgid);
	
	public groupstudentVO groupjoinstatusOne(@Param("studentid") String studentid,@Param("groupid") String groupid);

	List<contentVO> getSubGroup(@Param("pkgName") String pkgName, @Param("memberID") String memberID);


	public int checkGroupid(String groupid) throws Exception;

	List<contentVO> getSubList2(String memberID);

	int delStudyGroup(@Param("pkgName") String pkgName/* , @Param("memberID") String memberID */) throws Exception;

	public int regStudyGroup(List<contentVO> groupData); //@Param("memberM")
	public int regStudyGroup2(List<contentVO> groupData);
}
