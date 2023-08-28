package com.geomin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@GetMapping("/write")
	public String write() {
		return "/manager/write";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam("bno") String bno, Model model) {
	    
		if(bno != null && !"".equals(bno)) {
			BoardVO vo = new BoardVO();
			
			vo.setBno(bno);
			
			vo = board.getOne(vo); 
			
			System.out.println(vo);
			
			model.addAttribute("board", vo);
		}
		
		
	    return "/manager/write";
	}
	
	@PostMapping("/boardList")
	public @ResponseBody Map<String, Object> boardList(@RequestBody Criteria cri, HttpSession session) {
		
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
			return responseMap(REST_FAIL, "리스트 조회중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/boardView")
	public @ResponseBody Map<String, Object> boardView(@RequestBody BoardVO vo) {
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			BoardVO boardVo = board.getOne(vo);
			
			System.out.println(boardVo);
			
			map.put("result", "success");
			map.put("boardVO",boardVo);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "리스트 조회중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/boardEdit")
	public @ResponseBody Map<String, Object> boardEdit(@RequestBody BoardVO vo) {
		
		try {
			board.boardUpdate(vo);
			
			return responseMap(REST_SUCCESS, "Q&A가 수정되었습니다.");

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "Q&A 수정중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/boardDelete")
	public @ResponseBody Map<String, Object> boardDelete(@RequestBody BoardVO vo) {
		
		try {
			board.boardDelete(vo);
			
			return responseMap(REST_SUCCESS, "Q&A가 삭제되었습니다.");

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "Q&A 삭제중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/boardWrite")
	public @ResponseBody Map<String, Object> boardWrite(@RequestBody BoardVO vo) {
		
		try {
			int res = board.boardWrite(vo);
			
			Map<String, Object> map = responseWriteMap(res);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "리스트 등록중 예외사항이 발생 하였습니다.");
		}
	}
	
}
