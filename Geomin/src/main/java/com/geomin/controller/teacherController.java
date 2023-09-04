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

import com.geomin.VO.contentVO;
import com.geomin.VO.homeworkVO;
import com.geomin.VO.memberVO;
import com.geomin.mapper.homeworkMapper;
import com.geomin.service.contentService;
import com.geomin.service.homeworkService;
import com.geomin.service.teacherService;

@Controller
@RequestMapping("/geomin*")
public class teacherController extends CommonRestController{
	
	@Autowired
	private contentService helloService;
	
	@Autowired
	teacherService teacherService;
	
	@Autowired
	homeworkService homeworkservice;
	
	/*
	@GetMapping("/teacher/teacherMain")
	public String groupjoin() {
		return "/teacher/teacherMain";
	}
	*/
	
	@GetMapping("/teacher/groupRegist")
	public String groupRegist(Model model) {
		List<contentVO> list = helloService.getSubList();
		model.addAttribute("list", list);
		return "/teacher/groupRegist";
	}
	
	
	
	// 그룹 신청한 학습자 리스트
	@GetMapping("/teacher/teacherMain")
	public String getGroup(Model model, memberVO vo) {
		
		List<memberVO> list = teacherService.contentList();	
		model.addAttribute("contentRes", list);		
		
		return "/teacher/teacherMain";
	}
	
	// 그룹 신청한 학습자 조회
	@PostMapping("/contentId")
	public @ResponseBody Map<String, Object> studentjoin(@RequestBody memberVO vo, Model model) {
		
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			List<memberVO> membervo = teacherService.contentOne();
			
			map.put("membervo", membervo);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
		}
	}
	
	
	
	//그룹선택 후 숙제 전송 리스트 
	@GetMapping("/teacher/homework")
	public String getHomework(Model model, homeworkVO homework) {
		
		List<homeworkVO> list = homeworkservice.groupList();
		model.addAttribute("groupList", list);		
		
		return "/teacher/teacherMain";
	}
	
	// 그룹선택하면 학생리스트 출력
	@PostMapping("/homework")
	public @ResponseBody Map<String, Object> studentSelect(@RequestBody homeworkVO vo, Model model) {
		
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			homeworkVO homeworkvo = homeworkservice.studentSelect(vo); 
			
			map.put("homeworkvo", homeworkvo);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
		}
	}
	
}
