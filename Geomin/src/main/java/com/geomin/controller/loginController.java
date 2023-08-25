package com.geomin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@Autowired
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
			int res = loginService.register(memberVo);
			System.out.println("memberVo===================(2)" + memberVo);
				if(res == 0) {
					return "/joinMember";
				} else {
					return "/login";
				}
			//TODO : 데이터 저장이 성공한 경우에만 페이지 이동을 하도록 조건을 추가
			
		} catch (Exception e) {
			System.err.println("회원가입 중 예외발생하였습니다.");
			e.printStackTrace();
		}
	
		return "/login";
	}
	
	
	// 로그인 처리 
	@PostMapping(value = "/main", produces = "application/json")
	public @ResponseBody Map<String, Object> loginAction(@RequestBody memberVO member
														, Model model
														, HttpSession session) {
		System.out.println("id" + member.getMemberid());
		System.out.println("pw" + member.getMpassword());
		
		memberVO membervo = loginService.login(member);
		
		if(membervo != null && pwdEncoder.matches(member.getMpassword(), membervo.getMpassword())) {
			session.setAttribute("member", membervo);
			session.setAttribute("memberid", membervo.getMemberid());
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "로그인 되었습니다.");
			
			//if(membervo.getRole() != null && member.getRole().contains("ADMIN ROLE")) {
				//그룹 등록되어있으면 메인페이지로 이동 / 그룹등록 안되어 있으면 그룹등록 페이지 이동 
				map.put("url", "/geomin/main");   //★login.jsp이동후 로그인시 이동하는 페이지 수정  (function loginCheck)
			//} else {
			//	map.put("url", "/board/list");				
			//}
			
			return map;
		} else {
			
			return responseMap(REST_FAIL, "아이디와 비밀번호를 확인해주세요.");
		}
	}

	
	
	 
	
	@GetMapping("/joinMember")
	public String joinMember() {
		return "joinMember";
	}
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@GetMapping("/joinMemberInfo")
	public String joinMemberInfo() {
		return "joinMemberInfo";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
	
	
	/*
	//회원정보  조회
	@RequestMapping(value = "/geomin/joinMemberInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String getOne(HttpSession session, memberVO vo, Model model) {
		try {
			memberVO member = (memberVO) session.getAttribute("memberid");
			//하나의 회원 조회
			memberVO membervo = loginService.getOne(member.getMemberid());

			session.setAttribute("member", membervo);
		    
			return "/joinMemberInfo";
			
		} catch (Exception e) {
			return "";
		}
	}

*/
	
	
}
