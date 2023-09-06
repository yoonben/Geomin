package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.contentVO;
import com.geomin.VO.memberVO;
import com.geomin.mapper.teacherMapper;

@Service
public class teacherServiceImpl implements teacherService{

	@Autowired
	teacherMapper teachermapper;
	
	@Override
	public List<memberVO> contentList() {
		return teachermapper.contentList();
	}

	@Override
	public List<memberVO> contentOne(memberVO vo) {
		return teachermapper.contentOne(vo);
	}
/*
	@Override
	public String contentList1(String memberID) {
		return teachermapper.contentList1(memberID);
	}
*/

	@Override
	public List<contentVO> regSubinfo() {
		// TODO Auto-generated method stub
		return teachermapper.regSubinfo();
	}

	@Override
	public int updateJoinStatus(memberVO vo) {
		return teachermapper.updateJoinStatus(vo);
	}
}