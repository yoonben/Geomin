package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.homeworkVO;

public interface homeworkMapper {
	
		// 그룹조회
		public List<homeworkVO> homeworkGroupList();
		
		public List<homeworkVO> studentSelect(homeworkVO homework);
}