package com.geomin.service;

import java.util.List;

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
	public groupstudentVO groupjoinstatusOne(String studentid) {
		// TODO Auto-generated method stub
		return teachermapper.groupjoinstatusOne(studentid);
	}
	
/*	
	@Override
	public String contentList1(String memberID) {
		return teachermapper.contentList1(memberID);
	}
*/

	@Override
	public List<contentVO> getSubGroup() {
		// TODO Auto-generated method stub
		return teachermapper.getSubGroup();
	}

	@Override
	public void regStudyGroup(List<contentVO> groupData) {
		teachermapper.regStudyGroup(groupData);
		
	}

//	@Override
//	public int updateJoinStatus(List<String> memberIds) {
//		return teachermapper.updateJoinStatus(memberIds);
//	}
	@Override
	public int updateJoinStatus(String studentid) {
		return teachermapper.updateJoinStatus(studentid);
	}


	@Override
	public int checkGroupid(String groupid) throws Exception {
		// TODO Auto-generated method stub
		return teachermapper.checkGroupid(groupid);
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
