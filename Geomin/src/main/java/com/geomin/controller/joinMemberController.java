package com.geomin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/geomin*")
public class joinMemberController {

	@GetMapping("/joinMember")
	public String joinMember() {
		return "joinMember";
	}
	
}
