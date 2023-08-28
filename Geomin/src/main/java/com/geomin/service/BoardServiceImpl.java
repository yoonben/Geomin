package com.geomin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.geomin.VO.BoardVO;
import com.geomin.VO.Criteria;

@Service
public interface BoardServiceImpl {
	public List<BoardVO> noticeList();
	
	public List<BoardVO> boardList(Criteria cri);
	
	public BoardVO getOne(BoardVO vo);
	
	public int totalCnt(Criteria cri);
	
	public int boardWrite(BoardVO vo);
	
	public int boardUpdate(BoardVO vo);
	
	public int boardDelete(BoardVO vo);
}
