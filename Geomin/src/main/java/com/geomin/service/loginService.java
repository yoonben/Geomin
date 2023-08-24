package com.geomin.service;

import org.springframework.stereotype.Service;

import com.geomin.VO.memberVO;

@Service
public interface loginService {

	public int idCheck(String memberid);
	
	public String register(memberVO memberVo);
	
	public memberVO login(memberVO memberVo);
}
