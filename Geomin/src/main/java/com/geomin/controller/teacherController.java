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
import com.geomin.VO.groupstudentVO;
import com.geomin.VO.memberVO;
import com.geomin.VO.packageVO;
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
		
		if (!pkgName.isEmpty()) {
			List<contentVO> list1 = teacherService.getSubGroup();
			model.addAttribute("list1", list1);
			//System.out.println("pkgName : " + pkgName);
		}	
		model.addAttribute("pkgName", pkgName);
		
		if(pkgName.isEmpty()) {
			List<contentVO> list = contentService.getSubList();
			model.addAttribute("list", list);
		}
		return "/teacher/groupRegist";
	}
	
	@PostMapping("/teacher/groupRegist")
	public void groupRegist2(@RequestBody List<contentVO> groupData, Model model) {
		System.out.println("groupData : " + groupData);
		teacherService.regStudyGroup(groupData);
	}
	
//	@PostMapping("/teacher/groupidCheck")
//	public int groupIdCheck(@RequestParam(name = "groupid") contentVO groupid) {
//		System.out.println("groupid : " + groupid);
//		List<contentVO> groupidCheck = teacherService.checkGroupid(groupid);
//		
//		int result = 0;
//		
//		if (groupidCheck != null) {
//			result = 1;
//		}
//		
//		return result;
//	}
	
	
	//@PostMapping("/teacher/groupidCheck")
	@RequestMapping(value = "/teacher/groupidCheck", method = RequestMethod.POST)
	@ResponseBody
	public int groupIdCheck(String groupid)throws Exception {
		System.out.println("groupid : " + groupid);
		
		int result = teacherService.checkGroupid(groupid);
		
		if (result != 0) {
			result = 1;
		}else {
			result = 0;
		}
		
		return result;
	}
	
	
	
	// 그룹 신청한 학습자 리스트
	@GetMapping("/teacher/teacherMain")
	public String getGroup(Model model, memberVO vo) {	
		
		return "/teacher/teacherMain";
	}
	
	@PostMapping("/joiningGroup")
	public @ResponseBody Map<String, Object> joiningGroup(@RequestBody memberVO vo, Model model) { 
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			List<packageVO> groupList = teacherService.contentList(vo.getMemberid());
			
			map.put("groupList", groupList);
			
			return map;
			

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
		}
	}
	
	// 그룹 신청한 학습자 조회
	@PostMapping("/contentId")
	public @ResponseBody Map<String, Object> studentjoin(@RequestBody memberVO vo, Model model) { 
		
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			List<memberVO> memberList = teacherService.contentOne(vo);
			
			map.put("groupList", memberList);
			map.put("groupid", vo.getGroupid());
			
			
			return map;
			
		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
		}
	}
	

	
	@PostMapping("/joinStatus")
	public @ResponseBody Map<String, Object> joinjoinStatus(@RequestBody groupstudentVO groupstudent) {
	    try {
	    	
	    	System.out.println(groupstudent.getStudentidList());
	    	
	    	List<String> studentidList = groupstudent.getStudentidList();
	    	
	    	for (int i = 0; i < studentidList.size(); i++) {
	    		
	    	    System.out.println(studentidList.get(i));
	    	    
	    	    groupstudentVO groupjoinstatusOne = teacherService.groupjoinstatusOne(studentidList.get(i));
	    	    
	    	    System.out.println(studentidList.get(i)+" : "+groupjoinstatusOne);
	    	    
	    	    if ("Y".equals(groupjoinstatusOne.getGroupjoinstatus())) {
		    		
		    	    System.out.println(groupstudent);
		    	    
		    	    int res = teacherService.updateJoinStatus(studentidList.get(i));
		    	    
	    	    	if(res > 0) {
	    	    		
	    	    		int res2 = teacherService.curpersonnelDown(groupstudent.getPkgid());
	    	    		
	    	    		if(res2 == 0) {
	    	    			return responseMap(REST_FAIL, "패키지 인원 증가 중 예외사항이 발생하였습니다.");
	    	    		}
		    	    	

	    	    	}else {
	    	    		return responseMap(REST_FAIL, "그룹 업데이트 중 예외사항이 발생하였습니다.");
	    	    	}
		    	} else if ("N".equals(groupjoinstatusOne.getGroupjoinstatus())) {
		    		int totalGroupStu = teacherService.totalGroupStu(groupstudent.getGroupid());
			    	
			    	int totalgroupmem = teacherService.totalgroupmem(groupstudent.getGroupid());
			    	
		    	    if(totalgroupmem > totalGroupStu) {
		    	    	int res = teacherService.updateJoinStatus(studentidList.get(i));
		    	    	
		    	    	if(res > 0) {
		    	    		
		    	    		int res2 = teacherService.curpersonnelUP(groupstudent.getPkgid());
		    	    		
		    	    		if(res2 == 0) {
		    	    			return responseMap(REST_FAIL, "패키지 인원 증가 중 예외사항이 발생하였습니다.");
		    	    		}
		    	    		
		    	    		
			    	    	Map<String, Object> map = responseMap(REST_SUCCESS, "그룹 승인 완료!");
			    	    	
		    	    	}else {
		    	    		return responseMap(REST_FAIL, "그룹 업데이트 중 예외사항이 발생하였습니다.");
		    	    	}
		    	    } else{
		    	    	return responseMap(REST_FAIL, "그룹 인원 초과");
		    	    }
		    	} else {
		    	    return responseMap(REST_FAIL, "그룹 등록 중 예외사항이 발생하였습니다.");
		    	}
		    	
	    	}
	    	
	    	Map<String, Object> map = responseMap(REST_SUCCESS, "그룹 승인(취소) 완료");
	    	
	    	return map;
	    	
	       
	    } catch (Exception e) {
	       // e.printStackTrace();
	        return responseMap(REST_FAIL, "패키지 등록중 예외사항이 발생 하였습니다.");
	    }
	}
	
	

	
}
