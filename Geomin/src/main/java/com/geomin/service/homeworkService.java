package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.Criteria;
import com.geomin.VO.homeworkVO;

@Service
public interface homeworkService {
	
	// 그룹조회
	public List<homeworkVO> homeworkGroupList(homeworkVO vo);
	
	public List<homeworkVO> studentSelect(Criteria cri);
	
	public int totalCnt(Criteria cri);
	
	public int homeworkUpdate(homeworkVO vo);
	
	public List<homeworkVO> studentHomeworkList(homeworkVO vo);
	
	public int studentHomework(homeworkVO vo);
}
