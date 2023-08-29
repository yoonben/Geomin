package com.geomin.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.geomin.VO.HelloVO;
import com.geomin.service.HelloService;

@Controller
@RequestMapping("/geomin/subscribe/*")
public class HelloController {
	
	@Autowired
	private HelloService helloService;
	
	@GetMapping("searchContent")
	public String searchContent(Model model){
		List<HelloVO> list = helloService.getList();
		model.addAttribute("list", list);
		
		helloService.subContent();
		return "subscribe/searchContent";
	}
	
	@GetMapping("subscribeSearchContent")
	public String subscribeSearchContent(Model model) {
		List<HelloVO> list = helloService.getSubList();
		model.addAttribute("list", list);
		
		return "subscribe/subscribeSearchContent";
	}
	//★★★★★★★★ 지금 jsp에서 difficulty.difficulty 가 확인되지 않아요!!!
	
//	@PostMapping("searchContent")
//	public void searchContent2(Model model){
//		
//		//HelloVO helloVO = new HelloVO();
//		
//		
//	}
}
