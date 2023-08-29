package com.geomin.service;

import org.springframework.stereotype.Service;

import com.geomin.VO.memberVO;

@Service
public interface loginService {

	public int idCheck(String memberid);
	
	public int register(memberVO memberVo);
	
	public memberVO login(memberVO memberVo);
	
	public memberVO getOne(String memberid);
	
	public int nameCheck(memberVO member);
	public int phoneCheck(memberVO member);
	public memberVO findId(memberVO member);
	
	public int idCheckPw(memberVO member);
	public int emailCheckPw(memberVO member);
	public memberVO findPw(memberVO member);
	
}
