package com.geomin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.VO.BoardVO;
import com.geomin.VO.Criteria;
import com.geomin.VO.PageDto;
import com.geomin.service.BoardService;

@Controller
@RequestMapping("/geomin*")
public class BoardController extends CommonRestController{

	@Autowired
	BoardService board;
	
	@PostMapping("/boardList")
	public @ResponseBody Map<String, Object> boardList(@RequestBody Criteria cri) {
		
		try {
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			// 공지 사항 리스트 조회
			List<BoardVO> noticeList = board.noticeList();
			
			map.put("noticeList", noticeList);
			
			// Q&A 리스트 조회
			List<BoardVO> boardList = board.boardList(cri);
			int total = board.totalCnt(cri);
			PageDto  pageDto = new PageDto(cri, total);
			
			map.put("boardList", boardList);
			map.put("total", total);
			map.put("pageDto", pageDto);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 등록중 예외사항이 발생 하였습니다.");
		}
	}
	
}
