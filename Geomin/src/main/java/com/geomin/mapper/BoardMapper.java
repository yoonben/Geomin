package com.geomin.mapper;

import java.util.List;

import com.geomin.VO.BoardVO;
import com.geomin.VO.Criteria;

public interface BoardMapper {
	public List<BoardVO> noticeList();
	
	public  List<BoardVO> boardList(Criteria cri);
	
	public int totalCnt(Criteria cri);

	public BoardVO getOne(BoardVO vo);
	
	public int boardWrite(BoardVO vo);
}
