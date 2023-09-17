package com.geomin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.contentVO;
import com.geomin.VO.groupstudentVO;
import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;
import com.geomin.mapper.teacherMapper;

@Service
public class teacherServiceImpl implements teacherService{

	@Autowired
	teacherMapper teachermapper;
	
	@Override
	public List<packageVO> contentList(String memberid) {
		return teachermapper.contentList(memberid);
	}

	@Override
	public List<memberVO> contentOne(memberVO vo) {
		return teachermapper.contentOne(vo);
	}
	
	@Override
	public int totalGroupStu(String groupid) {
		// TODO Auto-generated method stub
		return teachermapper.totalGroupStu(groupid);
	}
	
	@Override
	public int totalgroupmem(String groupid) {
		// TODO Auto-generated method stub
		return teachermapper.totalgroupmem(groupid);
	}
	
	@Override
	public int curpersonnelUP(String pkgid) {
		// TODO Auto-generated method stub
		return teachermapper.curpersonnelUP(pkgid);
	}
	
	@Override
	public int curpersonnelDown(String pkgid) {
		// TODO Auto-generated method stub
		return teachermapper.curpersonnelDown(pkgid);
	}
	
	@Override
	public groupstudentVO groupjoinstatusOne(String studentid, String groupid) {
		// TODO Auto-generated method stub
		return teachermapper.groupjoinstatusOne(studentid, groupid);
	}
	
/*	
	@Override
	public String contentList1(String memberID) {
		return teachermapper.contentList1(memberID);
	}
*/

	@Override 
	public List<contentVO> getSubGroup(String pkgName, String memberID) {
		// TODO Auto-generated method stub
		return teachermapper.getSubGroup(pkgName, memberID);
	}

	@Override
	public int regStudyGroup(List<contentVO> groupData) {
		return teachermapper.regStudyGroup(groupData);
		
	}

//	@Override
//	public int updateJoinStatus(List<String> memberIds) {
//		return teachermapper.updateJoinStatus(memberIds);
//	}
	@Override
	public int updateJoinStatus(String studentid, String groupid) {
		return teachermapper.updateJoinStatus(studentid, groupid);
	}


	@Override
	public int checkGroupid(String groupid) throws Exception {
		// TODO Auto-generated method stub
		return teachermapper.checkGroupid(groupid);
	}
	
	@Override
	public List<contentVO> getSubList2(String memberID) {
		// TODO Auto-generated method stub
		return teachermapper.getSubList2(memberID);
	}

	@Override
	public int delStudyGroup(String pkgName/* , String memberID */) throws Exception{
		return teachermapper.delStudyGroup(pkgName/* , memberID */);
		
	}
	
	//★그룹아이디 중복처리
	/*
	 * @Override public int checkGroupid(String groupid) { return
	 * teachermapper.checkGroupid(groupid); }
	 */
//	@Override
//	public List<contentVO> checkGroupid(contentVO vo) {
//		return teachermapper.checkGroupid(vo);
//	}



}
