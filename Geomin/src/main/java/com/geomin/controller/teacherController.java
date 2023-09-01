package com.geomin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.VO.contentVO;
import com.geomin.service.contentService;

@Controller
@RequestMapping("/geomin*")
public class teacherController {
	
	@Autowired
	private contentService helloService;
	
	@GetMapping("/teacher/teacherMain")
	public String groupjoin() {
		return "/teacher/teacherMain";
	}
	
	@GetMapping("/teacher/groupRegist")
	public String groupRegist(Model model) {
		List<contentVO> list = helloService.getSubList();
		model.addAttribute("list", list);
		return "/teacher/groupRegist";
	}
}
