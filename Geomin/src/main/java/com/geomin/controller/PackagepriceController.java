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

import com.geomin.VO.BoardVO;
import com.geomin.VO.Criteria;
import com.geomin.VO.PackagepriceVO;
import com.geomin.VO.PageDto;
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
			
			System.out.println("vo ===== "+vo);
			
			PackagepriceVO totalChart = packageprice.totalChart(vo);
			
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
	        
	        map.put("totalChart", totalChart);
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
			
			PackagepriceVO totalChart = packageprice.yearChart(vo);
			
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
	        
	        map.put("totalChart", totalChart);
	        map.put("monthList", monthList);
	        map.put("transactioncntList", transactioncntList);
	        map.put("datetotalsalesList", datetotalsalesList);
	        
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "매출 조회중 예외사항이 발생 하였습니다.");
		}
	}
	
	@PostMapping("/dayChart")
	public @ResponseBody Map<String, Object> dayChart(@RequestBody PackagepriceVO vo) {
		try {
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "매출 조회가 되었습니다.");
			
			PackagepriceVO totalChart = packageprice.dayChart(vo);
			
			List<String> dayList = new ArrayList<String>();
	        List<String> transactioncntList = new ArrayList<String>();
	        List<String> datetotalsalesList = new ArrayList<String>();
			
			System.out.println(vo.getYear());
			System.out.println(vo.getMonth());
			
			if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("1")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-31");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("1월은 " +vo.getDay1());
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("2")) {
				boolean isDivisibleBy4 = checkDivisibility(vo.getYear(), 4);
				if(isDivisibleBy4) {
					vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-29");
					vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
					System.out.println("2월은 " +vo.getDay1());
				}else {
					vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-28");
					vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
					System.out.println("2월은 " +vo.getDay1());
				}
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("3")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-31");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("3월은 " +vo.getDay1());
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("4")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-30");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("4월은 " +vo.getDay1());
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("5")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-31");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("5월은 " +vo.getDay1());
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("6")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-30");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("6월은 " +vo.getDay1());
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("7")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-31");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("7월은 " +vo.getDay1());
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("8")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-31");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("8월은 " +vo.getDay1());
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("9")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-30");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("9월은 " +vo.getDay1());
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("10")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-31");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("10월은 " +vo.getDay1());
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("11")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-30");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("11월은 " +vo.getDay1());
			}else if ((vo.getYear() != null && !vo.getYear().isEmpty()) && vo.getMonth().equals("12")) {
				vo.setDay1(vo.getYear()+"-"+vo.getMonth()+"-31");
				vo.setDay2(vo.getYear()+"-"+vo.getMonth()+"-1");
				System.out.println("12월은 " +vo.getDay1());
			}else {
				return responseMap(REST_FAIL, "매출 조회중 예외사항이 발생 하였습니다.");
			}
	       
			List<PackagepriceVO> list = packageprice.dayPrice(vo);
			
			for (PackagepriceVO packagePrice : list) {
				dayList.add(packagePrice.getDay() != null && !packagePrice.getDay().isEmpty() ? packagePrice.getDay() : "0");
	             transactioncntList.add(packagePrice.getTransactioncnt() != null && !packagePrice.getTransactioncnt().isEmpty() ? packagePrice.getTransactioncnt() : "0");
	             datetotalsalesList.add(packagePrice.getDatetotalsales() != null && !packagePrice.getDatetotalsales().isEmpty() ? packagePrice.getDatetotalsales() : "0");
	        }
			
			System.out.println("totalChart =========== "+totalChart);
			
			if (totalChart == null) {
			    totalChart = new PackagepriceVO();
			    totalChart.setMonth(vo.getMonth());
			    totalChart.setYear(vo.getYear());
			    totalChart.setTransactioncnt("0");
			    totalChart.setDatetotalsales("0");
			}
			
			map.put("totalChart", totalChart);
			map.put("dayList", dayList);
	        map.put("transactioncntList", transactioncntList);
	        map.put("datetotalsalesList", datetotalsalesList);
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "매출 조회중 예외사항이 발생 하였습니다.");
		}
		
	}

	 public static boolean checkDivisibility(String year, int divisor) {
	        // 문자열을 정수로 변환
	        int numericYear = Integer.parseInt(year);

	        // 나머지 계산
	        int remainder = numericYear % divisor;

	        // 나머지가 0이면 true, 아니면 false 반환
	        return remainder == 0;
	    }
	 
	 
	 @PostMapping("/priceList")
		public @ResponseBody Map<String, Object> boardList(@RequestBody Criteria cri) {
		 try {
			 Map<String, Object> map = responseMap(REST_SUCCESS, "리스트 조회");
			 
			 List<PackagepriceVO> priceList = packageprice.priceList(cri);
			 int total = packageprice.totalCnt(cri);
			 
			 PageDto  pageDto = new PageDto(cri, total);
			 
			 
			 map.put("priceList", priceList);
			 map.put("total", total);
			 map.put("pageDto", pageDto);
			 
			 return map;
		 } catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "리스트 조회중 예외사항이 발생 하였습니다.");
			}
	 }
	
}
