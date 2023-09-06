package com.geomin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.VO.Criteria;
import com.geomin.VO.PageDto;
import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;
import com.geomin.service.ManagerService;
import com.geomin.service.loginService;


@Controller
@RequestMapping("/geomin*")
public class ManagerController extends CommonRestController{
	
	@Autowired
	ManagerService manager;
	
	@GetMapping("/manager")
	public String Manager() {
		return "/manager/garden";
	}
	
	@GetMapping("/board")
	public String board() {
		return "/manager/board";
	}
	
	@GetMapping("/salesTally")
	public String salesTally() {
		return "/manager/salesTally";
	}
	
	@GetMapping("/salesInquiry")
	public String salesInquiry() {
		return "/manager/salesInquiry";
	}
	
	@GetMapping("/qanda")
	public String qanda() {
		return "/manager/qanda";
	}
	
	@PostMapping("/packageInsert")
	public @ResponseBody Map<String, Object> packageInsert(@RequestBody packageVO vo, Model model) {
		
		try {
			int res = manager.packageInsert(vo);
			
			Map<String, Object> map = responseWriteMap(res);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 등록중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/packgeList")
	public @ResponseBody Map<String, Object> packgeList(@RequestBody Criteria cri) {
		
		try {
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			// 리스트 조회
			List<packageVO> packagelist = manager.packageList(cri);
			int total = manager.totalCnt(cri);
			PageDto  pageDto = new PageDto(cri, total);
			
			map.put("packagelist", packagelist);
			map.put("total", total);
			map.put("pageDto", pageDto);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 등록중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/packDeleteUpdate")
	public @ResponseBody Map<String, Object> packDeleteUpdate(@RequestBody packageVO vo) {
		
		try {
			
			int res = manager.packDeleteUpdate(vo);
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "정상적으로 처리 되었습니다.");
			
			map.put("pageNo", "1");
			
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 삭제중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/packUdate")
	public @ResponseBody Map<String, Object> packUdate(@RequestBody packageVO vo) {
		
		try {
			
			packageVO pakc = manager.getOnePack(vo);
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "정상적으로 처리 되었습니다.");
			
			map.put("packageVO", pakc);
			
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 삭제중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/packUdatelist")
	public @ResponseBody Map<String, Object> packUdatelist(@RequestBody packageVO vo) {
		
		try {
			
			int res = manager.packUpdate(vo);
			
			packageVO pakc = manager.getOnePack(vo);
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "정상적으로 처리 되었습니다.");
			
			map.put("packageVO", pakc);
			
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "패키지 삭제중 예외사항이 발생 하였습니다.");
		}
	}
	
	@Autowired
	loginService login;
	
	@GetMapping("/joinMemberInfo")
	public String joinMemberInfo() {
		return "joinMemberInfo";
	}
	
	@PostMapping("/joinMemberInfo")
	public @ResponseBody Map<String, Object> joinMemberInfo(@RequestBody memberVO memberVo, HttpSession session) {
		
		try {
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "정상적으로 처리 되었습니다.");
			
			memberVO member = login.login(memberVo);
			
			if (member != null) {
				session.removeAttribute("member");
				
				session.setAttribute("member", member);
			}else {
				return responseMap(REST_FAIL, "회원 정보를 불러오는 중  예외사항이 발생 하였습니다.");
			}
			
			if(member.getMaddr() == null) {
				member.setMaddr("주소 정보가 없습니다.");
			}
			
			if ("A".equals(member.getMtype())) {
			    member.setMtype("운영관리자");
			} else if ("T".equals(member.getMtype())) {
			    member.setMtype("학습관리자");
			} else if ("S".equals(member.getMtype())) {
			    member.setMtype("학습자");
			}

			if ("M".equals(member.getMgender())) {
			    member.setMgender("남자");
			} else if ("W".equals(member.getMgender())) {
			    member.setMgender("여자");
			}
			
			if ("notAgree".equals(member.getMarketingagree())) {
			    member.setMarketingagree("비동의");
			} else if ("smsAgree".equals(member.getMarketingagree())) {
			    member.setMarketingagree("문자");
			} else if ("emailAgree".equals(member.getMarketingagree())) {
			    member.setMarketingagree("이메일");
			}
			
			System.out.println(member);
			
			map.put("member", member);
			
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "회원 정보를 불러오는 중 예외사항이 발생 하였습니다.");
		}
		
	}
	
	@PostMapping("/joinMembers")
	public @ResponseBody Map<String, Object> joinMembers(@RequestBody memberVO memberVo) {
		
		try {
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "정상적으로 처리 되었습니다.");
			
			memberVO member = login.login(memberVo);
			
			System.out.println(member);
			
			// mbirthdate를 파싱하여 년, 월, 일로 분리
	        String mbirthdate = member.getMbirthdate();
	        String[] dateParts = mbirthdate.split("-");
	        String year = dateParts[0];
	        String month = dateParts[1];
	        String day = dateParts[2];
	        
	        String memail = member.getMemail();
	        String[] emailParts = memail.split("@");
	        String mail = emailParts[0];
	        String mail2 = emailParts[1];
	        
	        System.out.println(mail2);
	        
			map.put("mail2", mail2);
			map.put("mail", mail);
	        map.put("year", year);
	        map.put("month", month);
	        map.put("day", day);
	        
			map.put("member", member);
			
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "회원 정보를 불러오는 중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/InfoUpdate")
	public @ResponseBody Map<String, Object> InfoUpdate(@RequestBody memberVO memberVo) {
		
		try {
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "회원 정보가 업데이트 되었습니다");
			
			int res = login.InfoUpdate(memberVo);
			
			if(res == 0) {
				return responseMap(REST_FAIL, "회원 정보를 업데이트하는 중 예외사항이 발생 하였습니다.");
			}
			
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "회원 정보를 업데이트하는 중 예외사항이 발생 하였습니다.");
		}
	}
}
