package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.Criteria;
import com.geomin.VO.homeworkVO;

public interface homeworkMapper {
	
		// 그룹조회
		public List<homeworkVO> homeworkGroupList(homeworkVO vo);
		
		public List<homeworkVO> studentSelect(Criteria cri);
		
		public int totalCnt(Criteria cri);
		
		public int homeworkUpdate(homeworkVO vo);
		
		public List<homeworkVO> studentHomeworkList(homeworkVO vo);
		
		public int studentHomework(homeworkVO vo);
		
		public List<homeworkVO> homeworkEva(Criteria cri);
		
		public int evaTotalCnt(Criteria cri);
		
		public int HomeworkEva(homeworkVO vo);
		
		public homeworkVO homeworkGetOne (homeworkVO vo);
}
