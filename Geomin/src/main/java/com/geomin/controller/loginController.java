package com.geomin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.VO.memberVO;
import com.geomin.service.loginService;


@Controller
@RequestMapping("/geomin*")
public class loginController extends CommonRestController{

	@Autowired
	loginService loginService;
	
	// 회원가입 시 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(@RequestParam(name="loginId") String loginId, HttpServletRequest req) throws Exception {

	 String memberidVal = req.getParameter("loginId");
	 System.out.println("memberid=========" + memberidVal);

	 int idCheck =  loginService.idCheck(memberidVal);
	 System.out.println("idCheck=========" + idCheck);
	 
	 int result = 0;
	 
	 if(idCheck == 1 ) {
		 result = 1;
	 } 
	 return result;
	}
	
	@PostMapping("/login")
	public String register(memberVO memberVo ) {
		try {
			String join = loginService.register(memberVo);
			
		} catch (Exception e) {
			System.err.println("회원가입 중 예외발생하였습니다.");
		}
	
		return "/geomin/login";
	}
	/*
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postRegister(memberVO vo) throws Exception {
		
		loginService.register(vo);
		
		return null;
	}
*/
	 
	 
	
	@GetMapping("/joinMember")
	public String joinMember() {
		return "joinMember";
	}
	
}
