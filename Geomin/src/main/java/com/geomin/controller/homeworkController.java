package com.geomin.controller;

import java.util.List;
import java.util.Map;

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
import com.geomin.VO.homeworkVO;
import com.geomin.service.homeworkService;

@Controller
@RequestMapping("/geomin*")
public class homeworkController extends CommonRestController{
	
	@Autowired
	homeworkService homeworkservice;
	
	@GetMapping("/teacher/homeworkEvaluation")
	public String homeworkEvaluation(Model model, homeworkVO homework) {
		
		return "/teacher/homeworkEvaluation";
	}
	 
	@GetMapping("/teacher/homeworkMain")
	public String getHomework(Model model, homeworkVO homework) {
		
		return "/teacher/homeworkMain";
	}
	// 그룹 리스트 조회
	@PostMapping("/homeworkGroup")
	public @ResponseBody Map<String, Object> homeworkGroup(@RequestBody homeworkVO vo) {
		try {
				Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
				
				System.out.println(vo);
				
				List<homeworkVO> groupList = homeworkservice.homeworkGroupList(vo);
				
				map.put("groupList", groupList);
				
				return map;
			
			} catch (Exception e) {
				e.printStackTrace();
				
				
				return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
			}
	}
	
	// 그룹선택하면 학생리스트 출력
	@PostMapping("/homeworkID")
	public @ResponseBody Map<String, Object> studentSelect(@RequestBody Criteria cri) {
		
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			
			List<homeworkVO> homeworklist = homeworkservice.studentSelect(cri);
			
			int total = homeworkservice.totalCnt(cri);
			
			
			PageDto  pageDto = new PageDto(cri, total);
			
			map.put("homeworklist", homeworklist);
			map.put("pageDto", pageDto);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
		}
	}
	
	
		@PostMapping("/homeworkUpdate")
		public @ResponseBody Map<String, Object> homeworkUpdate(@RequestBody homeworkVO vo) {
			
			try {
				Map<String, Object> map = responseMap(REST_SUCCESS, "숙제가 전송되었습니다");
				
				int res = homeworkservice.homeworkUpdate(vo);
				
				if(res == 0) {
					
					return responseMap(REST_FAIL, "숙제 전송중 예외사항이 발생 하였습니다.");
				}
				
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "숙제 전송중 예외사항이 발생 하였습니다.");
			}
		}
		
		@PostMapping("/howorkList")
		public @ResponseBody Map<String, Object> howorkList(@RequestBody homeworkVO vo) {
			
			try {
				Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
				
				List<homeworkVO> homeworklist = homeworkservice.studentHomeworkList(vo);
				
				map.put("homeworklist", homeworklist);
				
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "숙제 전송중 예외사항이 발생 하였습니다.");
			}
		}
		
		@PostMapping("/studentHomework")
		public @ResponseBody Map<String, Object> studentHomework(@RequestBody homeworkVO vo) {
			
			try {
				System.out.println(vo);
				
				Map<String, Object> map = responseMap(REST_SUCCESS, "숙제가 전송되었습니다");
				
				int res = homeworkservice.studentHomework(vo);
				
				if(res == 0) {
					
					return responseMap(REST_FAIL, "숙제 전송중 예외사항이 발생 하였습니다.");
				}
				
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "숙제 전송중 예외사항이 발생 하였습니다.");
			}
		}
		
		@PostMapping("/homeworkEvaluation")
		public @ResponseBody Map<String, Object> homeworkEvaluation(@RequestBody Criteria cri) {
			
			try {
				Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
				
				List<homeworkVO> homeworklist = homeworkservice.homeworkEva(cri);
				
				int total = homeworkservice.evaTotalCnt(cri);
				
				System.out.println(cri);
				
				PageDto  pageDto = new PageDto(cri, total);
				
				map.put("homeworklist", homeworklist);
				map.put("pageDto", pageDto);
				
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "예외사항이 발생 하였습니다.");
			}
		}
		
		@PostMapping("/HomeworkEva")
		public @ResponseBody Map<String, Object> HomeworkEva(@RequestBody homeworkVO vo) {
			
			try {
				Map<String, Object> map = responseMap(REST_SUCCESS, "숙제가 평가되었습니다");
				
				int res = homeworkservice.HomeworkEva(vo);
				
				if(res == 0) {
					
					return responseMap(REST_FAIL, "숙제 평가중 예외사항이 발생 하였습니다.");
				}
				
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "숙제 평가중 예외사항이 발생 하였습니다.");
			}
		}
}
