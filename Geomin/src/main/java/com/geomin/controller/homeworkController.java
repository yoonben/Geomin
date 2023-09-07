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
import com.geomin.VO.homeworkVO;
import com.geomin.service.homeworkService;

@Controller
@RequestMapping("/geomin*")
public class homeworkController extends CommonRestController{
	
	@Autowired
	homeworkService homeworkservice;
	
	 
	@GetMapping("/teacher/homeworkMain")
	public String getHomework(Model model, homeworkVO homework) {
		
		return "/teacher/homeworkMain";
	}
	// 그룹 리스트 조회
	@PostMapping("/homeworkGroup")
	public @ResponseBody Map<String, Object> homeworkGroup(@RequestBody homeworkVO vo) {
		try {
				Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
				
				List<homeworkVO> groupList = homeworkservice.homeworkGroupList(vo);
				
				map.put("groupList", groupList);
				
				return map;
			
			} catch (Exception e) {
				e.printStackTrace();
				
				
				return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
			}
	}
	
	// 그룹선택하면 학생리스트 출력
	@PostMapping("/homeworkID")
	public @ResponseBody Map<String, Object> studentSelect(@RequestBody Criteria cri) {
		
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			List<homeworkVO> homeworklist = homeworkservice.studentSelect(cri);
			
			int total = homeworkservice.totalCnt(cri);
			
			
			PageDto  pageDto = new PageDto(cri, total);
			
			
			map.put("homeworklist", homeworklist);
			map.put("pageDto", pageDto);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
		}
	}
}
