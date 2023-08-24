package com.geomin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	//비밀번호 암호화
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
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
	
	

	//회원가입 (DB저장)
	@PostMapping("/login")
	public String register(@ModelAttribute memberVO memberVo){
		
		System.out.println("memberVo===================(1)" + memberVo);
		try {
			
			System.out.println("생일=================" + memberVo.getMbirthdate());
			System.out.println("memberVo===================(1)" + memberVo);
			String inputPw = memberVo.getMpassword();
			String pwd = pwdEncoder.encode(inputPw);
			memberVo.setMpassword(pwd);
			loginService.register(memberVo);
			System.out.println("memberVo===================(2)" + memberVo);

			//TODO : 데이터 저장이 성공한 경우에만 페이지 이동을 하도록 조건을 추가
			return "/login";
			
		} catch (Exception e) {
			System.err.println("회원가입 중 예외발생하였습니다.");
			e.printStackTrace();
		}
	
		return "/login";
	}
	



	 
	
	@GetMapping("/joinMember")
	public String joinMember() {
		return "joinMember";
	}
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
}
