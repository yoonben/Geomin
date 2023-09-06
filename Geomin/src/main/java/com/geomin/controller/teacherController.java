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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.VO.contentVO;
import com.geomin.VO.memberVO;
import com.geomin.service.contentService;
import com.geomin.service.teacherService;

@Controller
@RequestMapping("/geomin*")
public class teacherController extends CommonRestController{
	
	@Autowired
	teacherService teacherService;
	
	/*
	@GetMapping("/teacher/teacherMain")
	public String groupjoin() {
		return "/teacher/teacherMain";
	}
	*/
	
//	@GetMapping("/teacher/groupRegist")
//	public String groupRegist(Model model) { 
//		List<contentVO> list1 = teacherService.getSubGroup();
//		model.addAttribute("list2", list1);
//		
//		return "/teacher/groupRegist";
//	}
	
	@GetMapping("/teacher/groupRegist")
	public String groupRegist(@RequestParam("pkgName") String pkgName, Model model) { 
		List<contentVO> list1 = teacherService.getSubGroup();
		model.addAttribute("list2", list1);
		
		model.addAttribute("pkgName", pkgName);
		return "/teacher/groupRegist";
	}
	
	@PostMapping("/teacher/groupRegist")
	public void groupRegist2(@RequestBody List<contentVO> groupData, Model model) {
		System.out.println("groupData : " + groupData);
		teacherService.regStudyGroup(groupData);
	}
	
	// 그룹 신청한 학습자 리스트
	@GetMapping("/teacher/teacherMain")
	public String getGroup(Model model) {
		
		List<memberVO> list = teacherService.contentList();	
		model.addAttribute("contentRes", list);		
		
		return "/teacher/teacherMain";
	}
	
	
	// 그룹 신청한 학습자 조회
	@PostMapping("/contentId")
	public @ResponseBody Map<String, Object> studentjoin(@RequestBody memberVO vo, Model model) {
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			List<memberVO> membervo = teacherService.contentOne(vo);
			
			System.out.println("membervo : " + membervo);
			map.put("membervo", membervo);
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
		}
	}
	
	
	

	
}
