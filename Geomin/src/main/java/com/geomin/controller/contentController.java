package com.geomin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.VO.contentVO;
import com.geomin.service.contentService;

@Controller
@RequestMapping("/geomin/subscribe/*")
public class contentController {
	
	@Autowired
	private contentService contentService;
	
	@GetMapping("searchContent")
	public String searchContent(Model model){
		//모든 학습 컨텐츠 출력
		List<contentVO> list = contentService.getList();
		model.addAttribute("list", list);
		
		
		
		return "subscribe/searchContent";
	}
	
//	@PostMapping("searchContent")
//	public String searchContent(@RequestBody List<contentVO> checked_Data) {
//		System.out.println("checked_Data : " + checked_Data);
//		//체크박스가 선택된 라인의 데이터 처리
//		contentService.addSubContent(checked_Data);
//		
//		return "subscribe/searchContent";
//	}
	
	@PostMapping("searchContent")
	public void searchContent(@RequestBody List<contentVO> checked_Data) {
		System.out.println("checked_Data : " + checked_Data);
		//체크박스가 선택된 라인의 데이터 처리
		contentService.addSubContent(checked_Data);
	}
	
	@GetMapping("subscribeSearchContent")
	public String subscribeSearchContent(Model model) {
		//구독한 학습 컨텐츠 출력
		List<contentVO> list = contentService.getSubList();
		model.addAttribute("list", list);
		
		return "subscribe/subscribeSearchContent";
	}
	
}
