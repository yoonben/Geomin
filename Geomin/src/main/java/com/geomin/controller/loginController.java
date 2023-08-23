package com.geomin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geomin.VO.memberVO;
import com.geomin.service.loginService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/geomin*")
@Log4j
public class loginController extends CommonRestController{

	@Autowired
	loginService loginService;
	
	public int idcheck(memberVO memberVo) {
		int res = loginService.idCheck(memberVo);
		return 0;
	}
	
	
	
	
	@GetMapping("/joinMember")
	public String joinMember() {
		return "joinMember";
	}
	
}
