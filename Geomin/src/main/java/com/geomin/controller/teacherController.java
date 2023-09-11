package com.geomin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.VO.contentVO;
import com.geomin.VO.memberVO;
import com.geomin.service.contentService;
import com.geomin.service.teacherService;

@Controller
@RequestMapping("/geomin*")
public class teacherController extends CommonRestController{
	
	@Autowired
	private contentService contentService;
	
	@Autowired
	teacherService teacherService;
	

	
	/*
	@GetMapping("/teacher/teacherMain")
	public String groupjoin() {
		return "/teacher/teacherMain";
	}
	*/
	
	@GetMapping("/teacher/groupRegist")
	public String groupRegist(@RequestParam(name = "pkgName", required = false, defaultValue = "") String pkgName, Model model) { 
		List<contentVO> list1 = teacherService.getSubGroup();
		
		//
		if (!pkgName.isEmpty()) {
			model.addAttribute("list2", list1);
		}	
		model.addAttribute("pkgName", pkgName);
		
		List<contentVO> list = contentService.getSubList();
		model.addAttribute("list", list);
		return "/teacher/groupRegist";
	}
	
	@PostMapping("/teacher/groupRegist")
	public void groupRegist2(@RequestBody List<contentVO> groupData, Model model) {
		System.out.println("groupData : " + groupData);
		teacherService.regStudyGroup(groupData);
	}
	

	 
	 @PostMapping("/teacher/checkGroupid") 
	  public int checkGroupid(@RequestParam("groupid") contentVO groupid) {
	  System.out.println("groupid : " + groupid); 
	  
	  return 0; 
	  }

	
	@ResponseBody
	@RequestMapping(value = "/teacher/groupidCheck", method = RequestMethod.POST)
	public int postIdCheck(@RequestParam(name = "groupid") memberVO vo, HttpServletRequest req) throws Exception {

		List<memberVO> groupidCheck = teacherService.checkGroupid(vo);
		System.out.println("groupidCheck=========" + groupidCheck);

		int result = 0;

		if (groupidCheck != null) {
			result = 1;
		}
		
		return result;
	}
	
	
	// 그룹 신청한 학습자 리스트
	@GetMapping("/teacher/teacherMain")
	public String getGroup(Model model, memberVO vo) {
		System.out.println("vo : "+	vo);
		
		List<memberVO> list = teacherService.contentList();	
		
		model.addAttribute("contentRes", list);		
		
		return "/teacher/teacherMain";
	}
	
	
	// 그룹 신청한 학습자 조회
	@PostMapping("/contentId")
	public @ResponseBody Map<String, Object> studentjoin(@RequestBody memberVO vo, Model model) { 
		System.out.println("여기 된다111=====================");
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			List<memberVO> membervo = teacherService.contentOne(vo);
			System.out.println("여기도 된다2222=====================");
			
			System.out.println("membervo : " + membervo);
			map.put("membervo", membervo);
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
		}
	}
	

	
	/*
	 * // 그룹 신청한 학습자 그룹승인
	 * 
	 * @PostMapping("/joinStatus") public @ResponseBody Map<String, Object>
	 * joinjoinStatus(@RequestBody memberVO vo, Model model) {
	 * 
	 * try { System.out.println("여기도 된다3333=====================");
	 * System.out.println("updateJoinStatus (vo) ==========: " + vo);
	 * 
	 * int updateRes = teacherService.updateJoinStatus(vo);
	 * System.out.println("vo ==============================" +
	 * teacherService.updateJoinStatus(vo)); Map<String, Object> map =
	 * responseMap(REST_SUCCESS, "그룹 승인 완료!");
	 * 
	 * map.put("updateRes", updateRes);
	 * 
	 * return map;
	 * 
	 * } catch (Exception e) { e.printStackTrace(); return responseMap(REST_FAIL,
	 * "패키지 등록중 예외사항이 발생 하였습니다."); } }
	 */
	
//	@PostMapping("/geomin/joinStatus")
//	public @ResponseBody Map<String, Object> joinjoinStatus(@RequestBody List<String> memberIds, Model model) {
//		System.out.println("memberIds : " + memberIds);
//	    try {
//	        //List<String> memberIds = requestMap.get("memberIds");
//	        
//	        // 학습자의 memberid 목록을 이용하여 승인 여부를 업데이트
//	        int updateRes = teacherService.updateJoinStatus(memberIds);
//
//	        Map<String, Object> map = responseMap(REST_SUCCESS, "그룹 승인 완료!");
//	        map.put("updateRes", updateRes);
//
//	        return map;
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        return responseMap(REST_FAIL, "패키지 등록중 예외사항이 발생 하였습니다.");
//	    }
//	}
	
	@PostMapping("/joinStatus")
	public @ResponseBody Map<String, Object> joinjoinStatus(@RequestBody List<memberVO> memberidOutput_list) {
	    try {
	    	System.out.println("memberidOutput_list2 : " + memberidOutput_list);
	        
	        int updateRes = teacherService.updateJoinStatus(memberidOutput_list);
	        System.out.println("updateRes : " + updateRes);
	        
	        Map<String, Object> map = responseMap(REST_SUCCESS, "그룹 승인 완료!");
	        map.put("updateRes", updateRes);

	        return map;
	    } catch (Exception e) {
	       // e.printStackTrace();
	        return responseMap(REST_FAIL, "패키지 등록중 예외사항이 발생 하였습니다.");
	    }
	}
	
	

	
}
