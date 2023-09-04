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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.VO.groupstudentVO;
import com.geomin.VO.packageVO;
import com.geomin.service.studentService;

@Controller
@RequestMapping("/geomin*")
public class studentController extends CommonRestController{

	@Autowired
	studentService studentService;
	
	
	


	// 그룹 신청에서 그룹 조회 후 가입신청
	@GetMapping("/studentStudy/groupjoin")
	public String getGroup(Model model, packageVO pkg) {
		
		List<packageVO> list = studentService.groupList();		
		model.addAttribute("groupRes", list);		
		
		return "/studentStudy/groupjoin";
	}

	
	@PostMapping("/groupId")
	public @ResponseBody Map<String, Object> groupPick(@RequestBody packageVO vo, Model model) {
		
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			packageVO packagevo = studentService.groupOne(vo);
			
			System.out.println("packagevo : "+packagevo);
			
			map.put("packagevo", packagevo);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 등록중 예외사항이 발생 하였습니다.");
		}
	}
	
	
	//그룹가입 신청
	@PostMapping("/groupjoin")
	public @ResponseBody Map<String, Object> groupjoinInsert(@RequestBody groupstudentVO vo, Model model) {
		
		try {
			
			System.out.println("groupjoin (vo) : "+vo);
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "그룹 신청 완료!");
			
			int groupstudent = studentService.groupjoin(vo);
			
			if(groupstudent > 0) {
				
				map.put("groupstudent", groupstudent);
			}
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 등록중 예외사항이 발생 하였습니다.");
		}
	}
	
	
}
