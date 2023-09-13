package com.geomin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.geomin.service.KakaoPay;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class KakaoPayController {
	
	@Autowired
	private KakaoPay kakaopay;
	
	//@Setter(onMethod_ = @Autowired)
    //private KakaoPay kakaopay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        System.out.println("@GetMapping kakaoPay");
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay() {
    	System.out.println("@PostMapping kakaoPay");
        
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
    }
}
