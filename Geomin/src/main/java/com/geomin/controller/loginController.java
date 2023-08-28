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
			//TODO : 그룹 등록되어있으면 숙제페이지로 이동 / 그룹등록 안되어 있으면 그룹등록 페이지 이동 처리하기! 
				map.put("url", "/geomin/main");   //★login.jsp이동후 로그인시 이동하는 페이지 수정  (function loginCheck)
			//} else {
			//	map.put("url", "/board/list");				
			//}
			
			return map;
		} else {
			
			return responseMap(REST_FAIL, "아이디와 비밀번호를 확인해주세요.");
		}
	}

	
	
	// 아이디 찾기
	@PostMapping("/findId")
	public @ResponseBody Map<String, Object> findId(@RequestBody memberVO member){
		
		int nameRes = loginService.nameCheck(member);
		int phoneRes = loginService.phoneCheck(member);
		
		if(nameRes > 0 && phoneRes > 0) {
			memberVO findId = loginService.findId(member);
			
			Map<String, Object> map
					= responseMap(REST_SUCCESS, "아이디는 [ " + findId.getMemberid() + " ] 입니다.");
			map.put("url", "/geomin/login");
			return map;
		} else {
			return responseMap(REST_FAIL, "이름과 휴대폰 번호를 다시 확인해주세요.");			
		}
	}
	
	// 비밀번호 찾기
	@PostMapping("/findPw")
	public @ResponseBody Map<String, Object> findPw(@RequestBody memberVO member){
		
		System.out.println("member======================" +  loginService.nameCheckPw(member));
		int nameResPw = loginService.nameCheckPw(member);
		int phoneResPw = loginService.phoneCheckPw(member);
		int memberid = loginService.idCheckPw(member);

	    
	    
		System.out.println("nameResPw===================" + nameResPw);
		System.out.println("phoneRes===================" + phoneResPw);
		System.out.println("memberid===================" + memberid);
		
		if (nameResPw > 0 && phoneResPw > 0 && memberid > 0) {
	        memberVO findPw = loginService.findPw(member);
	        Map<String, Object> map = responseMap(REST_SUCCESS, "비밀번호는 [ " + findPw.getMpassword() + " ] 입니다.");
	        map.put("url", "/geomin/login");
	        return map;
	    } else {    
	        Map<String, Object> map = responseMap(REST_FAIL, "아이디와 이름, 휴대폰 번호를 다시 확인해주세요.");
	        map.put("url", "/geomin/login");
	        return map;
	    }
	}
	/*
	// 비밀번호 찾기 - 임시 비밀번호
	@PostMapping("/issueTemporaryPassword")
	public @ResponseBody Map<String, Object> issueTemporaryPassword(@RequestParam("username") String username) {
	    // 임시 비밀번호 생성 로직
	    String temporaryPassword = generateTemporaryPassword();
	    
	    // 임시 비밀번호를 DB에 저장하거나 필요한 처리 수행
	    
	    Map<String, Object> responseMap = new HashMap<>();
	    responseMap.put("success", true);
	    responseMap.put("temporaryPassword", temporaryPassword);
	    
	    return responseMap;
	}
	*/
	
	 
	
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
