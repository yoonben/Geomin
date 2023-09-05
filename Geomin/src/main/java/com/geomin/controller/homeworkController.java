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

import com.geomin.VO.homeworkVO;
import com.geomin.service.homeworkService;

@Controller
@RequestMapping("/geomin*")
public class homeworkController extends CommonRestController{
	
	@Autowired
	homeworkService homeworkservice;
	
	//그룹선택 후 숙제 전송 리스트 
	@GetMapping("/teacher/homeworkMain")
	public String getHomework(Model model, homeworkVO homework) {
		
		List<homeworkVO> list = homeworkservice.homeworkGroupList();
		model.addAttribute("homeworkGroupList", list);		
		
		System.out.println("list :==========" + list);
		
		return "/teacher/homeworkMain";
	}
	
	// 그룹선택하면 학생리스트 출력
	@PostMapping("/homeworkID")
	public @ResponseBody Map<String, Object> studentSelect(@RequestBody homeworkVO vo, Model model) {
		
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			List<homeworkVO> homeworkvo = homeworkservice.studentSelect(vo);
			
			System.out.println("homeworkvo :==========" + homeworkvo);
			
			map.put("homeworkvo", homeworkvo);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
		}
	}
}
