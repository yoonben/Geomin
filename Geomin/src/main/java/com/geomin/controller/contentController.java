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
import com.geomin.service.KakaoPay;
import com.geomin.service.contentService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/geomin/subscribe/*")
public class contentController {
	
	@Autowired
	private contentService contentService;
	
	@Autowired KakaoPay kakaoPay;
	
	@GetMapping("searchContent")
	public String searchContent(Model model){
		//모든 학습 컨텐츠 출력
		List<contentVO> list = contentService.getList();
		model.addAttribute("list", list);
		
		//구독한 학습 컨텐츠 아이디 찾아오기
		List<contentVO> pkgId = contentService.getpkgId();
		model.addAttribute("pkgId", pkgId);
		
		return "subscribe/searchContent";
	}
	
	@PostMapping("searchContent")
	@ResponseBody
	public int searchContent(@RequestBody List<contentVO> checked_Data) {
		System.out.println("checked_Data : " + checked_Data);
		//체크박스가 선택된 라인의 데이터 처리
		int result = contentService.addSubContent(checked_Data);

		if (result != 0) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
		//kakaoPay.kakaoPayInfo(checked_Data);
	}
	
	@GetMapping("subscribeSearchContent")
	public String subscribeSearchContent(Model model) {
		//구독한 학습 컨텐츠 출력
		List<contentVO> getSubList = contentService.getSubList();
		//System.out.println("getSubList : " + getSubList);
		model.addAttribute("getSubList", getSubList);
		
		return "subscribe/subscribeSearchContent";
	}
}
