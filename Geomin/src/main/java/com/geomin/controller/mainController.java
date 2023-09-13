package com.geomin.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/geomin*")
public class mainController {
	
	@GetMapping("/main")
	public String Main() {
		return "main";
	}
	
	@GetMapping("/header/utilization")
	public String utilization() {
		return "/header/utilization";
	}
	
}
