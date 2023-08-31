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

		
		
		//helloService.subContent();
		return "subscribe/searchContent";
	}
	
	@PostMapping("searchContent")
	public String searchContent(@RequestBody HelloVO checked_Data) {
		System.out.println("checked_Data : " + checked_Data);
		//Map<String, Object> valuesMap = new HashMap<>();
		//for (HelloVO helloVO : checked_Data) {
	        // helloVO에서 원하는 값들을 꺼내서 처리
//	        String PkgName = helloVO.getPkgName();
//	        int Personnel = helloVO.getPersonnel();
//	        String fixedPrice = helloVO.getFixedPrice();
//	        String finalPrice = helloVO.getFinalPrice();
//	        String difficulty = helloVO.getDifficulty();
//	        String pkgContent = helloVO.getPkgContent();
//			valuesMap.put("pkgName", helloVO.getPkgName());
//	        valuesMap.put("personnel", helloVO.getPersonnel());
//	        valuesMap.put("fixedPrice", helloVO.getFixedPrice());
//	        valuesMap.put("finalPrice", helloVO.getFinalPrice());
//	        valuesMap.put("difficulty", helloVO.getDifficulty());
//	        valuesMap.put("pkgContent", helloVO.getPkgContent());
//	    }
		
		helloService.addSubContent(checked_Data);
		
		
		return "subscribe/searchContent";
	}
	
	@GetMapping("subscribeSearchContent")
	public String subscribeSearchContent(Model model) {
		List<HelloVO> list = helloService.getSubList();
		model.addAttribute("list", list);
		
		return "subscribe/subscribeSearchContent";
	}
	
//	@PostMapping("searchContent")
//	public void searchContent2(Model model){
//		
//		//HelloVO helloVO = new HelloVO();
//		
//		
//	}
}
