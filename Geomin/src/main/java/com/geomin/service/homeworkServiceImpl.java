package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.homeworkVO;
import com.geomin.mapper.homeworkMapper;

@Service
public class homeworkServiceImpl implements homeworkService {

	@Autowired
	homeworkMapper homeworkmapper;
	
	@Override
	public List<homeworkVO> groupList() {
		return homeworkmapper.groupList();
	}

	@Override
	public homeworkVO studentSelect(homeworkVO homework) {
		return homeworkmapper.studentSelect(homework);
	}

}
