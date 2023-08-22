package com.geomin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Geomin/subscribe/*")
public class HelloController {
	
	@GetMapping("searchContent")
	public String searchContent(){
		return "/subscribe/searchContent";
	}
	
	
	
}
