package com.geomin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.VO.Criteria;
import com.geomin.VO.PageDto;
import com.geomin.VO.packageVO;
import com.geomin.service.ManagerService;


@Controller
@RequestMapping("/geomin*")
public class ManagerController extends CommonRestController{
	
	@Autowired
	ManagerService manager;
	
	@GetMapping("/manager")
	public String Manager() {
		return "/manager/garden";
	}
	
	@GetMapping("/board")
	public String board() {
		return "/manager/board";
	}
	
	@GetMapping("/salesTally")
	public String salesTally() {
		return "/manager/salesTally";
	}
	
	@GetMapping("/salesInquiry")
	public String salesInquiry() {
		return "/manager/salesInquiry";
	}
	
	@GetMapping("/qanda")
	public String qanda() {
		return "/manager/qanda";
	}
	
	@PostMapping("/packageInsert")
	public @ResponseBody Map<String, Object> packageInsert(@RequestBody packageVO vo, Model model) {
		
		try {
			int res = manager.packageInsert(vo);
			
			Map<String, Object> map = responseWriteMap(res);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 등록중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/packgeList")
	public @ResponseBody Map<String, Object> packgeList(@RequestBody Criteria cri) {
		
		try {
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			// 리스트 조회
			List<packageVO> packagelist = manager.packageList(cri);
			int total = manager.totalCnt(cri);
			PageDto  pageDto = new PageDto(cri, total);
			
			map.put("packagelist", packagelist);
			map.put("total", total);
			map.put("pageDto", pageDto);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 등록중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/packDeleteUpdate")
	public @ResponseBody Map<String, Object> packDeleteUpdate(@RequestBody packageVO vo) {
		
		try {
			
			int res = manager.packDeleteUpdate(vo);
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "정상적으로 처리 되었습니다.");
			
			map.put("pageNo", "1");
			
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 삭제중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/packUdate")
	public @ResponseBody Map<String, Object> packUdate(@RequestBody packageVO vo) {
		
		try {
			
			packageVO pakc = manager.getOnePack(vo);
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "정상적으로 처리 되었습니다.");
			
			map.put("packageVO", pakc);
			
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 삭제중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/packUdatelist")
	public @ResponseBody Map<String, Object> packUdatelist(@RequestBody packageVO vo) {
		
		try {
			
			int res = manager.packUpdate(vo);
			
			packageVO pakc = manager.getOnePack(vo);
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "정상적으로 처리 되었습니다.");
			
			map.put("packageVO", pakc);
			
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 삭제중 예외사항이 발생 하였습니다.");
		}
	}
}
