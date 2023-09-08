package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.Criteria;
import com.geomin.VO.homeworkVO;
import com.geomin.VO.memberVO;
import com.geomin.mapper.homeworkMapper;

@Service
public class homeworkServiceImpl implements homeworkService {

	@Autowired
	homeworkMapper homeworkmapper;
	
	@Override
	public List<homeworkVO> homeworkGroupList(homeworkVO vo) {
		return homeworkmapper.homeworkGroupList(vo);
	}

	@Override
	public List<homeworkVO> studentSelect(Criteria cri) {
		return homeworkmapper.studentSelect(cri);
	}

	@Override
	public int totalCnt(Criteria cri) {
		
		return homeworkmapper.totalCnt(cri);
	}

	@Override
	public int homeworkUpdate(homeworkVO vo) {
		
		return homeworkmapper.homeworkUpdate(vo);
	}

	@Override
	public List<homeworkVO> studentHomeworkList(homeworkVO vo) {
		
		return homeworkmapper.studentHomeworkList(vo);
	}

	@Override
	public int studentHomework(homeworkVO vo) {
		
		return homeworkmapper.studentHomework(vo);
	}

	@Override
	public List<homeworkVO> homeworkEva(Criteria cri) {
		
		return homeworkmapper.homeworkEva(cri);
	}

	@Override
	public int evaTotalCnt(Criteria cri) {
		
		return homeworkmapper.evaTotalCnt(cri);
	}

	@Override
	public int HomeworkEva(homeworkVO vo) {
		
		return homeworkmapper.HomeworkEva(vo);
	}

	@Override
	public homeworkVO homeworkGetOne(homeworkVO vo) {
		
		return homeworkmapper.homeworkGetOne(vo);
	}


}
