package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.homeworkVO;

@Service
public interface homeworkService {
	
	// 그룹조회
	public List<homeworkVO> homeworkGroupList();
	
	public List<homeworkVO> studentSelect(homeworkVO homework);
}
