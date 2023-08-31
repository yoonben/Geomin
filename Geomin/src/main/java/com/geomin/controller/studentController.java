package com.geomin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/geomin*")
public class studentController {

	@GetMapping("/studentStudy/groupjoin")
	public String groupjoin() {
		return "/studentStudy/groupjoin";
	}
	
	
	
}
