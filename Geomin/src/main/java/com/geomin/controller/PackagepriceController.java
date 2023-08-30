package com.geomin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geomin.VO.PackagepriceVO;
import com.geomin.service.PackagepriceService;

@Controller
@RequestMapping("/geomin*")
public class PackagepriceController extends CommonRestController{

	@Autowired
	PackagepriceService packageprice;
	
	@PostMapping("/yearChart")
	public @ResponseBody Map<String, Object> yearChart(@RequestBody PackagepriceVO vo) {
		
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "매출 조회가 되었습니다.");
			
			List<PackagepriceVO> list = packageprice.yearPrice(vo);

	        List<String> yearList = new ArrayList<String>();
	        List<String> transactioncntList = new ArrayList<String>();
	        List<String> datetotalsalesList = new ArrayList<String>();
	        
	        for (PackagepriceVO packagePrice : list) {
	        	 yearList.add(packagePrice.getYear() != null && !packagePrice.getYear().isEmpty() ? packagePrice.getYear() : "0");
	             transactioncntList.add(packagePrice.getTransactioncnt() != null && !packagePrice.getTransactioncnt().isEmpty() ? packagePrice.getTransactioncnt() : "0");
	             datetotalsalesList.add(packagePrice.getDatetotalsales() != null && !packagePrice.getDatetotalsales().isEmpty() ? packagePrice.getDatetotalsales() : "0");
	        }
	        
	        System.out.println("list : "+list);
	        System.out.println("yearList : "+yearList);
	        System.out.println("transactioncntList : "+transactioncntList);
	        System.out.println("datetotalsalesList : "+datetotalsalesList);
	        
	        map.put("yearList", yearList);
	        map.put("transactioncntList", transactioncntList);
	        map.put("datetotalsalesList", datetotalsalesList);
	        
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "매출 조회중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/monthChart")
	public @ResponseBody Map<String, Object> monthChart(@RequestBody PackagepriceVO vo) {
		
		try {
			Map<String, Object> map = responseMap(REST_SUCCESS, "매출 조회가 되었습니다.");
			
			List<PackagepriceVO> list = packageprice.monthPrice(vo);

	        List<String> monthList = new ArrayList<String>();
	        List<String> transactioncntList = new ArrayList<String>();
	        List<String> datetotalsalesList = new ArrayList<String>();
	        
	        for (PackagepriceVO packagePrice : list) {
	        	 monthList.add(packagePrice.getMonth() != null && !packagePrice.getMonth().isEmpty() ? packagePrice.getMonth() : "0");
	             transactioncntList.add(packagePrice.getTransactioncnt() != null && !packagePrice.getTransactioncnt().isEmpty() ? packagePrice.getTransactioncnt() : "0");
	             datetotalsalesList.add(packagePrice.getDatetotalsales() != null && !packagePrice.getDatetotalsales().isEmpty() ? packagePrice.getDatetotalsales() : "0");
	        }
	        
	        System.out.println("yearList : "+monthList);
	        System.out.println("transactioncntList : "+transactioncntList);
	        System.out.println("datetotalsalesList : "+datetotalsalesList);
	        
	        map.put("yearList", monthList);
	        map.put("transactioncntList", transactioncntList);
	        map.put("datetotalsalesList", datetotalsalesList);
	        
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "매출 조회중 예외사항이 발생 하였습니다.");
		}
	}
	
}
