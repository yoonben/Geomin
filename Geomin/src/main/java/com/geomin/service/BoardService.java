package com.geomin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geomin.VO.BoardVO;
import com.geomin.VO.Criteria;
import com.geomin.mapper.BoardMapper;

@Service
public class BoardService implements BoardServiceImpl{
	
	@Autowired
	BoardMapper board;
	
	@Override
	public List<BoardVO> noticeList() {
		
		List<BoardVO> list = board.noticeList();
		
		return list;
	}

	@Override
	public List<BoardVO> boardList(Criteria cri) {
		List<BoardVO> list = board.boardList(cri);
		
		return list;
	}

	@Override
	public int totalCnt(Criteria cri) {
		int total = board.totalCnt(cri);
		return total;
	}

	@Override
	public BoardVO getOne(BoardVO vo) {
		
		BoardVO boardvo = board.getOne(vo);
		
		return boardvo;
	}
	
	@Override
	public int boardWrite(BoardVO vo) {
		int res = board.boardWrite(vo);
		return res;
	}
}
