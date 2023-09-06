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
	public List<homeworkVO> homeworkGroupList() {
		return homeworkmapper.homeworkGroupList();
	}

	@Override
	public List<homeworkVO> studentSelect(Criteria cri) {
		return homeworkmapper.studentSelect(cri);
	}

	@Override
	public int totalCnt(Criteria cri) {
		
		return homeworkmapper.totalCnt(cri);
	}


}
