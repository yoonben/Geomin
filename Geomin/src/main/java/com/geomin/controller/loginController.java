package com.geomin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

import com.geomin.VO.groupstudentVO;
import com.geomin.VO.memberVO;
import com.geomin.service.loginService;

@Controller
@RequestMapping("/geomin*")
public class loginController extends CommonRestController {

	@Autowired
	loginService loginService;

	// 비밀번호 암호화
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	// 회원가입 시 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(@RequestParam(name = "loginId") String loginId, HttpServletRequest req) throws Exception {

		String memberidVal = req.getParameter("loginId");
		System.out.println("memberid=========" + memberidVal);

		int idCheck = loginService.idCheck(memberidVal);
		System.out.println("idCheck=========" + idCheck);

		int result = 0;

		if (idCheck == 1) {
			result = 1;
		}
		return result;
	}

	// 회원가입 (DB저장)
	@PostMapping("/login")
	public String register(@ModelAttribute memberVO memberVo) {

		System.out.println("memberVo===================(1)" + memberVo);
		try {

			System.out.println("생일=================" + memberVo.getMbirthdate());
			System.out.println("memberVo===================(1)" + memberVo);
			String inputPw = memberVo.getMpassword();
			String pwd = pwdEncoder.encode(inputPw);
			memberVo.setMpassword(pwd);
			int res = loginService.register(memberVo);
			System.out.println("memberVo===================(2)" + memberVo);
			if (res == 0) {
				return "/joinMember";
			} else {
				return "/login";
			}
			// TODO : 데이터 저장이 성공한 경우에만 페이지 이동을 하도록 조건을 추가

		} catch (Exception e) {
			System.err.println("회원가입 중 예외발생하였습니다.");
			e.printStackTrace();
		}

		return "/login";
	}

	
	
	// 로그인 처리
	@PostMapping(value = "/main", produces = "application/json")
	public ResponseEntity<Map<String, Object>> loginAction(@RequestBody memberVO member, HttpSession session) {
		
		System.out.println("id : " + member.getMemberid());
	    System.out.println("pw : " + member.getMpassword());
	    
	    memberVO membervo = loginService.login(member);
	    Map<String, Object> map = new HashMap<String, Object>();
	    

	    if (membervo != null && pwdEncoder.matches(member.getMpassword(), membervo.getMpassword())) {
	    	map.put("result", "success");
	    	
	        session.setAttribute("member", membervo);
	        session.setAttribute("memberid", membervo.getMemberid());
	        
	        map.put("myType", membervo.getMtype());

	    } else {
	        map.put("result", "fail");
	        map.put("message", "아이디와 비밀번호를 확인해주세요.");
	    }

	    return ResponseEntity.ok(map);
	}
	
	
	
	//로그인 성공 후 그룹가입 여부에 따른 처리 
	@PostMapping("/studentLogin")
	public @ResponseBody Map<String, Object> loginMemberCheck(@RequestBody memberVO member, HttpSession session){
	    // 그룹 회원 여부에 따라 isGroupMember 값을 설정
		System.out.println();
		
	    int loginRes = loginService.loginCheck(member.getStudentid());
	    
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    
	    if (loginRes >= 1) {
            map.put("result", "success");
            return responseMap(REST_SUCCESS, "로그인 성공(숙제페이지 이동)");
        } else {
            map.put("result", "false");
            System.out.println("여기에 왔다========================");
            return responseMap(REST_FAIL, "로그인 성공(그룹 신청 페이지 이동)");
        }
	}
	
	
	
	// 아이디 찾기
	@PostMapping("/findId")
	public @ResponseBody Map<String, Object> findId(@RequestBody memberVO member) {

		int nameRes = loginService.nameCheck(member);
		int phoneRes = loginService.phoneCheck(member);

		if (nameRes > 0 && phoneRes > 0) {
			memberVO findId = loginService.findId(member);

			Map<String, Object> map = responseMap(REST_SUCCESS, "아이디는 [ " + findId.getMemberid() + " ] 입니다.");
			map.put("url", "/geomin/login");
			return map;
		} else {
			return responseMap(REST_FAIL, "이름과 휴대폰 번호를 다시 확인해주세요.");
		}
	}
	
	
	/* 비밀번호 찾기 */
	@PostMapping("/findPw")
	public @ResponseBody Map<String, Object> findPw(@RequestBody memberVO member, HttpServletResponse response, String div1, String pw
														, HttpSession session) throws Exception{
		
		int idRes = loginService.idCheckPw(member);
		int memailRes = loginService.emailCheckPw(member);
		
		if(idRes > 0 && memailRes > 0) {
			
			// 임시 비밀번호 생성
			pw = "";
			for (int i = 0; i < 10; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			pw += "1!";
			member.setMpassword(pw);
			System.out.println("pw========================= " + pw);
			
			// DB에 변경된 비밀번호 저장
	        loginService.updatePw(member);
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "임시 비밀번호는 [ " + member.getMpassword() + " ] 입니다. 즉시 변경바랍니다.");
		
			session.setAttribute("memberPw", member.getMpassword());
			map.put("url", "/geomin/login");
			return map;
		} else {
			return responseMap(REST_FAIL, "이름과 이메일 주소를 다시 확인해주세요.");			
		}
	}
	

	 // 비밀번호 변경 
	@PostMapping("/updatePw")
	public @ResponseBody Map<String, Object> updatePw(@RequestBody memberVO member, HttpSession session) throws Exception{
		//int memberpw = (int)session.getAttribute("memberPw");
		
		//System.out.println("memberpw=================="  + memberpw);
		// int inputPw = loginService.updatePw2(member);		
		// System.out.println("inputPw=================="  + inputPw);
		
		//if(inputPw > 0) {
			
//			memberVO getone = loginService.getOne(member.getMpassword());
//			System.out.println("getone=================" + getone);
//			int memberPw = loginService.updatePw(getone);
//			
//			if(memberPw > 0) {
			String pwd = pwdEncoder.encode(member.getMpassword());
			member.setMpassword(pwd);
			
			// DB에 변경된 비밀번호 저장
	        loginService.updatePw(member);
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "임시 비밀번호가 변경되었습니다.");
			map.put("url", "/geomin/login");
			return map;	
		//} else {
		//	return responseMap(REST_FAIL, "다시 확인해주세요.");		
		//}
		
	}
	
	
	/*
	// 비밀번호 찾기
	@PostMapping("/findPw")
	public @ResponseBody Map<String, Object> findPw(@RequestBody memberVO member) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int idRes = loginService.idCheckPw(member);
		int emailRes = loginService.emailCheckPw(member);
		
		if (idRes > 0 && emailRes > 0) {
			memberVO vo = loginService.login(member);
			System.out.println("memail====================" + vo.getMemail());
			System.out.println("memberid====================" + vo.getMemberid());
			map.put("memail", vo.getMemail());
			map.put("memberid", vo.getMemberid());
			
			return map;
		} else {
			return responseMap(REST_FAIL, "아이디를 찾을 수 없습니다.");
		}

	}
	
	 * // 비밀번호 찾기
	 * 
	 * @PostMapping("/findPw") public @ResponseBody Map<String, Object>
	 * findPw(@RequestBody memberVO member){
	 * 
	 * System.out.println("member======================" +
	 * loginService.nameCheckPw(member)); int nameResPw =
	 * loginService.nameCheckPw(member); int phoneResPw =
	 * loginService.phoneCheckPw(member); int memberid =
	 * loginService.idCheckPw(member);
	 * 
	 * 
	 * System.out.println("nameResPw===================" + nameResPw);
	 * System.out.println("phoneRes===================" + phoneResPw);
	 * System.out.println("memberid===================" + memberid);
	 * 
	 * 
	 * if (nameResPw > 0 && phoneResPw > 0 && memberid > 0) { memberVO findPw =
	 * loginService.findPw(member);
	 * 
	 * System.out.println("findPw=============" + loginService.findPw(member));
	 * 
	 * // 암호화 된 비밀번호 풀어주는 작업
	 * 
	 * String key = findPw.getMpassword();
	 * 
	 * AES128 aes = new AES128(key);
	 * 
	 * String txt = findPw.getMpassword(); String encrypt = aes.encrypt(txt); String
	 * decrypt = aes.decrypt(encrypt);
	 * 
	 * 
	 * System.out.println("평문 : " + txt); System.out.println("암호화 : " + encrypt);
	 * System.out.println("복호화 : " + decrypt);
	 * 
	 * // 비밀번호 길이 int pwdSize = decrypt.length();
	 * 
	 * String resultPwd_1 = decrypt.substring(0, pwdSize);
	 * System.out.println("resultPwd_1=============" + resultPwd_1);
	 * 
	 * // 뒤의 절반은 *로 표시 String tmp = ""; if (pwdSize%2 ==1) { // 홀수인 경우 * 한개 더 추가
	 * for( int i=0; i<pwdSize+1; i++ ) { tmp += "*"; } } else { for( int i=0;
	 * i<pwdSize; i++ ) { tmp += "*"; } }
	 * 
	 * String resultPwd = resultPwd_1 + tmp;
	 * 
	 * member.setMpassword(resultPwd);
	 * 
	 * 
	 * //String realPwd = member1.pwFindDecry(member.getMpassword()); String realPwd
	 * = loginService.findPw(member).getMpassword(); String decryPwd =
	 * member1.decryptAES(realPwd, key); System.out.println("realPwd=============" +
	 * realPwd); System.out.println("decryPwd=============" + decryPwd);
	 * 
	 * 
	 * // 암호화 된 비밀번호 풀어주는 작업 String key = "secret Key"; String realPwd =
	 * userDao.pwFindDecry(userTo).getPwd(); String decryPwd =
	 * userDao.decryptAES(realPwd, key);
	 * 
	 * 
	 * // 비밀번호 길이 int pwdSize = decryPwd.length();
	 * 
	 * String resultPwd_1 = decryPwd.substring(0, pwdSize);
	 * System.out.println("resultPwd_1=============" + resultPwd_1);
	 * 
	 * // 뒤의 절반은 *로 표시 String tmp = ""; if (pwdSize%2 ==1) { // 홀수인 경우 * 한개 더 추가
	 * for( int i=0; i<pwdSize+1; i++ ) { tmp += "*"; } } else { for( int i=0;
	 * i<pwdSize; i++ ) { tmp += "*"; } }
	 * 
	 * String resultPwd = resultPwd_1 + tmp;
	 * 
	 * member.setMpassword(resultPwd);
	 * 
	 * Map<String, Object> map = responseMap(REST_SUCCESS, "비밀번호는 [ " + resultPwd +
	 * " ] 입니다."); map.put("url", "/geomin/login"); return map; } else { Map<String,
	 * Object> map = responseMap(REST_FAIL, "아이디와 이름, 휴대폰 번호를 다시 확인해주세요.");
	 * map.put("url", "/geomin/login"); return map; } }
	 * 
	 * @RequestMapping(value = "/findPw") public String findPw(HttpServletRequest
	 * request, HttpServletResponse response) throws Exception { int flag = 2;
	 * 
	 * memberVO member = new memberVO();
	 * 
	 * String memberid = request.getParameter("memberid"); String mname =
	 * request.getParameter("mname"); String mphone =
	 * request.getParameter("mphone");
	 * 
	 * member.setMemberid(memberid); member.setMname(mname);
	 * member.setMphone(mphone);
	 * 
	 * int result_lookup = member.pwFind_Lookup(userTo); if (result_lookup == 1) {
	 * // 회원있음 // System.out.println("lookup : " + result_lookup);
	 * 
	 * //메일확인 int pwFind_ok = userDao.pwFind_ok(userTo); //
	 * System.out.println("pwFind_ok : " + pwFind_ok);
	 * 
	 * if (pwFind_ok == 1) { // 메일 일치 userTo = userDao.pwFind_select(userTo);
	 * 
	 * // 암호화 된 비밀번호 풀어주는 작업 String key = "secret Key"; String realPwd =
	 * userDao.pwFindDecry(userTo).getPwd(); String decryPwd =
	 * userDao.decryptAES(realPwd, key);
	 * 
	 * // 비밀번호 길이를 2로 나누어서 int pwdSize = decryPwd.length()/2; // System.out.println(
	 * pwdSize );
	 * 
	 * String resultPwd_1 = decryPwd.substring(0, pwdSize );
	 * 
	 * // 뒤의 절반은 *로 표시 String tmp = ""; if (pwdSize%2 ==1) { // 홀수인 경우 * 한개 더 추가
	 * for( int i=0; i<pwdSize+1; i++ ) { tmp += "*"; } } else { for( int i=0;
	 * i<pwdSize; i++ ) { tmp += "*"; } } String resultPwd = resultPwd_1 + tmp;
	 * 
	 * flag = 0;
	 * 
	 * // 표시될 비밀번호를 pwd에 담음 userTo.setPwd(resultPwd); //
	 * System.out.println("getPwd : " + userTo.getPwd());
	 * 
	 * request.setAttribute("pwd", userTo.getPwd()); request.setAttribute("id", id);
	 * 
	 * } else if(pwFind_ok==0) { // 메일x flag = 1;
	 * 
	 * } else { // 기타오류 flag = 3; } } else if (result_lookup == 0) { // 회원없음 flag =
	 * 2; } else { // 기타오류 flag = 3; } request.setAttribute("flag", flag);
	 * 
	 * return "user/pwFindForm_ok"; }
	 * 
	 * // 비밀번호 찾기 - 임시 비밀번호
	 * 
	 * @PostMapping("/issueTemporaryPassword") public @ResponseBody Map<String,
	 * Object> issueTemporaryPassword(@RequestParam("username") String username) {
	 * // 임시 비밀번호 생성 로직 String temporaryPassword = generateTemporaryPassword();
	 * 
	 * // 임시 비밀번호를 DB에 저장하거나 필요한 처리 수행
	 * 
	 * Map<String, Object> responseMap = new HashMap<>(); responseMap.put("success",
	 * true); responseMap.put("temporaryPassword", temporaryPassword);
	 * 
	 * return responseMap; }
	 */

	@GetMapping("/joinMember")
	public String joinMember() {
		return "joinMember";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}

	
	  //회원정보 조회
	  /*
	  @RequestMapping(value = "/geomin/joinMemberInfo", method ={RequestMethod.GET, RequestMethod.POST}) 
	  public String getOne(HttpSession session, memberVO vo, Model model) { 
		  try { memberVO member = (memberVO)session.getAttribute("memberid"); //하나의 회원 조회 memberVO 
		  
		  	membervo = loginService.getOne(member.getMemberid());
		  	session.setAttribute("member", membervo);
	  
		  	return "/joinMemberInfo";
	  
		  	} catch (Exception e) { return ""; } 
		  }
	  */
	 

}
