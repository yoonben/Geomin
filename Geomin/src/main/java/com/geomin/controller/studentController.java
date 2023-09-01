package com.geomin.controller;

import java.awt.List;
import java.util.HashMap;
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

import com.geomin.VO.packageVO;
import com.geomin.service.studentService;

@Controller
@RequestMapping("/geomin*")
public class studentController extends CommonRestController{

	@Autowired
	studentService studentService;
	// 그룹 신청 페이지 이동
	@GetMapping("/studentStudy/groupjoin")
		public String groupjoin() {
			return "/studentStudy/groupjoin";
	}

	// 그룹 신청에서 그룹 조회 후 가입신청
	@PostMapping("/studentStudy/groupjoin")
	public String getGroup(Model model, packageVO pkg) {
		
		List groupRes = studentService.groupSearch(pkg.getGroupid());
		System.out.println("groupRes=================="+groupRes);
		
		
			packageVO groupSelect = studentService.getGroup(pkg);
			System.out.println("groupSelect=======================" + groupSelect);
			
			model.addAttribute("groupSelect", groupSelect);			
			model.addAttribute("groupRes", groupRes);			
			
		
		return "/studentStudy/groupjoin";
	}

	
	
	
}
