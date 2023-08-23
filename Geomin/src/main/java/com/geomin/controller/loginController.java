package com.geomin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.service.loginService;


@Controller
@RequestMapping("/geomin*")
public class loginController extends CommonRestController{

	@Autowired
	loginService loginService;
	
	/*
	// 회원가입 시 아이디 중복체크
	@PostMapping("/idCheck")
	public @ResponseBody Map<String, Object> idcheck(@RequestBody memberVO memberVo) {
		int res = loginService.idCheck(memberVo);
		
		if(res == 0) {
			return responseMap(REST_SUCCESS, "사용가능한 아이디 입니다.");
		} else {
			return responseMap(REST_FAIL, "이미 사용중인 아이디 입니다.");			
		}
	}
	*/
	

	//@PostMapping("/idCheck")
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(@RequestParam(name="loginId") String loginId, HttpServletRequest req) throws Exception {
	 

	 String memberidVal = req.getParameter("loginId");
	 System.out.println("memberid=========" + memberidVal);
	
//	 if(memberidVal.equals("")) {	// || 
//		 System.out.println("도착했어요");
//		 memberVO idCheck =  loginService.idCheck(memberidVal);
//		 System.out.println("idCheck=========" + idCheck);
//	 }
//	 
//	 System.out.println("그냥 통과");
	 //String memberidVal = req.getParameter("loginId");

	 if (memberidVal != null && !memberidVal.equals("")) {
		 System.out.println("fff");
	 } else {
		 System.out.println("도착했어요");
	     System.out.println("값이 없습니다.");
	 }

	 //System.out.println("그냥 통과");
	 System.out.println("memberid=========" + memberidVal);
	 int idCheck =  loginService.idCheck(memberidVal);
	 System.out.println("idCheck=========" + idCheck);
	 
	 int result = 0;
	 
	 if(idCheck == 1 ) {
		 result = 1;
	 } 
	 return result;
	}
	

	 
	 
	
	@GetMapping("/joinMember")
	public String joinMember() {
		return "joinMember";
	}
	
}
